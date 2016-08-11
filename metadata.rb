name 'openstack-ops-database'
maintainer 'openstack-chef'
maintainer_email 'openstack-dev@lists.openstack.org'
license 'Apache 2.0'
description 'Provides the shared database configuration for Chef for OpenStack.'
version '13.0.0'

recipe 'client', 'Installs client packages for the database used by the deployment.'
recipe 'server', 'Installs and configures server packages for the database used by the deployment.'
recipe 'mysql-client', 'Installs MySQL client packages.'
recipe 'mysql-server', 'Installs and configures MySQL server packages.'
recipe 'mariadb-client', 'Installs MariaDB client packages.'
recipe 'mariadb-server', 'Installs and configures MariaDB server packages.'
recipe 'postgresql-client', 'Installs PostgreSQL client packages.'
recipe 'postgresql-server', 'Installs and configures PostgreSQL server packages.'
recipe 'openstack-db', 'Creates necessary tables, users, and grants for OpenStack.'

%w(ubuntu redhat centos).each do |os|
  supports os
end

depends 'mariadb', '~> 0.3.1'
depends 'percona', '~> 0.16.1'
depends 'mysql', '~> 6.0.13'
depends 'mysql2_chef_gem', '~> 1.0.1'
depends 'postgresql', '~> 3.4.18'
depends 'database', '~> 5.1.0'
depends 'openstack-common', '>= 13.0.0'
