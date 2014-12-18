# == Class: icinga2::server::service::configtest
#
# This class provides a target to run a configtest (and then a graceful
# reload) of icinga
#
# This is important because if there are any errors in the configuration files
# then a hard restart of the service will fail and icinga2 will be left
# stopped!
#
# === Parameters
#
# none
#
# === Examples
#
# file {
#   '/etc/icinga2/conf.d/some_file.conf':
#     notify => Class['icinga2::server::service::configtest'];
# }
#

class icinga2::server::service::configtest (
  $configtest_command = $icinga2::params::configtest_command,
) inherits icinga2::params {

  exec { 'icinga2-configtest':
    refreshonly => true,
    command     => $configtest_command,
    notify      => Class['icinga2::server::service::reload'];
  }

}
