# == Class: mysql_java_connector
#
# This class installs the MySQL java connector directly from oracle.
#
# === Parameters
#
# [*ensure*]
#  Ensure the MySQL connector is installed. Defaults to present.
# [*version*]
#  Specifies the version of MySQL Java Connector you would like installed. Defaults to '5.1.38'
# [*product*]
#  Product name, defaults to 'mysql-connector-java'
# [*format*]
#  The default file format of the MySQL Java Connector install file, defaults to tar.gz
# [*installdir*]
#  Installation directory of the MySQL connector. Defaults to '/opt/MySQL-connector'
# [*downloadurl*]
#  Defaults to 'https://dev.mysql.com/get/Downloads/Connector-J'
# [*links*]
#  Directories to create softlinks to mysql connector file for use within applications. Defaults to an empty array. Must be an array.
# [*proxy_server*]
#  Optional proxy server to use, with port number if needed. ie: https://example.com:8080.
# [*proxy_type*]
#  Proxy server type (none|http|https|ftp)
#
class mysql_java_connector (
  Enum['present', 'absent'] $ensure                      = 'present',
  Pattern[/^(?:(\d+)\.)?(?:(\d+)\.)?(\*|\d+)$/] $version = '5.1.40',
  $product                                               = 'mysql-connector-java',
  $format                                                = 'tar.gz',
  Stdlib::Absolutepath $installdir                       = '/opt/MySQL-connector',
  $downloadurl                                           = 'https://dev.mysql.com/get/Downloads/Connector-J',
  Array $links                                           = [],
  $proxy_server                                          = undef,
  $proxy_type                                            = undef,
) {
  class { 'mysql_java_connector::install': }
  -> Class['mysql_java_connector']
  if ! empty($links) {
    mysql_java_connector::links { $links:
      require => Class['mysql_java_connector::install'],
    }
  }
}
