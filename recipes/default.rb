#
# Cookbook Name:: vault-template
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

include_recipe 'chef-vault'

#aws = chef_vault_item('credentials', 'aws')
aws = chef_vault_item('secrets', 'dbpassword')
aws_secret_key = aws['aws_secret_key']
aws_access_key = aws['aws_access_key']

template '/etc/s3cfg' do
  source 's3cfg.erb'
  owner 'root'
  group 'root'
  mode 00744
  variables ({
    aws_secret_key: aws_secret_key,
    aws_access_key: aws_access_key,
  })
end
