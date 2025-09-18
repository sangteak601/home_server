#!/bin/bash
DOMAIN="EXAMPLE" # update this to your duckdns domain
TOKEN="TOKEN" # update this to your duckdns token
echo url="https://www.duckdns.org/update?domains=$DOMAIN&token=$TOKEN&ip=" | curl -k -o ~/duckdns/duck.log -K -