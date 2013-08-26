#
# Cookbook Name:: exim4
# Recipe:: default
#
# Author:: Michael Weinrich <micxer@micxer.de>
# License:: Apache License, Version 2.0
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
#

package 'exim4-daemon-heavy'

service 'exim4' do
	supports :status => true, :restart => true, :reload => true
	action [:enable, :start]
end

template "/etc/exim4/exim4.conf" do
  source "exim4.conf.erb"
  owner "root"
  group "Debian-exim"
  mode 0644
  notifies :restart, resources(:service => "exim4")
end