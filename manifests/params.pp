# == Class etckeeper::params
#
# This class is meant to be called from etckeeper.
# It sets variables according to platform.
#
class etckeeper::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'etckeeper'
      $service_name = 'etckeeper'
    }
    'RedHat', 'Amazon': {
      $package_name = 'etckeeper'
      $service_name = 'etckeeper'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
