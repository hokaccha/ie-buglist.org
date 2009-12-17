package Ark::Test;
use Any::Moose;

use HTTP::Request;
use HTTP::Cookies;
use Plack::Test;

use FindBin;
use Path::Class qw/dir/;

use Ark::Test::Context;

sub import {
    my ($class, $app_class, @rest) = @_;
    my $caller = caller;
    my %option = @rest;

    return unless $app_class;

    Any::Moose::load_class($app_class) unless Any::Moose::is_class_loaded($app_class);

    my $persist_app = undef;
    my $cookie;

    {
        no strict 'refs';
        no warnings 'redefine';

        *{ $caller . '::request'} = sub {
            my $app;
            unless ($persist_app) {
                $app = $app_class->new;

                my @components = map { "${app_class}::${_}" }
                    @{ $option{components} || [] };
                $app->load_component($_) for @components;

                if ($option{minimal_setup}) {
                    $app->setup_home;

                    $app->path_to('action.cache')->remove;

                    my $child = fork;
                    if ($child == 0) {
                        $app->setup_minimal;
                        exit;
                    }
                    elsif (!defined($child)) {
                        die $!;
                    }

                    waitpid $child, 0;

                    $app->setup_minimal;
                }
                else {
                    $app->setup;
                }
                $app->config->{home} ||= dir($FindBin::Bin);
            }

            if ($option{reuse_connection}) {
                if ($persist_app) {
                    $app = $persist_app;
                }
                else {
                    $persist_app = $app;
                    $cookie = HTTP::Cookies->new;
                }
            }

            my $req = ref($_[0]) eq 'HTTP::Request' ? $_[0] : HTTP::Request->new(@_);
            if ($cookie) {
                $req->uri( URI->new('http://localhost' . $req->uri->path_query ) );
                $req->header( Host => 'localhost' );
                $cookie->add_cookie_header($req) unless $req->header('Cookie');
            }

            my $res;
            test_psgi(
                app    => $app->handler,
                client => sub {
                    my $cb = shift;
                    $res = $cb->($req);
                },
            );

            if ($cookie) {
                $res->{_request} = $req;
                $cookie && $cookie->extract_cookies($res);
            }

            $app->path_to('action.cache')->remove if $option{minimal_setup};

            $res;
        };

        *{ $caller . '::get' } = sub {
            &{$caller . '::request'}(GET => @_)->content;
        };

        *{ $caller . '::reset_app' } = sub() {
            undef $persist_app;
            undef $cookie;
        };

        *{ $caller . '::ctx_request'} = sub {
            unless (Ark::Context->meta->does_role('Ark::Test::Context')) {
                Ark::Context->meta->make_mutable unless any_moose eq 'Mouse';
                Ark::Test::Context->meta->apply( Ark::Context->meta );
                Ark::Context->meta->make_immutable unless any_moose eq 'Mouse';
            }

            my $res = &{$caller . '::request'}(@_);
            return $res, context();
        };

        *{ $caller . '::ctx_get' } = sub {
            my ($res, $c) = &{$caller . '::ctx_request'}(GET => @_);
            return $res->content, $c;
        };
    }
}

do {
    my $context;
    sub context {
        if ($_[0]) {
            $context = $_[0];
        }
        $context;
    }
};

1;

