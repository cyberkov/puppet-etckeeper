# == Class etckeeper::install
#
# This class is called from etckeeper for install.
#
class etckeeper::install {

  package { $::etckeeper::package_name:
    ensure => present,
  }
}
