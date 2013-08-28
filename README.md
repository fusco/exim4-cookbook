Description
===========
This cookbook aims to help with a custom configuration of exim4 rather 
than the default ones covered by the exim4-config packages. If you are 
looking for a simple setup, please have a look at the 
[exim4-light](https://github.com/tmassman/exim4-light) cookbook.

Currently I'm focusing on Debian 7, but as soon as the cookbook reached 
a useful state, I will make the necessary modifications to support 
other platforms (Debian 6, Unbuntu, CentOS) as well.

Requirements
============

## Platform:

* Debian 7.1.0

May work on other platforms as well.

Attributes
==========
See `attributes/default.rb` for default values.

* `node['exim4']['local_domains']` - Array of all domains that this 
  server accepts mail for local delivery, corresponds to `local_domains`
* `node['exim4']['relay_to_domains']` - Array of all domains that this 
  server accepts for being relayed through it, corresponds to 
  `relay_to_domains`
* `node['exim4']['relay_from_hosts']` - Array of hosts that this server 
  accepts mail from for being * relayed, corresponds to `relay_from_hosts`
* `node['exim4']['daemon_smtp_ports']` - The ports on which exim4 should 
  listen, corresponds to `daemon_smtp_ports`
* `node['exim4']['use_tls']` - Enable TLS for all communication. If set 
  to true, make sure the following two attributes point to the right 
  files (`tls_certificate`, `tls_privatekey`)
* `node['exim4']['tls_certificate']` - Path to the file containing the 
  certificate used for TLS connections
* `node['exim4']['tls_privatekey']` - Path to the file containing the key 
  for the TLS certificate
* `node['exim4']['host_lookup']` - Which IP addresses should be verfied 
  by a DNS lookup, usually every address (`*`). If that kills the 
  perfomance of your mail server, disable it by setting it to an empty 
  array.
* `node['exim4']['ignore_bounce_errors_after']` - After what time span 
  try to deliver a failed bounce for the last time before it is deleted
* `node['exim4']['timeout_frozen_after']` - Messages older than the time 
  span defined here are cancelled on the next queue run
* `node['exim4']['split_spool_directory']` - Allows to split the spool 
  directory into several subdirectories if necessary
* `node['exim4']['check_rfc2047_length']` - Enable/disable length check 
  of encoded non-ASCII characters in headers according to RFC 2047 if 
  your server receives broken headers and you want it to not complain 
  about it
* `node['exim4']['accept_8bitmime'`] - Disable to allow interaction with 
  systems that are not 8-bit clean
* `node['exim4']['dns_blacklists']` - Array of host names for DNS black 
  list checks
* `node['exim4']['use_userforward']` - Switches interpretation of the 
  `.forward` for local users on or off
* `node['exim4']['local_delivery']` - Switches local delivery on or off
* `node['exim4']['use_clamav']` - Include configuration for ClamAV 
  integration (ClamAV needs to be installed separately and before the 
  default recipe is run)
* `node['exim4']['use_spamassassin']` - Include configuration for 
  SpamAssassin integration (SpamAssassin needs to be installed 
  separately and before the default recipe is run)
* `node['exim4']['spam']['spam_found_action']` - What to do when a mail 
  is classified as spam, just `warn` or `deny` acceptance of that mail


Recipes
=======
default
-------
Installs the exim4-daemon-heavy package and manages the service and the 
main configuration file. See __Usage__ and __Examples__ to customize 
behaviour of this recipe through configuration of the attributes.

Usage
=====
If the server should only accept mail for its domain name, you are 
pretty safe using the default attributes. If you want to use TLS (which 
you should), change the path to the certificate and key files and then 
you should have a working mail server. 

Examples
--------
An example role could look like this:

    name 'basic-mail-server'
    run_list('recipe[exim4]')
    override_attributes(
      'exim4' => {
        'tls_certificate' => '/path/to/your/cert',
        'mydtls_privatekeyomain' => '/path/to/your/key',
      }
    )


License and Author
==================

Author:: Michael Weinrich <micxer@micxer.de>

Copyright:: © 2013, Michael Weinrich

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.