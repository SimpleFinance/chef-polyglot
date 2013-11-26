# recipes/ruby.rb
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
# Configures Ruby

MRI_VERSION = '2.0.0-rc1'
JRUBY_VERSION = 'jruby-1.7.6'
node.normal[:rbenv][:rubies] = [ MRI_VERSION, JRUBY_VERSION ]
node.normal[:rbenv][:git_ref] = "3300587c6bef99f6504f4bacb147e5d9ab315e98"
node.normal[:ruby_build][:git_ref] = "4ed38ba4bceafa3f8908a05b58e6bcf219fbbdc3"

include_recipe 'ruby_build::default'
include_recipe 'rbenv::system'

template '/etc/gemrc' do
  source 'gemrc.erb'
  mode 00755
  owner 'root'
  group 'root'
  variables(
    :sources => node[:polyglot][:ruby][:gem_sources],
    :gem_opts => node[:polyglot][:ruby][:gem_opts] )
end

node[:polyglot][:ruby][:jruby_gems].each do |gem|
  rbenv_gem gem do
    rbenv_version JRUBY_VERSION
    action :install
  end
end

node[:polyglot][:ruby][:ruby_gems].each do |gem|
  rbenv_gem gem do
    rbenv_version MRI_VERSION
    action :install
  end
end

rbenv_global node[:rbenv][:rubies].first

%w{ jruby ruby }.each do |ruby|
  directory "#{node[:polyglot][:ruby][:gem_cache]}/#{ruby}" do
    owner node[:polyglot][:user]
    group node[:polyglot][:user]
    recursive true
  end
  node.override[:builder][:env]["#{ruby.upcase}_GEMS"] = "#{node[:polyglot][:ruby][:gem_cache]}/#{ruby}"
end

