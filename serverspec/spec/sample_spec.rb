require 'spec_helper'

describe package('nginx') do
    it { should be_installed }
end

describe file('/etc/nginx/conf.d/rails.conf') do
    it { should exist }
    it { should be_installed }
end

describe service('nginx') do
    it { should be_running }
end

describe command('ruby -v') do
    its(:stdout) { should match /ruby 3\.2\.3/ }
end

describe package('bundler') do
    it { should be_installed.by('gem').with_version('2.3.14') }
end

describe port(80) do
    it { should be_listening }
end
