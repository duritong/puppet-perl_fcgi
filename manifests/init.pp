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
    $config_dir = '/etc/httpd/'

    package{'mod_fcgid':
        ensure => installed,
    }

    if $selinux {
        include mod_fcgid::selinux
    }

    file{"${config_dir}/conf.d/fcgid.conf":
        source => [ "puppet://$server/files/mod_fcgid/${fqdn}/ssl.conf",
                    "puppet://$server/files/mod_fcgid/fcgid.conf",
                    "puppet://$server/mod_fcgid/fcgid.conf"
        ],
        owner => root, group => 0, mode => 0644;
    }
    file{"${config_dir}/conf.d/php.conf":
        ensure => absent
    }
    file{"${config_dir}/conf.d/perl.conf":
        ensure => absent
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

