#!/bin/bash

# code mostly copy from
# https://www.reddit.com/r/adventofcode/comments/rgo4m9/is_there_a_script_to_download_all_the_current/?utm_source=share&utm_mediumandroid_app&utm_name=androidcss&utm_term=1&utm_content=share_button
#
#
# Session cookie for download input only files.
## make sure you are conected to the site of AoC for download all source.
# 
### How Do I Get My Session Cookie?
# 
# Google Chrome:
# 
# - Go to [adventofcode.com](https://adventofcode.com/)
# - Make sure you are logged in
# - Right click and select "Inspect"
# - Select the "Application" tab
# - In the tree on the left, select "Storage" → "Cookies" → "https://adventofcode.com"
# - You should see a table of cookies, find the row with "session" as name
# - Double click the row in the "Value" column to select the value of the cookie
# - Press `CTRL + C` or right click and select "Copy" to copy the cookie
# - Paste it into your configuration file or on the command line
# 
# Mozilla Firefox:
# 
# - Go to [adventofcode.com](https://adventofcode.com/)
# - Make sure you are logged in
# - Right click and select "Inspect Element"
# - Select the "Storage" tab
# - In the tree on the left, select "Cookies" → "https://adventofcode.com"
# - You should see a table of cookies, find the row with "session" as name
# - Double click the row in the "Value" column to select the value of the cookie
# - Press `CTRL + C` or right click and select "Copy" to copy the cookie
# - Paste it into your configuration file or on the command line
#
session="session=<YOUR_SESSION_HEX_CODE>" 

url="https://adventofcode.com"

beginYear=2015
endYear=2022

http_header=' -H "user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36"'

mkdir -p aoc
cd aoc

mkdir static
curl "${url}/static/style.css" > static/style.css

for yearso in $(seq $beginYear $endYear); do

    mkdir -p "$yearso/day"
    url_day="${url}/$yearso/day"
    url_year="${url}/$yearso"

    curl --cookie "$session" "$http_header" "${url_year}" > ${yearso}/index.html

    cd "$yearso/day"

    for i in $(seq 25);	do
	# if [ ! -d $i ]; then
	    
	    mkdir -p $i
	    echo $i
	    curl "${url_day}/${i}" > ${i}/index.html
	    curl --cookie "$session" "$http_header" "${url_day}/${i}/input" > ${i}/input
	    sleep 5
	# fi
    done
    
    # cd ../../
    cd -

done
