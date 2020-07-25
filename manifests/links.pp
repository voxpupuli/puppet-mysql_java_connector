# == Class mysql_java_connector::config
#
# This class is called from mysql_java_connector for service config.
#
define mysql_java_connector::links (
  $installdir = $mysql_java_connector::installdir,
  $product    = $mysql_java_connector::product,
  $version    = $mysql_java_connector::version,
) {
  file { "${name}/mysql-connector-java.jar":
    ensure => link,
    target => "${installdir}/latest/${product}-${version}-bin.jar",
  }
}
