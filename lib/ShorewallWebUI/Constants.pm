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

package ShorewallWebUI::Constants;

use strict;
use warnings;
use English qw(-no_match_vars);
use utf8;

use boolean qw(:all);
use base qw(Exporter);

BEGIN {
    use Exporter   ();

    my ($VERSION, @EXPORT, @EXPORT_OK, %EXPORT_TAGS);

    # set the version for version checking
    $VERSION     = '1.0';
    @EXPORT      = qw(
        $version
        $license
        $login_title
        $title
        $copyright
    );
    %EXPORT_TAGS = (
        All => [
            qw(
                $version
                $license
            )
        ]
    );     # eg: TAG => [ qw!name1 name2! ],

    # your exported package globals go here,
    # as well as any optionally exported functions
    @EXPORT_OK   = qw($version $license);
}

our @EXPORT_OK;

# exported package globals go here
our $version;
our $license;

# initialize package globals, first exported ones
$version     = '1.0';
$license     = 'Licensed under the Apache Public License version 2.0';

END { }       # module clean-up code here (global destructor)

true;  # don't forget to return a true value from the file
