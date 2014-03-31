# == Class: elasticsearch::repo
#
# === Authors
#
# Johannes Graf <graf@synyx.de>
#
# === Copyright
#
# Copyright 2013 synyx GmbH & Co. KG
#
class elasticsearch::repo (
  $repo_name,
  $baseurl,
  $repos,
  $release,
  $pin,
  $key_source,
  $gpgcheck,
  $enabled,
) {

  case $::osfamily {
    'Debian': {
      class {'elasticsearch::repo::debian':
        repo_name  => $repo_name,
        baseurl    => $baseurl,
        key_source => $key_source,
        repos      => $repos,
        release    => $release,
        pin        => $pin,
      }
    }
    'RedHat': {
      class { 'elasticsearch::repo::redhat':
        repo_name => $repo_name,
        baseurl   => $baseurl,
        gpgkey    => $key_source,
        gpgcheck  => $gpgcheck,
        enabled   => $enabled,
      }
    }
    default: { fail("${::osfamily} is not supported by ${module_name}") }
  }

}
