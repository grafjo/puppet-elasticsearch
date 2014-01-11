# == Class: elasticsearch::package
#
# === Authors
#
# Johannes Graf <graf@synyx.de>
#
# === Copyright
#
# Copyright 2013 synyx GmbH & Co. KG
#
class elasticsearch::package(
  $repo_name,
  $repo_baseurl,
  $repo_key,
  $repo_repos,
  $repo_release,
  $repo_version,
  $repo_pin,
  $package,
  $version,
) {

  class { 'elasticsearch::repo':
    repo_name  => $repo_name,
    baseurl    => $repo_baseurl,
    key        => $repo_key,
    repos      => $repo_repos,
    release    => $repo_release,
    pin        => $repo_pin,
    before     => Package[$package],
  }

  package { $package:
    ensure  => $version,
    require => Class['elasticsearch::repo'],
  }

}
