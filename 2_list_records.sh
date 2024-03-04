#!/bin/bash

num=$1
if ! -e num ; then
  echo "The num of recordings to list is not provided. Set 10 as default."
  num=10
fi

curl --request GET \
   --header "Authorization: Bearer ${ACCESS_TOKEN}" \
   https://webexapis.com/v1/recordings?max=${num} > items.json