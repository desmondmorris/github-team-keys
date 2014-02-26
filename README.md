## Github Team Keys Fetcher

This is a small bash script that grabs the public keys for all of the users in a Github organization.  This is great for adding public keys to the authorized_keys file in linux servers.

#### Dependencies
* curl

#### Usage

````
sh fetch.sh GH_AUTH_TOKEN organization
````

#### Credits

* The json parser is adapted from the [snippet](https://gist.github.com/cjus/1047794) provided by [cjus](https://github.com/cjus)
