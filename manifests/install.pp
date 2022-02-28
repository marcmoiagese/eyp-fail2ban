class fail2ban::install inherits fail2ban {

  if($fail2ban::params::use_epel)
  {
    include ::epel

    Package[$fail2ban::params::package_name] {
      require => Class['::epel'],
    }
  }

  if($fail2ban::manage_package)
  {
    package { $fail2ban::params::package_name:
      ensure => $fail2ban::package_ensure,
    }
  }

}
