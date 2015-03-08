require 'spec_helper_acceptance'

describe 'mysql_java_connector class' do

  context 'default parameters' do
    # Using puppet_apply as a helper
    it 'should work idempotently with no errors' do
      pp = <<-EOS
      class { 'mysql_java_connector': }
      EOS

      # Run it twice and test for idempotency
      apply_manifest(pp, :catch_failures => true)
      apply_manifest(pp, :catch_changes  => true)
    end

#    describe package('mysql_java_connector') do
#      it { is_expected.to be_installed }
#    end
#
#    describe service('mysql_java_connector') do
#      it { is_expected.to be_enabled }
#      it { is_expected.to be_running }
#    end
  end
end
