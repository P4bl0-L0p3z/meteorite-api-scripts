#!/bin/bash
####Config
limit=1000
offset=0
combined_file="meteoritos_masa.json"
temp_dir="temp_meteoritos_masa"
####Creates a temporary folder
mkdir -p "$temp_dir"
echo "Downloading data..."
echo "Downloading and processing entries. Please Wait..."
####Downloads in a loop every 1000 entries
while true; do
output_file="$temp_dir/meteoritos_${offset}.json"
####Makes the request
curl -s "https://data.nasa.gov/resource/y77d-th95.json?\$limit=${limit}&\$offset=${offset}" -o "$output_file"
count=$(jq length "$output_file")
####If fewer records than requested are obtained, this is the last page
if [ "$count" -lt "$limit" ]; then
break
fi
####Increments the offset for the next request
offset=$(( offset + limit ))
done
####Use jq to combine all JSONs files
jq -s 'add' "$temp_dir"/*.json > "$combined_file"
echo "Dataset has a total of $(jq length "$combined_file") entries."
####Process the combined file
echo "The most massive meteorite is"
jq -r '[.[] | select(.mass != null)] | max_by(.mass | tonumber) | "\(.name) \(.mass)"' "$combined_file"
echo "Displaying the most frequent year (Number of occurrences - Year):"
jq -r '.[].year // empty' "$combined_file" | cut -d'-' -f1 | sort | uniq -c | sort -nr | head -n1
####Clean temporary files
rm -rf "$temp_dir"
echo "request completed"
