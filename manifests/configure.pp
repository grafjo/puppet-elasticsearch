# == Class: elasticsearch::configure
#
# === Authors
#
# Johannes Graf <graf@synyx.de>
#
# === Copyright
#
# Copyright 2013 synyx GmbH & Co. KG
#
class elasticsearch::configure ($cluster_name) {

  file { '/etc/elasticsearch/elasticsearch.yml':
    ensure  => file,
    content => template("${module_name}/elasticsearch.yml.erb"),
  }

}
