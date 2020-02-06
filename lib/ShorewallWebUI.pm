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

    err_log("TRACE", "Sub: $sub", $configuration{'debug_level'});

    return %configuration;
}

my sub get_json ($config, $json_file) {
    my $sub = (caller(0))[3];
    err_log("TRACE", "Sub: $sub");

    err_log("DEBUG", "APPDIR: $config->{'appdir'}");
    err_log("DEBUG", "JSON FILE: $json_file");

    my $json_txt;
    {
        local $INPUT_RECORD_SEPARATOR;
        open my $fh, '<', "$config->{'appdir'}/$json_file" or
          croak "Unable to open $json_file";
        $json_txt = <$fh>;
        close $fh;
    }

    return $json_txt;
}

my sub validate_page_launch_date ($launch_date, $curr_date) {
    my $sub = (caller(0))[3];
    err_log('TRACE', "Sub: $sub");

    my $do_launch = false;
    if ($curr_date >= $launch_date) {
        $do_launch = true;
    }

    return $do_launch;
}

my sub expire_page ($expiry_date, $curr_date) {
    my $sub = (caller(0))[3];
    err_log('TRACE', "Sub: $sub");

    my $expire = false;
    if ($expiry_date != -1) {
        if ($curr_date > $expiry_date) {
            $expire = true;
        }
    }

    return $expire;
}


my sub register_static_route ($verb, $config, $bindings, $path) {
    # un-reference to make easier to work with
    my %bindings = %$bindings;

    my $sub = (caller(0))[3];
    err_log('TRACE', "Sub: $sub");

    my $template = $bindings{$path}->{'get'}->{'template'};
    err_log('DEBUG', "Registering GET action for path '$path'");
    err_log('DEBUG', "Using template '$template' for path '$path'");
    given ($verb) {
        when ('get') {
            get "$path" => sub {
                my $do_launch = validate_page_launch_date($bindings{$path}->{$verb}->{'launchDate'}, time);
                my $expire_page = expire_page($bindings{$path}->{$verb}->{'expireDate'}, time);

                err_log('DEBUG', "Triggering GET action for path $path");
                err_log('DEBUG', "do_launch: $do_launch");
                err_log('DEBUG', "expire_page: $expire_page");
                return template $template, {
                    'webroot'     => $config->{'webroot'},
                    'site_name'   => $config->{'site_title'},
                    'page_title'  => $bindings->{$path}->{'get'}->{'summary'},
                    'copyright'   => $config->{'copyright'},
                    'license'     => $config->{'license'},
                    'launch'      => $do_launch,
                    'expire_page' => $expire_page
                };
            };
        }
        when ('put') {}
        when ('post') {}
    }
}

my sub register_get_routes ($config, $bindings, @paths) {
    # un-reference to make easier to work with
    my %bindings = %$bindings;

    my $sub = (caller(0))[3];
    err_log('TRACE', "Sub: $sub");

    foreach my $path (@paths) {
        my @traits = @{$bindings{$path}->{'get'}->{'traits'}};
        if (@traits) {
            err_log('DEBUG', "Path '$path' has traits: '@traits'");
        } else {
            err_log('DEBUG', "Path '$path' has no defined traits!");
        }
        foreach my $trait (@traits) {
            given ($trait) {
                when ('dynamic') {
                    register_dynamic_route('get', $config, $bindings, $path);
                }
                when ('static') {
                    register_static_route('get', $config, $bindings, $path);
                }
                when ('actor') {
                    register_actor_route('get', $config, $bindings, $path);
                }
            }
        }
    }

    return true;
}
my sub register_post_routes {}

our sub main {
    set traces => 1;

    my %configuration = load_config(config->{appdir});
    my $sub = (caller(0))[3];
    err_log("TRACE", "Sub: $sub");

    my @getters;
    my @posters;

    my $json_txt = get_json(config, 'bindings.json');
    my $json = JSON->new();
    my $data = $json->decode($json_txt);
    my %app_config = (
        'appdir'        => config->{appdir},
        'article_mech'  => $configuration{'article_mech'},
        'debug'         => $configuration{'debug'},
        'configuration' => \%configuration,
        'site_title'    => $data->{'info'}->{'title'},
        'copyright'     => $data->{'info'}->{'copyright'},
        'license'       => $data->{'info'}->{'license'}
    );
    my %paths = %{$data->{'paths'}};

    err_log('DEBUG', 'Loading site endpoints from JSON:');
    foreach my $path (keys %paths) {
        err_log('DEBUG', "FOUND KEY: $path");
        if (exists $paths{$path}->{'get'}) {
            if ($paths{$path}->{'get'}->{'active'} eq 'true') {
                push @getters, $path;
            }
        }
        if (exists $paths{$path}->{'post'}) {
            if ($paths{$path}->{'post'}->{'active'} eq 'true') {
                push @posters, $path;
            }
        }
    }

    register_get_routes(\%app_config, \%paths, @getters);
    register_post_routes(\%app_config, \%paths, @posters);

    return true;
}

main();

true;
