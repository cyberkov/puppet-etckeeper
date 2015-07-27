# Class: etckeeper
# ===========================
#
# Full description of class etckeeper here.
#
# Parameters
# ----------
#
# * `sample parameter`
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
class etckeeper (
  $package_name = $::etckeeper::params::package_name,
  $service_name = $::etckeeper::params::service_name,
) inherits ::etckeeper::params {

  # validate parameters here

  class { '::etckeeper::install': } ->
  class { '::etckeeper::config': } ->
  Class['::etckeeper']
}
