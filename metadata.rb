name             'exim4'
maintainer       'Michael Weinrich'
maintainer_email 'micxer@micxer.de'
license          'Apache 2.0'
description      'Installs/Configures exim4'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'
recipe           'exim4', 'Installs and configures exim4'

%w{ubuntu debian}.each do |os|
  supports os
end
