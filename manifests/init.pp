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
# [*downloadURL*]
#  Defaults to 'http://cdn.mysql.com/Downloads/Connector-J'
# [*links*]
#  Directories to create softlinks to mysql connector file for use within applications. Defaults to an empty array. Must be an array.
#
class mysql_java_connector (
  $ensure      = 'present',
  $version     = '5.1.38',
  $product     = 'mysql-connector-java',
  $format      = 'tar.gz',
  $installdir  = '/opt/MySQL-connector',
  $downloadURL = 'https://dev.mysql.com/get/Downloads/Connector-J',
  $links       = [],
) {

  # validate parameters
  validate_re($ensure, [ 'present', 'absent' ] )
  validate_re($version, '^(?:(\d+)\.)?(?:(\d+)\.)?(\*|\d+)$' )
  validate_absolute_path($installdir)

  class { '::mysql_java_connector::install': } ->
  Class['::mysql_java_connector']
  if ! empty($links) {
    mysql_java_connector::links { $links:
      require => Class['::mysql_java_connector::install']
    }
  }

}
