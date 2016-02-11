# vault-template

TODO: Enter the cookbook description here.

## Testing with dokken

Use dokken with inspec.

```
chef gem install kitchen-dokken
chef gem install kitchen-inspec
export KITCHEN_LOCAL_YAML=.kitchen.dokken.yml
eval $(docker-machine env default)
```
---
driver:
  name: vagrant

provisioner:
  name: chef_zero
  nodes_path: test/fixtures/nodes
  clients_path: test/fixtures/clients
  environments_path: test/fixtures/environments
  data_bags_path: test/fixtures/data_bags
  client_rb:
    environment: test

platforms:
  - name: ubuntu-14.04
  - name: ubuntu-12.04
  - name: ubuntu-10.04
  - name: centos-7.1
  - name: centos-6.6
  - name: centos-5.11

suites:
  - name: default
    run_list:
      - recipe[chef-vault]
      - recipe[test]
  - name: secret_resource
    run_list:
      - recipe[chef-vault]
      - recipe[test::chef_vault_secret]
  - name: with-sugar
    run_list:
      - recipe[chef-sugar]
      - recipe[chef-vault]
