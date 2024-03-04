#!/bin/bash

record_id=$1

# HOST_EMAIL="sei.shinagawa@is.naist.jp"

curl -X DELETE \
   --header "Authorization: Bearer ${ACCESS_TOKEN}" \
   https://webexapis.com/v1/recordings/${record_id}
