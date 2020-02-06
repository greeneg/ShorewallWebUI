#!/usr/bin/env perl

use strict;
use warnings;
use English;
use utf8;

use feature qw(:5.26);

use boolean qw(:all);
use FindBin;
use lib "$FindBin::Bin/../lib";

use ShorewallWebUI;
use ShorewallWebUI::Constants;
use ShorewallWebUI::Utils;
use Plack::Builder;

our $VERSION = $ShorewallWebUI::Constants::version;

sub main {
    err_log('INFO', '>> Starting the ShorewallWebUI application server version '. $ShorewallWebUI::Constants::version);
    err_log('INFO', '>> '. $ShorewallWebUI::Constants::license);
    err_log('INFO', '-------------------------------------------------------------');
    err_log('DEBUG', 'PERL INCLUDE PATH:');
    foreach my $p (@INC) {
        err_log('DEBUG', "   $p");
    }
    err_log('DEBUG', 'MOUNTING PLACK::BUILDER ENDPOINTS');

    return builder {
        mount '/shorewall'         => ShorewallWebUI->to_app;
    };
}

main();
