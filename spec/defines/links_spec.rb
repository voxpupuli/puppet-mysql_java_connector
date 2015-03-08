require 'spec_helper'

describe 'mysql_java_connector::links' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:title) { '/opt/tomcat_app/lib' }
        let(:facts) do
          facts
        end
        let :pre_condition do
          'include mysql_java_connector'
        end
        context "mysql_java_connector class with custom parameters" do
          it { is_expected.to contain_file('/opt/tomcat_app/lib/mysql-connector-java.jar')
            .with({
              'ensure' => 'link',
              'target' => '/opt/MySQL-connector/latest/mysql-connector-java-5.1.34-bin.jar',
          })}
        end
      end
    end
  end
end
