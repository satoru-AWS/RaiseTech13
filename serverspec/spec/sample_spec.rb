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

describe command('/home/ec2-user/.rbenv/shims/ruby -v') do
    its(:stdout) { should match /ruby 3\.2\.3/ }
end

describe port(80) do
    it { should be_listening }
end

alb_dns = ENV['ALB_DNS']

describe "ALB external access" do
    describe command("curl -s -o /dev/null -w \"%{http_code}\" http://#{alb_dns}") do
        its(:stdout){ should match /^200/ }
    end
end