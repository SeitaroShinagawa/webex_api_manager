
# Usage:
# source 1_set_access_token.sh <access_token>
# Token is available at https://developer.webex.com/docs/getting-started

ACCESS_TOKEN=$1
export ACCESS_TOKEN=$ACCESS_TOKEN

echo "Access token set to $ACCESS_TOKEN"