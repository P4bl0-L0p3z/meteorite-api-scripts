#!/bin/bash
# 1. API URL with the coordinates for 50km around Prague.
url='https://data.nasa.gov/resource/y77d-th95.json?$where=within_circle(geolocation,50.08804,14.42076,50000)'
# 2. Makes HTTP call request to the API via curl.
response=$(curl -s "$url")
# 3. Count the number of records using jq tool
count=$(echo "$response" | jq '. | length')
# 4. Extracts the meteor names, year of impact and sort the results by year.
sorted_output=$(echo "$response" | jq -r 'sort_by(.year) | .[] | "\(.name) - \(.year[0:4])"')
# 5. Display the used URL, the number of results, and the meteorite names with impact year.
echo "$url"
echo "Number of results: $count"
echo "Meteorite Name - Year of Impact:"
echo "$sorted_output"
