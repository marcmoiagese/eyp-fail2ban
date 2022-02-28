# [Definition]
# actionstart = /bin/true
# actionstop = /bin/true
# actioncheck = /bin/true
# actionban = /bin/true
# actionunban = /bin/true
#
# [Init]
define fail2ban::action (
                          $action_name = $name,
                          $actionstart = '/bin/true',
                          $actionstop  = '/bin/true',
                          $actioncheck = '/bin/true',
                          $actionban   = '/bin/true',
                          $actionunban = '/bin/true',
                        ) {
  file { "${fail2ban::params::actiond}/${action_name}.conf":
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template("${module_name}/action.erb"),
  }
}
