# webex_api_manager

## Preparation
Get your Access Token (need login)  
https://developer.webex.com/docs/getting-started

Set your Access Token
```bash
export ACCESS_TOKEN="hogehoge"
```

# Manage your records

## Listing records
```bash
curl --request GET \
   --header "Authorization: Bearer ${ACCESS_TOKEN}" \
   https://webexapis.com/v1/recordings?max=10 > items.json
```

## Extract record ids
```bash
for record_id in `cat items.json | jq -r '.items[].id'`
   do bash retrieve_records.sh ${ACCESS_TOKEN} > ${record_id}.json
 done
 
 if [ -e items.json ];then
   rm items.json
 fi
```

## Show download links
```bash
for recorded_json in `ls *.json`
   do cat ${recorded_json} | jq -r '.temporaryDirectDownloadLinks.recordingDownloadLink'
 done
```
