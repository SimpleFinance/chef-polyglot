# recipes/android.rb
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
# limitations under the License.V
#
# Configures an Android environment

directory node[:polyglot][:android][:home] do
  owner node[:jenkins][:node][:user]
  group node[:jenkins][:node][:user]
  recursive true
end

remote_file ::File.join(Chef::Config[:file_cache_path], 'android-sdk-linux.tgz') do
  source node[:polyglot][:android][:sdk_url]
  checksum node[:polyglot][:android][:sdk_hash]
  notifies :run, 'execute[android-install-sdk]', :immediately
  notifies :run, 'execute[android-update-sdk]', :immediately
end

execute 'android-install-sdk' do
  cwd "#{node[:polyglot][:android][:android_home]}/.."
  command "tar -xzf #{Chef::Config[:file_cache_path]}/android-sdk-linux.tgz"
  action :nothing
end

filters = node[:polyglot][:android][:filters].join(',')
execute 'android-update-sdk' do
  user node[:jenkins][:node][:user]
  cwd "#{node[:polyglot][:android][:home]}/tools"
  command "./android update sdk --no-ui --filter #{filters}"
  action :nothing
end

