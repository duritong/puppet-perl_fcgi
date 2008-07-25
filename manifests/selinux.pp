# manifests/selinux.pp
# manage selinux specific stuff

class mod_fcgid::selinux {
    case $operatingsystem {
        centos: { include mod_fcgid::selinux::centos }
        default: { include mod_fcgid::selinux::base }
    }
}

class mod_fcgid::selinux::base {}

class mod_fcgid::selinux::centos inherits mod_fcgid::selinux::base {
    package{'mod_fcgid-selinux':
        ensure => present,
    }
    selinux::loadmodule {"fastcgi": }
}
