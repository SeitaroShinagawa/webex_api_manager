#!/bin/bash

record_id=$1

curl --request GET \
   --header "Authorization: Bearer ${ACCESS_TOKEN}" \
   https://webexapis.com/v1/recordings/${record_id}