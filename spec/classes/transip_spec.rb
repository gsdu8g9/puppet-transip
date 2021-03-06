require 'spec_helper'

describe 'transip', :type => 'class' do
  let :params do
    {
      :username => 'testuser',
      :ip       => '127.0.0.1',
      :key_file => '/etc/credentials/key_file',
    }
  end
  let :facts do
    {
      :osfamily => 'Debian'
    }
  end

  it { is_expected.to contain_file('/etc/puppetlabs/puppet/transip.yaml') }
end
