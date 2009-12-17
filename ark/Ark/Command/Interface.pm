package Ark::Command::Interface;
use Any::Moose '::Role';

use Cwd qw/cwd/;
use Path::Class qw/dir/;

use Pod::Usage;
use Getopt::Long qw/GetOptionsFromArray/;

requires 'run', 'option_list';

has options => (
    is      => 'rw',
    isa     => 'HashRef',
    lazy    => 1,
    default => sub { {} },
);

around run => sub {
    my $next = shift;
    my ($self, @args) = @_;

    GetOptionsFromArray(\@args, $self->options, $self->option_list);
    $next->($self, @args);
};

no Any::Moose '::Role';

sub show_usage {
    my ($self, $exitval, $message, $caller) = @_;

    $caller ||= caller(0);
    (my $module = $caller) =~ s!::!/!g;
    my $file = $INC{"${module}.pm"};

    pod2usage( -exitval => $exitval, -input => $file, -message => $message );
}

sub search_app {
    my ($self, $app) = @_;

    my $libdir = dir(cwd)->subdir('lib');
    $self->show_usage(-1, "There is no 'lib' directory in current directory, this command should be called from application directory.")
        unless -d $libdir;

    eval "use lib q[$libdir]";
    die $@ if $@;

    my $extlib = $libdir->parent->subdir('extlib');
    if (-d $extlib) {
        eval "use lib q[$extlib]";
    }

    if ($app) {
        eval "use $app";
        if ($@) {
            $self->show_usage(-1, qq[Can't find app: "$app"]);
        }
    }
    else {
        $libdir->recurse( callback => sub {
            my $file = $_[0];
            return if $app;
            return unless -f $file && $file->basename =~ /\.pm$/;

            my $path = $libdir;
            if ($^O eq 'MSWin32') {
                $file =~ s!\\!/!g;
                $path =~ s!\\!/!g;
            }
            (my $module = $file) =~ s!^$path/!!;
            $module =~ s!/!::!g;
            $module =~ s!\.pm$!!;

            Mouse::load_class($module) unless Mouse::is_class_loaded($module);

            return unless $module->can('meta')
                and ref($module->meta) eq 'Mouse::Meta::Class';

            my @super = $module->meta->superclasses;
            $app = $module if grep /^Ark::Core$/, @super;
        });
    }

    $app;
}

1;
