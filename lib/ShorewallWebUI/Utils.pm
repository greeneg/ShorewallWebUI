#!/usr/bin/env perl
#
# Author: Gary Greene <greeneg@tolharadys.net>
# Copyright: 2020, YggdrasilSoft, LLC. All Rights Reserved
#
##########################################################################
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

package ShorewallWebUI::Utils;

use strict;
use warnings;
use English qw(-no_match_vars);
use utf8;

use feature qw(:5.26);
use experimental 'lexical_subs';
use experimental 'signatures';
use experimental 'switch';

use boolean qw(:all);
use base qw(Exporter);
use Carp;
use File::Basename;
use Data::Dumper;

use System::Errors;

no warnings "experimental::lexical_subs";
no warnings "experimental::signatures";
no warnings "experimental::smartmatch";

BEGIN {
    use Exporter;
    our ($VERSION, @EXPORT, @EXPORT_OK);

    # set the version for version checking
    $VERSION     = '1.0';
    @EXPORT      = qw(
        err_log
    );
    @EXPORT_OK   = qw();
}

my %level_by_int = (
    8 => 'TRACE',
    7 => 'DEBUG',
    6 => 'INFO',
    5 => 'NOTICE',
    4 => 'WARNING',
    3 => 'ERROR',
    2 => 'CRITICAL',
    1 => 'ALERT',
    0 => 'EMERGENCY'
);
my %level_by_name = (
    'TRACE'     => 8,
    'DEBUG'     => 7,
    'INFO'      => 6,
    'NOTICE'    => 5,
    'WARNING'   => 4,
    'ERROR'     => 3,
    'CRITICAL'  => 2,
    'ALERT'     => 1,
    'EMERGENCY' => 0
);



my sub validate_msg_level ($level) {
    given (uc $level) {
        when ('INFO') { return true; }
        when ('DEBUG') { return true; }
        when ('TRACE') { return true; }
        when ('NOTICE') { return true; }
        when ('WARNING') { return true; }
        when ('ERROR') { return true; }
        when ('CRITICAL') { return true; }
        when ('ALERT') { return true; }
        when ('EMERGENCY') { return true; }
    };
    return false;
}

sub err_log ($level, $msg, $debug_level = 'ERROR') {
    if (defined $debug_level) {
        say "\$debug_level is defined";
    } else {
        say "\$debug_level is NOT defined";
    }
    my $app_name = basename $0;

    if (validate_msg_level($level)) {
        $level = uc $level;
    } else {
        err_log("ERROR", $_errors{'EINVAL'}->{'msg'} . ": Exiting");
        exit $_errors{'EINVAL'}->{'code'};
    }

    if (defined $ENV{'SITE_DEBUG'}) {
        $debug_level = $ENV{'SITE_DEBUG'};
    }

    if ($level_by_name{$debug_level} >= $level_by_name{$level}) {
        say STDERR "$app_name: $level: $msg";
    }
}

END { }       # module clean-up code here (global destructor)

true;  # don't forget to return a true value from the file
