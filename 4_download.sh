#!/bin/bash

set -eu 

if ! -e record_info; then
  mkdir record_info
fi

for record_id in `cat items.json | jq -r '.items[].id'`
   do bash retrieve_record.sh ${record_id} > record_info/${record_id}.json
 done