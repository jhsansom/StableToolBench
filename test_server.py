# This file tests whether or not the server is working

import requests
import json
import os

url = 'http://127.0.0.1:12001/virtual'
#url = 'http://0.0.0.0:8080/virtual'
data = {
    "category": "Social",
    "tool_name": "Instagram Data",
    "api_name": "User info by username",
    "tool_input": "{}",
    "strip": "truncate",
    "toolbench_key": ""
}
headers = {
    'accept': 'application/json',
    'Content-Type': 'application/json',
}

# Make the POST request
response = requests.post(url, headers=headers, data=json.dumps(data))
print(response.text)