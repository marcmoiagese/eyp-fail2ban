class fail2ban::params {


  $service_name='fail2ban'

  $filterd='/etc/fail2ban/filter.d'
  $actiond='/etc/fail2ban/action.d'

  case $::osfamily
  {
    'redhat':
    {
      $use_epel=true
      case $::operatingsystemrelease
      {
        /^[5-6].*$/:
        {
          $package_name='fail2ban'
          $jaild=undef
        }
        /^[78].*$/:
        {
          $package_name=[ 'fail2ban', 'fail2ban-systemd' ]
          $jaild='/etc/fail2ban/jail.d'
        }
        default: { fail("Unsupported RHEL/CentOS version! - ${::operatingsystemrelease}")  }
      }
    }
    'Debian':
    {
      $use_epel=false
      $jaild='/etc/fail2ban/jail.d'
      case $::operatingsystem
      {
        'Ubuntu':
        {
          case $::operatingsystemrelease
          {
            /^1[468].*$/:
            {
            }
            /^20.*$/:
            {
            }
            default: { fail("Unsupported Ubuntu version! - ${::operatingsystemrelease}")  }
          }
        }
        'Debian': { fail('Unsupported')  }
        default: { fail('Unsupported Debian flavour!')  }
      }
    }
    default: { fail('Unsupported OS!')  }
  }
}
