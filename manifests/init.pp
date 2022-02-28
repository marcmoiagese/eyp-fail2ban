class fail2ban(
                $manage_package          = true,
                $package_ensure          = 'installed',
                $manage_service          = true,
                $manage_docker_service   = true,
                $service_ensure          = 'running',
                $service_enable          = true,
                $actiond_purge_unmanaged = false,
                $filterd_purge_unmanaged = false,
              ) inherits fail2ban::params{

  validate_re($package_ensure, [ '^present$', '^installed$', '^absent$', '^purged$', '^held$', '^latest$' ], 'Not a supported package_ensure: present/absent/purged/held/latest')

  class { '::fail2ban::install': } ->
  class { '::fail2ban::config': } ~>
  class { '::fail2ban::service': } ->
  Class['::fail2ban']

}
