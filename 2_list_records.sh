#!/bin/bash

set -eu

# curl --request GET \
#       "https://webexapis.com/v1/recordings?max=100&from=2022-04-02&to=2022-07-01" \
#       --header "Authorization: Bearer ${ACCESS_TOKEN}" > items_test.json

for year in {2022..2024}
  do 
  for month in `seq -w 1 12`
    do 
      if [ $month -eq 12 ]; then
        month_next=01
        year_next=`expr $year + 1`
      else
        month_next=`expr $month + 1`
        year_next=$year
      fi
      #from
      FROM="$year-$month-02"

      #to
      S=$(printf "%02d\n" "${month_next}")
      TO="$year_next-$S-01"
    
      curl --request GET \
        "https://webexapis.com/v1/recordings?max=100&from=${FROM}&to=${TO}" \
        --header "Authorization: Bearer ${ACCESS_TOKEN}" \
        > items_${FROM}_${TO}.json
    done
    sleep 1
  done
