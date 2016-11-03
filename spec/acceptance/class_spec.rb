require 'spec_helper_acceptance'

describe 'mysql_java_connector class' do
  context 'default parameters' do
    # Using puppet_apply as a helper
    it 'works idempotently with no errors' do
      pp = <<-EOS
      file { [ '/opt/tomcat_app', '/opt/jboss_app' ]:
        ensure => directory
      } ->
      class { 'mysql_java_connector': }
        links => [ '/opt/tomcat_app', '/opt/jboss_app' ]
      }
      EOS

      # Run it twice and test for idempotency
      apply_manifest(pp, catch_failures: true)
      apply_manifest(pp, catch_changes: true)
    end

    describe file('/opt/MySQL-connector') do
      it { is_expected.to be_directory }
    end

    describe file('/opt/MySQL-connector/latest') do
      it { is_expected.to be_symlink }
    end

    describe file('/opt/MySQL-connector/latest/mysql-connector-java-5.1.40-bin.jar') do
      it { is_expected.to be_file }
      its(:md5sum) { is_expected.to eq '2ad5cfbcb388bee5a64c879c208c7652' }
    end

    describe file('/opt/tomcat_app/mysql-connector-java.jar') do
      it { is_expected.to be_symlink }
    end

    describe file('/opt/jboss_app/mysql-connector-java.jar') do
      it { is_expected.to be_symlink }
    end
  end
end
