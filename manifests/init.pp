# modules/perl_FCGI/manifests/init.pp - manage perl_FCGI stuff
# Copyright (C) 2007 admin@immerda.ch
# GPLv3

# modules_dir { "perl_FCGI": }

class perl_FCGI {
    case $operatingsystem {
        centos: { include perl_FCGI::centos }
        default: { include perl_FCGI::base }
    }
}

class perl_FCGI::base {

    package{'perl-FCGI':
        ensure => installed,
    }

}

class perl_FCGI::centos inherits perl_FCGI::base {
}

