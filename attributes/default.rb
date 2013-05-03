# attributes/default.rb
#
# Author: Simple Finance <ops@simple.com>
# License: Apache License, Version 2.0
#
# Copyright 2013 Simple Finance Technology Corporation
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# Attributes for Polyglot cookbook

# Various defaults
default[:polyglot][:user] = 'root'

# Maven
override[:maven][:version] = 3
override[:maven][:setup_bin] = true

# Java
default[:polyglot][:java][:enable] = true
override[:java][:install_flavor] = 'oracle'
override[:java][:oracle][:accept_oracle_download_terms] = true

# Android
default[:polyglot][:android][:enable] = false
default[:polyglot][:android][:sdk_url] = 'http://dl.google.com/android/android-sdk_r21.1-linux.tgz'
default[:polyglot][:android][:sdk_hash] = '276e3c13a10f37927d4e04d036a94a0cbbf62326981f0ba61a303b76567e3379'
default[:polyglot][:android][:home] = ::File.join('/opt', 'tools', 'android-sdk-linux')
default[:polyglot][:android][:filters] = [ 'platform', 'tool', 'platform-tool', 'add-on' ]

# Clojure
default[:polyglot][:clojure][:enable] = true
default[:polyglot][:clojure][:lein_url] = 'https://raw.github.com/technomancy/leiningen/2.0.0/bin/lein'
default[:polyglot][:clojure][:lein_checksum] = '00bd30c11a7e9d646ede4487189adde85dfbc41f7b8cc3b717a501a2070d60c4'

# Ruby
default[:polyglot][:ruby][:enable] = true
default[:polyglot][:ruby][:ruby_gems] = [ 'aws-sdk', 'berkshelf', 'capistrano', 'bundler' ]
default[:polyglot][:ruby][:jruby_gems] = [ 'bundler' ]
default[:polyglot][:ruby][:gem_cache] = ::File.join('/opt', 'gem-cache')
default[:polyglot][:ruby][:gem_opts] = '--no-ri --no-rdoc'
default[:polyglot][:ruby][:gem_sources] = []
override[:rbenv][:rubies] = [ '2.0.0-rc1', 'jruby-1.7.2' ]
override[:rbenv][:git_ref] = "e3f72ebae20768079ca4b4425a364900f3f16fc6"
override[:ruby_build][:git_ref] = "724a3f38c4d5e6a89c6772935b40ad76a6b6a889"

# Python
default[:polyglot][:python][:enable] = true

