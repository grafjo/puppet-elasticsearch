class elasticsearch (
  $cluster_name = $elasticsearch::params::config_cluster_name,
  $package      = $elasticsearch::params::package_name,
  $repo_name    = $elasticsearch::params::repo_name,
  $repo_baseurl = $elasticsearch::params::repo_baseurl,
  $repo_key     = $elasticsearch::params::repo_key,
  $repo_repos   = $elasticsearch::params::repo_repos,
  $repo_release = $elasticsearch::params::repo_release,
  $repo_version = $elasticsearch::params::repo_version,
  $repo_pin     = $elasticsearch::params::repo_pin,

) inherits elasticsearch::params {

  anchor {'elasticsearch::start': }->
  class {'elasticsearch::package':
    repo_name    => $repo_name,
    repo_baseurl => $repo_baseurl,
    repo_key     => $repo_key,
    repo_repos   => $repo_repos,
    repo_release => $repo_release,
    repo_pin     => $repo_pin,
    package      => $package_name,
    version      => $package_version,
  } ~>
  class {'elasticsearch::configure':
    cluster_name => $cluster_name,
  }~>
  class {'elasticsearch::service': } ~>
  anchor {'elasticsearch::end': }

}
