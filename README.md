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
