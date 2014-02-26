#!/bin/sh

TOKEN="$1"
ORG="$2"

# Make api request to grab organization members
org_members_json=`curl -s -X GET https://api.github.com/orgs/$ORG/members?access_token=$TOKEN`

# Adapted from: https://gist.github.com/cjus/1047794
members=`echo $org_members_json | sed 's/\\\\\//\//g' | sed 's/[{}]//g' | awk -v k="text" '{n=split($0,a,","); for (i=1; i<=n; i++) print a[i]}' | sed 's/\"\:\"/\|/g' | sed 's/[\,]/ /g' | sed 's/\"//g' | grep -w login| cut -d":" -f2| sed -e 's/^ *//g' -e 's/ *$//g'`

# iterate over members list
for member in $members # note that $var must NOT be quoted here!
do
  tmp=`curl -s -X GET https://github.com/$member.keys`
  keys+="$tmp\n"
done

echo "$keys" | grep -v '^$'
