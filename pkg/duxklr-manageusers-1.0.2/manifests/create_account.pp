##
## Define the function to take care of adding the users
##
define manageusers::create_account ( $realname, $uid, $password, $shell, $groups, $sshkeytype = '', $sshkey = '') {

  $homedir = $::operatingsystem ? {
    'Solaris'   => '/export/home',
    default     => '/home'
  }

  $username = $title
  user { $username:
    comment    => $realname,
    home       => "${homedir}/${username}",
    shell      => $shell,
    uid        => $uid,
    gid        => $uid,
    managehome => true,
    password   => $password,
    groups     => $groups,
    require    => Group[$title],
  }

  group { $username:
    gid => $uid,
  }

  if $sshkeytype != '' {
    ssh_authorized_key{ $username:
      ensure  => present,
      user    => $username,
      type    => $sshkeytype,
      key     => $sshkey,
      name    => $username,
      require => User[$title],
    }
  }
}
