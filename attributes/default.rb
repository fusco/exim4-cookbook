#
# Copyright (C) 2013 Michael Weinrich
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

default['exim4']['local_domains'] = [ 'localhost', '@' ]
default['exim4']['relay_to_domains'] = [ ]
default['exim4']['relay_from_hosts'] = [ '127.0.0.1', '::1' ]
default['exim4']['daemon_smtp_ports'] = [ 25, 465, 587 ]

default['exim4']['use_tls'] = true
default['exim4']['tls_certificate'] = '/etc/ssl/exim.crt'
default['exim4']['tls_privatekey'] = '/etc/ssl/exim.pem'
