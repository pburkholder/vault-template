# vault-template

TODO: Enter the cookbook description here.

## Testing with dokken

Use dokken with inspec.

```
chef gem install kitchen-dokken # v 0.25.0 or higher
chef gem install kitchen-inspec # v 0.11.0 or higher
export KITCHEN_LOCAL_YAML=.kitchen.dokken.yml
eval $(docker-machine env default)
```
