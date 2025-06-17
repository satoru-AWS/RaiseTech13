require 'serverspec'

set :host, ENV['TARGET_HOST']

set :backend, :ssh
set :ssh_options,{
   user: 'ec2-user',
   keys: ['~/.ssh/id_rsa'],
   auth_methods: ['publickey'],
   verify_host_key: :never
}