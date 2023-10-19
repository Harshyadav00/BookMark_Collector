#!/bin/bash

# Define paths to the bookmark files for different browsers
CHROME_BOOKMARKS_PATH="/mnt/c/users/chhat/appdata/local/google/chrome/User Data/default/Bookmarks.bak"
FIREFOX_BOOKMARKS_PATH="/mnt/c/Users/chhat/AppData/Roaming/Mozilla/Firefox/Profiles/elax7yhm.dev-edition-default-1697698630755/places.sqlite"
BRAVE_BOOKMARKS_PATH="/mnt/c/users/chhat/appdata/local/BraveSoftware/Brave-Browser/User Data/Default/Bookmarks"

# Define the output file for storing bookmarks data
OUTPUT_FILE="bookmarksData.txt"

# Set the SQL query to retrieve Firefox bookmarks
FIREFOX_SQL_QUERY="SELECT B.title AS Site_Name, P.url AS URL
FROM moz_bookmarks AS B
JOIN moz_places AS P ON B.fk = P.id
WHERE B.type = 1;"

# Check if the Chrome bookmarks file exists
if [ -f "$CHROME_BOOKMARKS_PATH" ]; then
    # Save Chrome bookmarks with a label to the output file
    echo "Chrome Bookmarks:" > "$OUTPUT_FILE"
    jq -r '.roots.bookmark_bar.children[] | select(.type == "url") | .name + ": " + .url' "$CHROME_BOOKMARKS_PATH" >> "$OUTPUT_FILE"
    echo -e "\n-------------------------\n" >> "$OUTPUT_FILE"
    echo "Chrome Bookmarks Data Copied"
else
    echo "Chrome bookmarks file doesn't exist"
fi

# Append Firefox bookmarks data with a label to the output file
echo "Firefox Bookmarks:" >> "$OUTPUT_FILE"
sqlite3 "$FIREFOX_BOOKMARKS_PATH" "$FIREFOX_SQL_QUERY" >> "$OUTPUT_FILE"
echo -e "\n-------------------------\n" >> "$OUTPUT_FILE"
echo "Firefox Bookmarks Data Appended"

# Check if the Brave bookmarks file exists
if [ -f "$BRAVE_BOOKMARKS_PATH" ]; then
    # Save Brave bookmarks with a label to the output file
    echo "Brave Bookmarks:" >> "$OUTPUT_FILE"
    jq -r '.roots.bookmark_bar.children[] | select(.type == "url") | .name + ": " + .url' "$BRAVE_BOOKMARKS_PATH" >> "$OUTPUT_FILE"
    echo "Brave Bookmarks Data Copied"
else
    echo "Brave bookmarks file doesn't exist"
fi
