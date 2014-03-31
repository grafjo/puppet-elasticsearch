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
  $package,
  $version,
) {

  package { $package:
    ensure  => $version,
  }

}
