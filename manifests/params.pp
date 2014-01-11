# == Class: elasticsearch::params
#
# === Authors
#
# Johannes Graf <graf@synyx.de>
#
# === Copyright
#
# Copyright 2013 synyx GmbH & Co. KG
#
class elasticsearch::params {

  $repo_name = 'elasticsearch'

  $repo_version = '1.0'

  $repo_baseurl = $::operatingsystem ? {
      /(?i)(ubuntu|debian)/ => "http://packages.elasticsearch.org/elasticsearch/${repo_version}",
      default => fail("${::operatingsystem} is not supported by ${module_name}")
  }

  $repo_key = 'D88E42B4'

  $repo_repos = 'main'

  $repo_release = $::osfamily ? {
    'Debian' => 'stable',
    default  => fail("${::osfamily} is not supported by ${module_name}")
  }

  $repo_pin = 200

  $package_name = $::osfamily ? {
    'Debian' => 'elasticsearch',
    default  => fail("${::osfamily} is not supported by ${module_name}")
  }

  $package_version = 'installed'

  $config_cluster_name = 'elasticsearch'
}
