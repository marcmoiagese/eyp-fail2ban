#
# fail2ban::jail { 'test':
#   logpath => '/var/log/apache.log',
#   action => [ 'sendmail-whois[name=OpenVPN, dest=jordi@sysadmins.es, sender=apache@sysadmins.es]' ]
# }
#
define fail2ban::jail (
                        $logpath,
                        $action,
                        $filter   = $name,
                        $jailname = $name,
                        $enabled  = true,
                        $maxretry = '5',
                      ) {
  validate_array($action)
  validate_absolute_path($logpath)
  validate_bool($enabled)

  if($fail2ban::params::jaild==undef)
  {
    # concat
    fail('not implemented')
  }
  else
  {
    # jail.d
    file { "${fail2ban::params::jaild}/${jailname}.conf":
      ensure  => 'present',
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      content => template("${module_name}/jail.erb"),
    }
  }
}
