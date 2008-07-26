# modules/perl-FCGI/manifests/init.pp - manage perl-FCGI stuff
# Copyright (C) 2007 admin@immerda.ch
# GPLv3

# modules_dir { "perl-FCGI": }

class perl-FCGI {
    case $operatingsystem {
        centos: { include perl-FCGI::centos }
        default: { include perl-FCGI::base }
    }
}

class perl-FCGI::base {

    package{'perl-FCGI':
        ensure => installed,
    }

}

class perl-FCGI::centos inherits perl-FCGI::base {
}

