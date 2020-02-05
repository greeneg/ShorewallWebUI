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
my $DEBUG = true;

sub main {
    say {*STDERR} '>> Starting the ShorewallWebUI application server version '. $ShorewallWebUI::Constants::version;
    say {*STDERR} '>> '. $ShorewallWebUI::Constants::license;
    say {*STDERR} '-------------------------------------------------------------';
    err_log('== DEBUGGING ==: PERL INCLUDE PATH:') if $DEBUG;
    if ($DEBUG) {
        foreach my $p (@INC) {
            say {*STDERR} "== DEBUGGING ==:    $p";
        }
    }
    err_log('== DEBUGGING ==: MOUNTING PLACK::BUILDER ENDPOINTS') if $DEBUG;

    return builder {
        mount '/shorewall'         => ShorewallWebUI->to_app;
    };
}

main();
