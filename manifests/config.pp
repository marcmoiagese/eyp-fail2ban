class fail2ban::config inherits fail2ban {

  file { $fail2ban::params::actiond:
    ensure  => 'directory',
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    recurse => $fail2ban::actiond_purge_unmanaged,
    purge   => $fail2ban::actiond_purge_unmanaged,
  }

  file { $fail2ban::params::filterd:
    ensure  => 'directory',
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    recurse => $fail2ban::filterd_purge_unmanaged,
    purge   => $fail2ban::filterd_purge_unmanaged,
  }

}
