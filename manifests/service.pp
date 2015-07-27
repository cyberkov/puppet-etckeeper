# == Class etckeeper::service
#
# This class is meant to be called from etckeeper.
# It ensure the service is running.
#
class etckeeper::service {

  service { $::etckeeper::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
