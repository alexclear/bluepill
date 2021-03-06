# Cookbook Name:: bluepill
# Attributes:: default
# 
# Copyright 2010, Opscode, Inc.
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

if "#{languages[:ruby][:bin_dir]}" =~ /^.*rvm\/rubies\/(.*)\/bin$/
  default['bluepill']['gemset'] = $~[1]
  default['bluepill']['bin'] = "#{languages[:ruby]['gems_dir']}/bin/bluepill"
  default['bluepill']['rvm_detected'] = true
else
  default["bluepill"]["bin"] = "#{languages[:ruby][:bin_dir]}/bluepill"
  default['bluepill']['rvm_detected'] = false
end
default["bluepill"]["logfile"] = "/var/log/bluepill.log"
default["bluepill"]["pid_dir"] = "/var/run/bluepill"
default["bluepill"]["state_dir"] = "/var/lib/bluepill"
default["bluepill"]["group"] = 0

case platform
when "arch"
  default["bluepill"]["init_dir"] = "/etc/rc.d"
  default["bluepill"]["conf_dir"] = "/etc/bluepill"
when "freebsd"
  default["bluepill"]["init_dir"] = "/usr/local/etc/rc.d"
  default["bluepill"]["conf_dir"] = "/usr/local/etc/bluepill"
else
  default["bluepill"]["init_dir"] = "/etc/init.d"
  default["bluepill"]["conf_dir"] = "/etc/bluepill"
end
