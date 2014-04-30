#elasticsearch

[![Build Status](https://travis-ci.org/synyx/puppet-elasticsearch.svg?branch=master)](https://travis-ci.org/synyx/puppet-elasticsearch)

##Overview

A Puppet module to install elasticsearch.

Supported plattforms:
* Debian 7
* Ubuntu 12.04
* CentOS 6.5

There is an implicit dependency to java - make sure to setup java properly before using this module!

## Installation

This modules depends on:
* [puppetlabs/apt](https://github.com/puppetlabs/puppetlabs-apt)
* [puppetlabs/stdlib](https://github.com/puppetlabs/puppetlabs-stdlib)

So all repositories have to be checked out:

```bash
git clone https://github.com/synyx/puppet-elasticsearch.git modules/elasticsearch
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

