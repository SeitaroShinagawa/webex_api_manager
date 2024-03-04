# webex_api_manager

Requirements:
- jq (use `sudo apt -y install jq`)

## Preparation
Get your Access Token (need login)  
https://developer.webex.com/docs/getting-started

![image](https://github.com/SeitaroShinagawa/webex_api_manager/assets/7993233/9d8149ed-43cb-48c5-9f47-dff52a51728d)


Set your Access Token
```bash
export ACCESS_TOKEN="<replace your own access token>"
```
or 
```bash
source 1_set_access_token.sh <your access token>
```

# Manage your records

## Listing records
```bash
curl --request GET \
   --header "Authorization: Bearer ${ACCESS_TOKEN}" \
   https://webexapis.com/v1/recordings?max=10 > items.json
```
or
```bash
bash 2_list_records.sh
```

output example:
```
{"items":[{"id":"0bdf7d2db9b2103ca5bf765ff4d7bce3","meetingId":"012f433ded4849fcbf47c7947311a25a_I_286760567585116847","scheduledMeetingId":"012f433ded4849fcbf47c7947311a25a_20240301T043000Z","meetingSeriesId":"012f433ded4849fcbf47c7947311a25a","topic":"personal_meeting_hamada-20240301 0428-1","createTime":"2024-03-01T05:29:35Z","timeRecorded":"2024-03-01T04:28:15Z","hostEmail":"sei.shinagawa@is.naist.jp","siteUrl":"naist.webex.com","downloadUrl":"https://naist.webex.com/naist/lsr.php?RCID=fb3bce1797f16480a1fccbaca9011144","playbackUrl":"https://naist.webex.com/naist/ldr.php?RCID=5d20518fbec0fe9e228efa5d5802abde","password":"JwMBwxn7","format":"MP4","durationSeconds":3106,"sizeBytes":84416907,"shareToMe":false,"serviceType":"MeetingCenter","status":"available"},
...
]}
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
or
```bash
bash 3_extract_records_ids.sh
```

## Show download links
```bash
for recorded_json in `ls *.json`
   do cat ${recorded_json} | jq -r '.temporaryDirectDownloadLinks.recordingDownloadLink'
 done
```

# References

Webex recordings API  
https://developer.webex.com/docs/api/v1/recordings
