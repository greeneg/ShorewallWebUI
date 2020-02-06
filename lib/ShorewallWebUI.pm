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

package ShorewallWebUI;

use strict;
use warnings;
use English;
use utf8;

use feature qw(:5.26);
use experimental 'lexical_subs';
use experimental 'signatures';
use experimental 'switch';

use boolean;
use CGI::Carp;
use Config::IniFiles;
use Dancer2;
use JSON qw();
use Data::Dumper;

use FindBin;
use lib "$FindBin::Bin/../lib";

use ShorewallWebUI::Constants;
use ShorewallWebUI::Utils;

no warnings "experimental::lexical_subs";
no warnings "experimental::signatures";
no warnings "experimental::smartmatch";

our $VERSION = $ShorewallWebUI::Constants::version;

our sub load_config ($app_dir) {
    my $sub = (caller(0))[3];

    my $config = Config::IniFiles->new(-file => "$app_dir/conf.d/config.ini",
                                       -allowcontinue => 1);

    my %configuration = ();

    $configuration{'debug'}           = $config->val('General', 'debug_level');
    $configuration{'webroot'}         = $config->val('Web', 'webpath');
    $configuration{'session_support'} = $config->val('Web', 'session_support', 0);
    $configuration{'article_mech'}    = $config->val('Web', 'article_mech', "JSON");

    err_log("TRACE", "Sub $sub", $configuration{'debug_level'});

    return %configuration;
}

our sub main {
    set traces => 1;

    my %configuration = load_config(config->{appdir});
    my $sub = (caller(0))[3];
    err_log("TRACE", "Sub: $sub");

}

main();

true;
