# == Class: elasticsearch
#
# === Authors
#
# Johannes Graf <graf@synyx.de>
#
# === Copyright
#
# Copyright 2013 synyx GmbH & Co. KG
#
class elasticsearch (
  $cluster_name    = $elasticsearch::params::config_cluster_name,
  $package_name    = $elasticsearch::params::package_name,
  $package_version = $elasticsearch::params::package_version,
  $repo_name       = $elasticsearch::params::repo_name,
  $repo_baseurl    = $elasticsearch::params::repo_baseurl,
  $repo_key_source = $elasticsearch::params::repo_key_source,
  $repo_repos      = $elasticsearch::params::repo_repos,
  $repo_release    = $elasticsearch::params::repo_release,
  $repo_pin        = $elasticsearch::params::repo_pin,
  $repo_gpgcheck   = $elasticsearch::params::repo_gpgcheck,
  $repo_enabled    = $elasticsearch::params::repo_enabled,
) inherits elasticsearch::params {

  anchor {'elasticsearch::start': } ->
  class {'elasticsearch::repo':
    repo_name  => $repo_name,
    baseurl    => $repo_baseurl,
    key_source => $repo_key_source,
    repos      => $repo_repos,
    release    => $repo_release,
    pin        => $repo_pin,
    gpgcheck   => $repo_gpgcheck,
    enabled    => $repo_enabled,
  } ->
  class {'elasticsearch::package':
    package => $package_name,
    version => $package_version,
  } ->
  class {'elasticsearch::configure':
    cluster_name => $cluster_name,
  } ~>
  class {'elasticsearch::service': } ->
  anchor {'elasticsearch::end': }

}
