#!/bin/bash

set -eu 

for record_id in `cat items.json | jq -r '.items[].id'`
   do bash retrieve_record.sh ${ACCESS_TOKEN} > ${record_id}.json
 done
 
#  if [ -e items.json ];then
#    rm items.json
#  fi