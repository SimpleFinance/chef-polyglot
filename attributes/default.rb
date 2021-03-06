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
default[:polyglot][:languages] = ['java', 'android', 'golang', 'ruby', 'python', 'clojure', 'nodejs']

# Java
default[:polyglot][:java][:enable] = true

# Android
default[:polyglot][:android][:enable] = false
default[:polyglot][:android][:sdk_url] = 'http://dl.google.com/android/android-sdk_r22.3-linux.tgz'
default[:polyglot][:android][:sdk_checksum] = '6ae581a906d6420ad67176dff25a31cc'
default[:polyglot][:android][:home] = ::File.join('/opt', 'tools', 'android-sdk-linux')
default[:polyglot][:android][:filters] = [
  'platform-tools',
  'build-tools-19.0.0',
  'android-19',
  'addon-google_apis-google-19',
  'extra-android-support',
  'extra-google-google_play_services',
  'extra-google-m2repository',
  'extra-android-m2repository' ]

# Clojure
default[:polyglot][:clojure][:enable] = true
default[:polyglot][:clojure][:lein_url] = 'https://raw.github.com/technomancy/leiningen/2.2.0/bin/lein'
default[:polyglot][:clojure][:lein_checksum] = 'ebabcb20a97a6ecd2c6f6be28d317b14227728d9fef486d09b452c7bbe9beecd'

# Golang
default[:polyglot][:golang][:enable] = true

# Ruby
default[:polyglot][:ruby][:enable] = true
default[:polyglot][:ruby][:ruby_gems] = [ 'aws-sdk', 'berkshelf', 'capistrano', 'bundler' ]
default[:polyglot][:ruby][:jruby_gems] = [ 'bundler' ]
default[:polyglot][:ruby][:gem_cache] = ::File.join('/opt', 'gem-cache')
default[:polyglot][:ruby][:gem_opts] = '--no-ri --no-rdoc'
default[:polyglot][:ruby][:gem_sources] = []

# Python
default[:polyglot][:python][:enable] = true
