#
# Cookbook Name:: vault-template
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

include_recipe 'chef-vault'

aws = lambda do
  Chef::Log.warn("accessing aws lambda")
  chef_vault_item('credentials', 'aws')
end

new_sha = lambda do
  Chef::Log.warn('in new_sha')
  true
end

template '/etc/s3cfg' do
  source 's3cfg.erb'
  owner 'root'
  group 'root'
  mode 00744
  variables lazy {
    { aws_access_key: aws.call['aws_access_key'] }
  }
  only_if {new_sha.call()}
end
