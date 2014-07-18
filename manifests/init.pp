class manageusers {

  ##
  ## Older versions of Ubuntu require libshadow to manage the passwords
  ##
  if $operatingsystem =~ /Ubuntu|Debian/ and $lsbdistrelease <= 12.04 {
    package { "libshadow-ruby1.8":
      ensure => "installed"
    }
  }

  ##
  ## Redhat requires reby-shadow to manage passwords
  ##
  if $operatingsystem =~ /RedHat|CentOS/  {
    package { "ruby-shadow":
      ensure => "installed"
    }
  }

  ##
  ## Accounts to be created
  ## 
  manageusers::add_user { user1:
    name       => "John Smith",
    uid        => "700",
    password   => '$1$abcedfghijklmnopqrstuvwxyz',
    shell      => "/bin/bash",
    groups     => ['sudo', 'user1'],
    sshkeytype => "ssh-dss",
    sshkey     => "AAAAB3NzaC1kc3MAAACBAJzMVL4afDQBJ3rcM9LlHqxg0rmkWDwoWehS4nIpBLJL9qGoyR1YBzPvpD1VufsUqgUXH9dYdfaiVum4IaTgyu2Tb0ezR4Nx2Jkcnp+8jFh/Cys3zgMvzJaIw/Au45E9h4vBdwvouj1Sg0YaY5mGuKZ2w121uPLawjc3DJsNSc+jAAAAFQCb7+Vtir8w+o/CIDiSPXr6MVj16QAAAIBFHMnBixvQax1ekLK70eR9TgYUAXsh0MHT8VT+XMUWlOC8u8yVEOTDzrU1ZL2vNWo4NZL6ex9ffx0JRS5hSCU/o8aVcoC4viCC7SGmntNb0nQo+iKUyTQbGcmMoPG9lO498prML66GbOYWzTedc4XT683kyWV4k0iVixyvLsfLnAAAAIB4PmZfjdTtYwC7cE/upvfC/HWpKHHAn66YW6PRTCwZPqCd2AvHAMX/l7nbk1u+BL0YtymawzNT97FcYuvM1UWrJ+fT8iIsTyHsoUkf76irVxcTBH0SReChHbYeWa2bATEvaj0u2597H4O7qYHJ6IZpTTAeWP0EeKDABfonAr+ZJw=="
  }

  manageusers::add_user { user2:
    name       => "Jane Smith",
    uid        => "701",
    password   => '$1$abcedfghijklmnopqrstuvwxyz',
    shell      => "/bin/bash",
    groups     => ['wheel', 'user2'],
    sshkeytype => "ssh-dss",
    sshkey     => "AAAAB3NzaC1kc3MAAACBAMOINlXpMYpiinwRFdGEtEVRaaX5jAM0YeIDM/igKHSfwCDZCgEqxOHLwrHP9MUH3ObLl57UKIUf3vaCnsHxKdrFwhkK515UodvZTXnAQ67KUBe/zLv+3eScFE9wtJHfAL7Z8pJbWM02FtDw0Zd29ZEXv8CYnGUqdG8O12mnhwO/AAAAFQCTfYMfEQtS07YIxwdI3z/DvjLfVwAAAIBiVfKsPODrGhKyDv3XAQTHHuWB/S6AeDDtulgxaACBKTGTRERjKdgdvb7ykeiXOI8n4L8l4vy7N9DlVQ5i26HgoIEAyD4TGNerCtcYnwF2P8bBoAZSrk1pnhd35w16PCfVCIDAFOPSYqPopGHfrW9mqjko+d9X8m/H/lLDFw4zIwAAAIEAjSEEnzDqttBoMidI+J1Gig3Thj4heLGzuWx/O5GXUzWbJX/038JsVRpseNjkaPTD9bMmYYLBjQiYf4CSm4YMeKHvn65s3/o8Qr/UUk1ixC6TC6RWCGHQmySdX+R0EKrxqtPug7KsqYB2ylwIsn/wioXOK3iUSztDhReY1c60w38="
}


  ##
  ## Accounts that should be removed
  ##
  user { user3:
    ensure => "absent"
  }

  user { user4:
    ensure => "absent"
  }
}

