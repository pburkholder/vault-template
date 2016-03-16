# vault-template

Are you writing a cookbook that uses `chef-vault` but not sure how to test it? This cookbook has the test fixtures in place to enable integration testing. To use this, assuming you have ChefDK and Vagrant installed:

```
git clone https://github.com/pburkholder/vault-template.git
cd vault-template
kitchen verify # should complete OK
```

Then start editing to do your own thing. To update with your own vault items, edit test/fixtures/cookbooks/test/recipes/chef_vault_secret.rb (and keep on testing).

Happy Cheffing!


## TODO

__ Demonstrate ChefSpec

## Testing with dokken

Use dokken with inspec.

```
chef gem install kitchen-dokken # v 0.25.0 or higher
chef gem install kitchen-inspec # v 0.11.0 or higher
export KITCHEN_LOCAL_YAML=.kitchen.dokken.yml
eval $(docker-machine env default)
```
