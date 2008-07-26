# modules/perl-fcgi/manifests/init.pp - manage perl-fcgi stuff
# Copyright (C) 2007 admin@immerda.ch
# GPLv3

# modules_dir { "perl-fcgi": }

class perl-fcgi {
    case $operatingsystem {
        centos: { include perl-fcgi::centos }
        default: { include perl-fcgi::base }
    }
}

class perl-fcgi::base {

    package{'perl-FCGI':
        ensure => installed,
    }

}

class perl-fcgi::centos inherits perl-fcgi::base {
}

