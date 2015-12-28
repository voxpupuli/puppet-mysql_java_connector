require 'spec_helper_acceptance'

describe 'mysql_java_connector class' do

  context 'default parameters' do
    # Using puppet_apply as a helper
    it 'should work idempotently with no errors' do
      pp = <<-EOS
      file { [ '/opt/tomcat_app', '/opt/jboss_app' ]:
        ensure => directory
      } ->
      class { 'mysql_java_connector': }
        links => [ '/opt/tomcat_app', '/opt/jboss_app' ]
      }
      EOS

      # Run it twice and test for idempotency
      apply_manifest(pp, :catch_failures => true)
      apply_manifest(pp, :catch_changes  => true)
    end

    describe file('/opt/MySQL-connector') do
      it { should be_directory }
    end

    describe file('/opt/MySQL-connector/latest') do
      it { should be_symlink }
    end

    describe file('/opt/MySQL-connector/latest/mysql-connector-java-5.1.38-bin.jar') do
      it { should be_file }
      its(:md5sum) { should eq 'adaa13571f32cfb67a388b6b0acfa8e8' }
    end

    describe file('/opt/tomcat_app/mysql-connector-java.jar') do
      it { should be_symlink }
    end

    describe file('/opt/jboss_app/mysql-connector-java.jar') do
      it { should be_symlink }
    end

  end
end
