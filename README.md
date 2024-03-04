# webex_api_manager

## Preparation
Get your Access Token (need login)  
https://developer.webex.com/docs/getting-started

Set your Access Token
```bash
export ACCESS_TOKEN="hogehoge"
```

# Manage your records

## listing records
```bash
curl --request GET \
   --header "Authorization: Bearer ${ACCESS_TOKEN}" \
   https://webexapis.com/v1/recordings?max=10 > items.json
```


