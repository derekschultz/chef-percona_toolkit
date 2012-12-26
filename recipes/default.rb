#
# Cookbook Name:: percona-toolkit
# Recipe:: default
#
# Copyright 2012 Derek Schultz, Brinkster Communications
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

case node["platform_family"]
when "rhel", "centos"
	include_recipe "yum"
	yum_key "RPM-GPG-KEY-percona" do
		url "http://www.percona.com/downloads/RPM-GPG-KEY-percona"
		action :add
	end

	yum_repository "percona" do
		name "CentOS-Percona"
		url "http://repo.percona.com/centos/#{node["platform_version"].split('.')[0]/os/#{node["kernel"]["machine"]}/"
		key "RPM-GPG-KEY-percona"
		action :add
	end
end

package "percona-toolkit"