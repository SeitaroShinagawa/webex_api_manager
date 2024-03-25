#!/bin/bash

record_id=$1

curl --request GET \
   https://webexapis.com/v1/recordings/${record_id} \
   --header "Authorization: Bearer ${ACCESS_TOKEN}"
   