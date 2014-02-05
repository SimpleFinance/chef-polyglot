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
  owner node[:polyglot][:user]
  group node[:polyglot][:user]
  recursive true
end

sdk_archive_file = ::File.join(Chef::Config[:file_cache_path], 'android-sdk-linux.tgz')
remote_file sdk_archive_file do
  source node[:polyglot][:android][:sdk_url]
  checksum node[:polyglot][:android][:sdk_checksum]
  backup false

  # Unpacks the SDK
  notifies :run, 'execute[android-unpack-sdk]', :immediately

  # Installs the SDK components
  notifies :run, 'execute[android-update-sdk]', :immediately
end

execute 'android-unpack-sdk' do
  user node[:polyglot][:user]
  cwd ::File.dirname(node[:polyglot][:android][:home])
  command "tar -xzf #{sdk_archive_file}"
  action :nothing
end

filters = node[:polyglot][:android][:filters].join(',')
execute 'android-update-sdk' do
  user node[:polyglot][:user]
  cwd ::File.join(node[:polyglot][:android][:home], 'tools')
  command "./android update sdk --no-ui --all --filter #{filters}"
  action :nothing
end
