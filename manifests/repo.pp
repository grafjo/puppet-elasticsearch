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
  $key,
  $repos,
  $release,
  $pin,
) {

  anchor { 'elasticsearch::repo::begin': }
  anchor { 'elasticsearch::repo::end': }

  case $::osfamily {
    'Debian': {
      class {'elasticsearch::repo::debian':
        repo_name  => $repo_name,
        baseurl    => $baseurl,
        key        => $key,
        repos      => $repos,
        release    => $release,
        pin        => $pin,
        require    => Anchor['elasticsearch::repo::begin'],
        before     => Anchor['elasticsearch::repo::end'], 
      }
    }
    default: { fail("${::osfamily} is not supported by ${module_name}") }
  }

}
