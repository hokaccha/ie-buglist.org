#!/opt/local/bin/perl

use strict;
use warnings;
use FindBin::libs;
use lib "$FindBin::Bin/../lib";
use Cwd 'realpath';

use IEBugList;
use HTTP::Engine;
use HTTP::Engine::Middleware;

my $app = IEBugList->new;
$app->setup_minimal;

my $mw = HTTP::Engine::Middleware->new;
$mw->install('HTTP::Engine::Middleware::Static' => {
    docroot => Cwd::realpath($app->path_to('root')),
    regexp => '/(?:(?:css|js|img|images?|swf|static|tmp|)/.*|[^/]+\.[^/]+)',
});

HTTP::Engine->new(
    interface => {
        module => 'CGI',
        request_handler => $mw->handler( $app->handler ),
    },
)->run;
