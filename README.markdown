#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with mysql_java_connector](#setup)
    * [What mysql_java_connector affects](#what-mysql_java_connector-affects)
    * [Beginning with mysql_java_connector](#beginning-with-mysql_java_connector)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

This module installs the upstream MySQL Java Connector (Connector/J).

## Module Description

Installs the upstream MySQL Java Connector (Connector/J). This is often required as many opera
ting systems either ship outdated or broken versions by default.

## Setup

### What mysql_java_connector affects

* Installs to /opt/MySQL-connector directory.
* Creates file /opt/MySQL-connector/latest/mysql-connector-java-VERSION-bin.jar

### Beginning with mysql_java_connector

```puppet
  include ::mysql_java_connector
```

## Usage

Create soft links to the mysql connector for use with applications:

```puppet
  class { 'mysql_java_connector':
    links  => [ '/opt/tomcat_app/lib', '/opt/jboss_app/lib' ]
  }
```

Most useful available parameters:

```puppet
  class { 'mysql_java_connector':
    links       => [ '/opt/tomcat_app/lib', '/opt/jboss_app/lib' ],
    version     => '4.99.111',
    installdir  => '/opt/custom',
    downloadURL => 'http://example.co.za',
  }
```

## Reference

###Classes 

####Public Classes

* `mysql_java_connector`: Main class, manages the installation.

####Private Classes

* `mysql_java_connector::install`: Installs mysql_java_connector binary.

####Private Definitions

* `mysql_java_connector::links`: Creates softlinks to application directories of the mysql_java_connector binary.

###Parameters 

#####`ensure`
Ensure the MySQL connector is installed. Defaults to present.
#####`version`
Specifies the version of MySQL Java Connector you would like installed. Defaults to '5.1.34' 
#####`product`
Product name, defaults to 'mysql-connector-java'
#####`format`
The default file format of the MySQL Java Connector install file, defaults to tar.gz
#####`installdir`
Installation directory of the MySQL connector. Defaults to '/opt/MySQL-connector'
#####`downloadURL`
Defaults to 'http://cdn.mysql.com/Downloads/Connector-J'
#####`links`
Directories to create softlinks to mysql connector file for use within applications. Defaults to an empty array. Must be an array.

## Limitations

This should be compatible with Linux distributions. Tested on:

* CentOS 6/7
* RedHat 6/7
* Ubuntu 12.04/14.04
* Debian 7

## Development

See CONTRIBUTING.md
