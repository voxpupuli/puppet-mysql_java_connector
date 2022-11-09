# frozen_string_literal: true

require 'spec_helper'

describe 'mysql_java_connector' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        context 'mysql_java_connector class without any parameters' do
          let(:params) { {} }

          it { is_expected.to compile.with_all_deps }
          it { is_expected.to contain_class('mysql_java_connector') }
          it { is_expected.to contain_class('mysql_java_connector::install') }
          it { is_expected.to contain_file('/opt/MySQL-connector').with_ensure('directory') }

          it do
            is_expected.to contain_file('/opt/MySQL-connector/latest').
              with('ensure' => 'link',
                   'target' => '/opt/MySQL-connector/mysql-connector-java-5.1.40')
          end

          it do
            is_expected.to contain_archive('/opt/MySQL-connector/mysql-connector-java-5.1.40.tar.gz').
              with(
                'creates'      => '/opt/MySQL-connector/mysql-connector-java-5.1.40',
                'source'       => 'https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.40.tar.gz',
                'extract'      => true,
                'extract_path' => '/opt/MySQL-connector',
                'cleanup'      => true
              )
          end
        end

        context 'mysql_java_connector class with custom parameters and two links' do
          let(:params) do
            {
              version: '4.99.111',
              installdir: '/opt/custom',
              downloadurl: 'http://example.co.za',
              links: ['/opt/tomcat_app/lib', '/opt/jboss_app/lib']
            }
          end

          it { is_expected.to compile.with_all_deps }
          it { is_expected.to contain_class('mysql_java_connector') }

          it do
            is_expected.to contain_class('mysql_java_connector::install').
              that_comes_before('Mysql_java_connector::Links[/opt/tomcat_app/lib]')
          end

          it do
            is_expected.to contain_class('mysql_java_connector::install').
              that_comes_before('Mysql_java_connector::Links[/opt/jboss_app/lib]')
          end

          it { is_expected.to contain_mysql_java_connector__links('/opt/tomcat_app/lib') }
          it { is_expected.to contain_mysql_java_connector__links('/opt/jboss_app/lib') }
          it { is_expected.to contain_file('/opt/custom').with_ensure('directory') }

          it do
            is_expected.to contain_file('/opt/custom/latest').
              with('ensure' => 'link',
                   'target' => '/opt/custom/mysql-connector-java-4.99.111')
          end

          it do
            is_expected.to contain_archive('/opt/custom/mysql-connector-java-4.99.111.tar.gz').with('creates' => '/opt/custom/mysql-connector-java-4.99.111',
                                                                                                    'source'  => 'http://example.co.za/mysql-connector-java-4.99.111.tar.gz',
                                                                                                    'extract' => true)
          end

          it do
            is_expected.to contain_file('/opt/tomcat_app/lib/mysql-connector-java.jar').
              with('ensure' => 'link',
                   'target' => '/opt/custom/latest/mysql-connector-java-4.99.111-bin.jar')
          end

          it do
            is_expected.to contain_file('/opt/jboss_app/lib/mysql-connector-java.jar').
              with('ensure' => 'link',
                   'target' => '/opt/custom/latest/mysql-connector-java-4.99.111-bin.jar')
          end
        end

        context 'mysql_java_connector class with link as array to application' do
          let(:params) do
            {
              links: ['/opt/jboss_app/lib']
            }
          end

          it { is_expected.to contain_mysql_java_connector__links('/opt/jboss_app/lib') }

          it do
            is_expected.to contain_file('/opt/jboss_app/lib/mysql-connector-java.jar').
              with('ensure' => 'link',
                   'target' => '/opt/MySQL-connector/latest/mysql-connector-java-5.1.40-bin.jar')
          end
        end
      end
    end
  end
end
