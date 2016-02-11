#
# Cookbook Name:: vault-template
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

include_recipe 'chef-vault'

#aws = chef_vault_item('credentials', 'aws')

aws = lambda do
  chef_vault_item('credentials', 'aws')
end

template '/etc/s3cfg' do
  source 's3cfg.erb'
  owner 'root'
  group 'root'
  mode 00744
  variables lazy {
    { aws_access_key: aws.call['aws_access_key'] }
  }
end
