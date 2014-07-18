Overview
--------------
Puppet module to manage user accounts.


Use
-------
Edit the /pathToPuppetConfig/modules/manageusers/manifests/init.pp and add user accounts.

Edit the /pathToPuppetConfig/manifests/site.pp and call the manageusers module (similar to this):

    node 'default' {
      include manageusers
    }



