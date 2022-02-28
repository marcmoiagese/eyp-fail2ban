# [Definition]
#
# failregex = vchkpw-smtp: password fail ([^)]*) [^@]*@[^:]*:<HOST>$
#
# ignoreregex =
define fail2ban::filter (
                          $failregex,
                          $ignoreregex = undef,
                          $filtername  = $name
                        ) {
  file { "${fail2ban::params::filterd}/${filtername}.conf":
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template("${module_name}/filter.erb"),
  }
}
