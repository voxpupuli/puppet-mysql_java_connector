require 'spec_helper'

describe 'mysql_java_connector' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end
        context "mysql_java_connector class without any parameters" do
          let(:params) {{ }}
          it { is_expected.to compile.with_all_deps }
          it { is_expected.to contain_class('mysql_java_connector') }
          it { is_expected.to contain_class('mysql_java_connector::install') }
          it { is_expected.to contain_file('/opt/MySQL-connector').with_ensure('directory') }
          it { is_expected.to contain_file('/opt/MySQL-connector/latest').with_ensure('link') }
          it { is_expected.to contain_staging__file('mysql-connector-java-5.1.34.tar.gz').with({
            'source'  => 'http://cdn.mysql.com/Downloads/Connector-J/mysql-connector-java-5.1.34.tar.gz',
            'timeout' => '300',
          })}
          it { is_expected.to contain_staging__extract('mysql-connector-java-5.1.34.tar.gz').with({
            'target'  => '/opt/MySQL-connector',
            'creates' => '/opt/MySQL-connector/mysql-connector-java-5.1.34',
          })}
        end

        context "mysql_java_connector class with custom parameters" do
          let(:params) {{
            :version     => '4.99.111',
            :installdir  => '/opt/custom',
            :downloadURL => 'http://example.co.za',
            :links       => [ '/opt/tomcat_app/lib', '/opt/jboss_app/lib' ]
          }}
          it { is_expected.to compile.with_all_deps }
          it { is_expected.to contain_class('mysql_java_connector') }
          it { is_expected.to contain_class('mysql_java_connector::install')
            .that_comes_before('Mysql_java_connector::Links[/opt/tomcat_app/lib]')
          }
          it { is_expected.to contain_class('mysql_java_connector::install')
            .that_comes_before('Mysql_java_connector::Links[/opt/jboss_app/lib]')
          }
          it { is_expected.to contain_mysql_java_connector__links('/opt/tomcat_app/lib') }
          it { is_expected.to contain_mysql_java_connector__links('/opt/jboss_app/lib') }
          it { is_expected.to contain_file('/opt/custom').with_ensure('directory') }
          it { is_expected.to contain_file('/opt/custom/latest').with_ensure('link') }
          it { is_expected.to contain_staging__file('mysql-connector-java-4.99.111.tar.gz').with({
            'source'  => 'http://example.co.za/mysql-connector-java-4.99.111.tar.gz',
            'timeout' => '300',
          })}
          it { is_expected.to contain_staging__extract('mysql-connector-java-4.99.111.tar.gz').with({
            'target'  => '/opt/custom',
            'creates' => '/opt/custom/mysql-connector-java-4.99.111',
          })}
          it { is_expected.to contain_file('/opt/tomcat_app/lib/mysql-connector-java.jar')
            .with({
              'ensure' => 'link',
              'target' => '/opt/custom/latest/mysql-connector-java-4.99.111-bin.jar',
          })}
          it { is_expected.to contain_file('/opt/jboss_app/lib/mysql-connector-java.jar')
            .with({
              'ensure' => 'link',
              'target' => '/opt/custom/latest/mysql-connector-java-4.99.111-bin.jar',
          })}
        end

        context 'unsupported paramater values' do
          describe 'mysql_java_connector class with incorrect ensure parameter' do
            let(:params) {{
              :ensure => 'foo',
            }}
            it { is_expected.to raise_error(Puppet::Error, /validate_re/) }
          end
          describe 'mysql_java_connector class with incorrect version parameter' do
            let(:params) {{
              :version => 'version',
            }}
            it { is_expected.to raise_error(Puppet::Error, /validate_re/) }
          end
          describe 'mysql_java_connector class with incorrect installdir parameter' do
            let(:params) {{
              :installdir => 'foo',
            }}
            it { is_expected.to raise_error(Puppet::Error, /"foo" is not an absolute path/) }
          end
          describe 'mysql_java_connector class with incorrect links parameter' do
            let(:params) {{
              :links => 'foo',
            }}
            it { is_expected.to raise_error(Puppet::Error, /"foo" is not an Array/) }
          end
        end
      end
    end
  end
end
