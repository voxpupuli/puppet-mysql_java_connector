# == Class mysql_java_connector::install
#
# This class is called from mysql_java_connector for install.
#
class mysql_java_connector::install(
  $ensure       = $mysql_java_connector::ensure,
  $version      = $mysql_java_connector::version,
  $product      = $mysql_java_connector::product,
  $format       = $mysql_java_connector::format,
  $installdir   = $mysql_java_connector::installdir,
  $downloadurl  = $mysql_java_connector::downloadurl,
  $proxy_server = $mysql_java_connector::proxy_server,
  $proxy_type   = $mysql_java_connector::proxy_type,
) {

  include '::archive'

  $file = "${product}-${version}.${format}"

  file { $installdir:
    ensure => 'directory',
    mode   => '0755',
  }
  -> archive { "${installdir}/${file}":
    source       => "${downloadurl}/${file}",
    creates      => "${installdir}/${product}-${version}",
    extract      => true,
    extract_path => $installdir,
    cleanup      => true,
    proxy_server => $proxy_server,
    proxy_type   => $proxy_type,
  }
  -> file { "${installdir}/latest":
    ensure => link,
    target => "${installdir}/${product}-${version}",
  }
}
