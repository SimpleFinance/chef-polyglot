# recipes/java.rb
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
# Configures Java /  Maven / Android

node.normal[:java][:install_flavor] = 'oracle'
node.normal[:java][:oracle][:accept_oracle_download_terms] = true
node.normal[:maven][:version] = 3
node.normal[:maven][:setup_bin] = true

include_recipe 'java::default'
include_recipe 'maven::default'

link "/usr/bin/mvn#{node[:maven][:version]}" do
  to ::File.join(node[:maven][:m2_home], 'bin', 'mvn')
end

