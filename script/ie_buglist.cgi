#!/opt/local/bin/perl

use strict;
use warnings;
use FindBin::libs;

use IEBugList;
use HTTP::Engine;

my $app = IEBugList->new;

$app->setup_minimal;

HTTP::Engine->new(
    interface => {
        module          => 'CGI',
        request_handler => $app->handler,
    },
)->run;
