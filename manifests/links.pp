# == Class mysql_java_connector::config
#
# This class is called from mysql_java_connector for service config.
#
define mysql_java_connector::links (
  $installdir = $mysql_java_connector::installdir,
  $product    = $mysql_java_connector::product,
  $version    = $mysql_java_connector::version,
) {
  # ref: https://github.com/mysql/mysql-connector-j/commit/d2f8baa53ca3e82e2d161b3af03e0cf13fb4530c
  if versioncmp($version, '8.0.11') >= 0 {
    $link_target = "${installdir}/latest/${product}-${version}.jar"
  }
  else {
    $link_target = "${installdir}/latest/${product}-${version}-bin.jar"
  }

  file { "${name}/mysql-connector-java.jar":
    ensure => link,
    target => $link_target,
  }
}
