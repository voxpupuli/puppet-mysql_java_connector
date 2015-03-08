# == Class mysql_java_connector::install
#
# This class is called from mysql_java_connector for install.
#
class mysql_java_connector::install(
  $ensure      = $mysql_java_connector::ensure,
  $version     = $mysql_java_connector::version,
  $product     = $mysql_java_connector::product,
  $format      = $mysql_java_connector::format,
  $installdir  = $mysql_java_connector::installdir,
  $downloadURL = $mysql_java_connector::downloadURL,
) {

  require staging

  $file = "${product}-${version}.${format}"

  file { $installdir:
    ensure => 'directory',
    owner  => root,
    group  => root,
    mode   => '0755',
  } ->

  staging::file { $file:
    source  => "${downloadURL}/${file}",
    timeout => 300,
  } ->

  staging::extract { $file:
    target  => $installdir,
    creates => "${installdir}/${product}-${version}",
  } ->

  file { "${installdir}/latest":
    ensure => link,
    target => $installdir,
  }

}
