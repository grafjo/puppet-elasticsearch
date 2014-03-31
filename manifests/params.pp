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

  $repo_baseurl = $::osfamily ? {
      'Debian' => 'http://packages.elasticsearch.org/elasticsearch/1.0/debian',
      'Redhat' => 'http://packages.elasticsearch.org/elasticsearch/1.0/centos',
      default  => fail("${::osfamily} is not supported by ${module_name}")
  }

  $repo_key = 'D88E42B4'

  $repo_repos = 'main'

  $repo_release = 'stable'

  $repo_pin = 200

  $repo_key_source = 'http://packages.elasticsearch.org/GPG-KEY-elasticsearch'

  $repo_gpgcheck = 1

  $repo_enabled = 1

  $package_name = 'elasticsearch'

  $package_version = 'installed'

  $config_cluster_name = 'elasticsearch'
}
