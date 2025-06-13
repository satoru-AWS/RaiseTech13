require 'spec_helper'

describe package('nginx') do
    it { should be_installed }
end

describe file('/etc/nginx/conf.d/rails.conf') do
    it { should exist }
    it { should be_file }
end

describe service('nginx') do
    it { should be_running }
end

describe command('bash -lc "ruby -v"') do
    its(:stdout) { should match /ruby 3\.2\.3/ }
end

describe command('bash -lc "bundler -v"') do
    its(:stdout) { should match /Bundler version 2\.3\.14/ }
end

describe port(80) do
    it { should be_listening }
end
