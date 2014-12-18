# == Class: icinga2::server::service::reload
#
# This class provides a target to run a graceful reload of icinga2
#
# === Parameters
#
# none
#
# === Examples
#
# resource {
#   'title':
#     notify => Class['icinga2::server::service::reload'];
# }
#

class icinga2::server::service::reload (
  $reload_command = $icinga2::params::reload_command,
) inherits icinga2::params {

  exec { 'icinga2-reload':
    refreshonly => true,
    command     => $reload_command,
    require     => Class['icinga2::server::service'],
  }

}
