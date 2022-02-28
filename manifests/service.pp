class fail2ban::service inherits fail2ban {

  #
  validate_bool($fail2ban::manage_docker_service)
  validate_bool($fail2ban::manage_service)
  validate_bool($fail2ban::service_enable)

  validate_re($fail2ban::service_ensure, [ '^running$', '^stopped$' ], "Not a valid daemon status: ${fail2ban::service_ensure}")

  $is_docker_container_var=getvar('::eyp_docker_iscontainer')
  $is_docker_container=str2bool($is_docker_container_var)

  if( $is_docker_container==false or
      $fail2ban::manage_docker_service)
  {
    if($fail2ban::manage_service)
    {
      service { $fail2ban::params::service_name:
        ensure => $fail2ban::service_ensure,
        enable => $fail2ban::service_enable,
      }
    }
  }
}
