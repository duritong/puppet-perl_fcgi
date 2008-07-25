# modules/mod_fcgid/manifests/init.pp - manage mod_fcgid stuff
# Copyright (C) 2007 admin@immerda.ch
# GPLv3

# modules_dir { "mod_fcgid": }

class mod_fcgid {
    case $operatingsystem {
        centos: { include mod_fcgid::centos }
        default: { include mod_fcgid::base }
    }
}

class mod_fcgid::base {
    package{'mod_fcgid':
        ensure => installed,
    }

    if $selinux {
        include mod_fcgid::selinux
    }

#    service{mod_fcgid:
#        ensure => running,
#        enable => true,
#        #hasstatus => true, #fixme!
#        require => Package[mod_fcgid],
#    }

}

class mod_fcgid::centos inherits mod_fcgid::base {
}

