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


## How to use vault in an auditable fashion

Goal: Be able to monitor when a vault is accessed to update anything on a system

Problem: Right now a vault is accessed on every Chef run to see if template contents match the desired state.

Solution: After playing with basic Chef resources like attributes, ruby_block and notifies, it's pretty clear that I'd need to extend the current Template class to
a) store the SHA256 sum of the file as a node attribute
b) compare the attribute value to the current value of that file
c) store the SHA256 sum of vault databag item as a node attribute
d) compare the attribute value to the current SHA256 sum of the item

Only if b) are d) show a mismatch do we converge the template object.
