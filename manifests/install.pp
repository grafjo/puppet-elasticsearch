define elasticsearch::install ($version, $cluster_name = "elasticsearch") {

  $remote_source = "https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-${version}.deb"
  $local_source = "/tmp/elasticsearch-${version}.deb"

  exec { "Download elasticsearch":
    command => "/usr/bin/wget ${remote_source} -O ${local_source}",
    creates => $local_source,
    unless  => "/usr/bin/dpkg -l | /bin/grep elasticsearch || /usr/bin/test -f ${local_source}"
  }

  package { "elasticsearch":
    provider => dpkg,
    ensure   => installed,
    source   => $local_source,
    require  => [
                  Exec["Download elasticsearch"],
                  Class["openjdk7::jre"],
                ],
  }

  service { "elasticsearch":
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
    require    => Package["elasticsearch"],
  }

  file { "/etc/elasticsearch/elasticsearch.yml":
    ensure  => file,
    require => Package["elasticsearch"],
    content => template("${module_name}/elasticsearch.yml.erb"),
  }

}
