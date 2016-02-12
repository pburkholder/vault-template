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


# this works if the secret changes
b = Chef::DataBagItem.load('credentials', 'aws')
Chef::Log.warn(b.to_json)
encrypted_db_sum = Digest::SHA256.hexdigest(b.to_json)
Chef::Log.warn(encrypted_db_sum)

if node['vault-template']['sum'] != encrypted_db_sum then
  Chef::Log.warn("Running refresh code")

# but not if '/etc/s3cfg' is gone
  template '/etc/s3cfg' do
    source 's3cfg.erb'
    owner 'root'
    group 'root'
    mode 00744
    variables lazy {
      { aws_access_key: aws.call['aws_access_key'] }
    }
  end

  node.default['vault-template']['sum'] = encrypted_db_sum

end
