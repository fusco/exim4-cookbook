name             'exim4'
maintainer       'Michael Weinrich'
maintainer_email 'micxer@micxer.de'
license          'Apache 2.0'
description      'Installs/Configures exim4'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.3'
recipe           'exim4', 'Installs and configures exim4'

%w{debian}.each do |os|
  supports os
end

attribute 'exim4',
  :display_name => 'Exim',
  :description => 'Array of exim4 attributes',
  :type => 'hash'

attribute 'exim4/local_domains',
  :display_name => 'Local domains of mail server',
  :description => 'List of all domains that this server accepts mail for local delivery',
  :type => 'array',
  :default => [ 'localhost', '@' ]

attribute 'exim4/relay_to_domains',
  :display_name => 'Domains accepted for relay',
  :description => 'List of all domains that this server accepts for being relayed',
  :type => 'array',
  :default => [ ]

attribute 'exim4/relay_from_hosts',
  :display_name => 'Host that are allowed for sending relay mails',
  :description => 'List of hosts that this server accepts mail from for being relayed',
  :type => 'array',
  :default => [ '127.0.0.1', '::1' ]

attribute 'exim4/daemon_smtp_ports',
  :display_name => 'Ports exim4 listens on',
  :description => 'List of all ports that exim4 listens on',
  :type => 'array',
  :default => [ 25, 465, 587 ]

attribute 'exim4/use_tls',
  :display_name => 'Use TLS?',
  :description => 'Offer/use TLS on connections?',
  :default => 'true'

attribute 'exim4/tls_certificate',
  :display_name => 'Certificate for TLS connections',
  :description => 'Path to the file containing the certificate used for TLS connections',
  :default => '/etc/ssl/exim.crt'

attribute 'exim4/tls_privatekey',
  :display_name => 'Key file for TLS certificate',
  :description => 'Path to the file containing the key for the TLS certificate',
  :default => '/etc/ssl/exim.pem'

attribute 'exim4/host_lookup',
  :display_name => 'List of IP addresses to make host lookups for',
  :description => 'Setting this to an empty string will disable host lookups',
  :default => '*'

attribute 'exim4/use_ignore_bounce_errors_after',
  :display_name => 'When to retry delivering a failed bounce',
  :description => 'When to try delivering a failed bounce for teh last time before it is deleted',
  :default => '2d'

attribute 'exim4/timeout_frozen_after',
  :display_name => 'When to cancel frozen messages',
  :description => 'Messages older than this value are cancelled on the next queue run',
  :default => '7d'

attribute 'exim4/split_spool_directory',
  :display_name => 'Enable/diable splitting of the spool directory',
  :description => 'Allows to split the spool directory into several subdirectories if necessary',
  :default => 'false'

attribute 'exim4/check_rfc2047_length',
  :display_name => 'Enable/disable checking of ',
  :description => 'Enable/disable length check of encoded non-ASCII characters in headers according to RFC 2047',
  :default => 'true'

attribute 'exim4/accept_8bitmime',
  :display_name => 'Enable/disable 8BITMIME advertisment',
  :description => 'Disable to allow interaction with systems that are not 8-bit clean',
  :default => 'true'

attribute 'exim4/use_userforward',
  :display_name => 'Read the ~/.forward file',
  :description => 'Use forwarding based on the ~/.forward file',
  :default => 'true'

attribute 'exim4/local_delivery',
  :display_name => 'Do local delivery?',
  :description => 'Let exim4 do local delivery?',
  :default => 'true'


attribute 'exim4/dns_blacklists',
  :display_name => 'List of DNSBL hosts',
  :description => 'List of hosts names of DNS blacklists',
  :type => 'array',
  :default => [ 'zen.spamhaus.org' ]

attribute 'exim4/use_clamav',
  :display_name => 'Use ClamAV for virus scanning',
  :description => 'Include configuration for ClamAV',
  :default => 'false'

attribute 'exim4/use_spamassassin',
  :display_name => 'Use SpamAssassin to filter spam',
  :description => 'Include configuration for SpamAssassin (spamd)',
  :default => 'false'

attribute 'exim4/spam/spam_found_action',
  :display_name => 'Only warn or deny spam mails',
  :description => 'Waht to do with mails considered as spam ("warn" or "deny")',
  :default => 'warn'
