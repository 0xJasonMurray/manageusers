Overview
--------------
Puppet module to manage users, groups, and ssh keys.


Installation
------------------
Copy the entire manageusers contents into the /pathToPuppetConfig/modules directory (example):

    cd /etc/puppet/modules
    git clone git@github.com:duxklr/manageusers.git


Use
-------
Edit the /pathToPuppetConfig/modules/manageusers/manifests/init.pp and add user accounts (similar to this):

    manageusers::add_user { user1:
        name       => "John Smith",
        uid        => "700",
        password   => '$1$abcedfghijklmnopqrstuvwxyz',
        shell      => "/bin/bash",
        groups     => ['sudo', 'user1'],
        sshkeytype => "ssh-dss",
        sshkey     => "AAAAB3NzaC1kc3MAAACBAJzMVL4afDQBJ3rcM9LlHqxg0rmkWDwoWehS4nIpBLJL9qGoyR1YBzPvpD1VufsUqgUXH9dYdfaiVum4IaTgyu2Tb0ezR4Nx2Jkcnp+8jFh/Cys3zgMvzJaIw/Au45E9h4vBdwvouj1Sg0YaY5mGuKZ2w121uPLawjc3DJsNSc+jAAAAFQCb7+Vtir8w+o/CIDiSPXr6MVj16QAAAIBFHMnBixvQax1ekLK70eR9TgYUAXsh0MHT8VT+XMUWlOC8u8yVEOTDzrU1ZL2vNWo4NZL6ex9ffx0JRS5hSCU/o8aVcoC4viCC7SGmntNb0nQo+iKUyTQbGcmMoPG9lO498prML66GbOYWzTedc4XT683kyWV4k0iVixyvLsfLnAAAAIB4PmZfjdTtYwC7cE/upvfC/HWpKHHAn66YW6PRTCwZPqCd2AvHAMX/l7nbk1u+BL0YtymawzNT97FcYuvM1UWrJ+fT8iIsTyHsoUkf76irVxcTBH0SReChHbYeWa2bATEvaj0u2597H4O7qYHJ6IZpTTAeWP0EeKDABfonAr+ZJw=="
    }

Edit the /pathToPuppetConfig/manifests/site.pp and call the manageusers module (similar to this):

    node 'default' {
      include manageusers
    }



