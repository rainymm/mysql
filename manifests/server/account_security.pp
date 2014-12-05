class mysql::server::account_security {
  mysql_user {
    [ "root@melody",
      'root@127.0.0.1',
      'root@::1',
      "@melody",
      '@localhost',
      '@%']:
    ensure  => 'absent',
    require => Anchor['mysql::server::end'],
  }
  if (melody != $::hostname) {
    mysql_user { ["root@${::hostname}", "@${::hostname}"]:
      ensure  => 'absent',
      require => Anchor['mysql::server::end'],
    }
  }
  mysql_database { 'test':
    ensure  => 'absent',
    require => Anchor['mysql::server::end'],
  }
}
