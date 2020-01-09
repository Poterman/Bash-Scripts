#!/bin/bash

#this script will execute a web page using cURL command and will print out the response and the response code

#variables
message="$(curl https://supportlogs.jfrog.com/dropbox/api/system/ping)"
response_code="$(curl -I https://supportlogs.jfrog.com/dropbox/api/system/ping)"

#main
echo "This is the message: $message"
echo "This is the response code: $response_code"
