#elasticsearch

[![Build Status](https://travis-ci.org/synyx/puppet-elasticsearch.svg?branch=master)](https://travis-ci.org/synyx/puppet-elasticsearch)

##Overview

A Puppet module to install elasticsearch.

Supported plattform:
* Debian 7
* Ubuntu 12.04
* CentOS 6.5

## Installation

This modules depends on:
* [grafjo/openjdk7](https://github.com/grafjo/puppet-openjdk7)
* [puppetlabs/apt](https://github.com/puppetlabs/puppetlabs-apt)
* [puppetlabs/stdlib](https://github.com/puppetlabs/puppetlabs-stdlib)

So all repositories have to be checked out:

```bash
git clone https://github.com/synyx/puppet-elasticsearch.git modules/elasticsearch
git clone https://github.com/graf/puppet-openjdk7.git modules/openjdk7
git clone https://github.com/puppetlabs/puppetlabs-apt.git modules/apt
git clone https://github.com/puppetlabs/puppetlabs-stdlib.git modules/stdlib
```

##Usage

```puppet
class { 'elasticsearch':}
```

## Authors

* Johannes Graf ([@grafjo](https://github.com/grafjo))

## License

puppet-elasticsearch is released under the MIT License. See the bundled LICENSE file
for details.

