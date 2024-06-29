#!/bin/bash
# Sorts IDs from all txt files in type/type_unsorted into the appropriate location
# Usage: sort_ids.sh type

# Operate on every file in the folder
for file in $1/$1_unsorted/*.txt; do
  echo "Processing IDs in $file"
  while read line || [[ -n "$line" ]]; do
    # Skip any lines that are not 12/10-digit numbers
    if [[ ! $line =~ ^(?:[0-9]{12}|[0-9]{10})$'\r'?$'\n'?$ ]]; then
      echo "Skipping line in $file: $line"
      echo "$line" >> "$1/$1_unsorted/unrecognized_id_format.txt"
      continue
    fi

    # Split the ID into sub-IDs
    first=$(echo "$line" | cut -c1-3)
    second=$(echo "$line" | cut -c4-6)
    third=$(echo "$line" | cut -c7-9)

    #echo "$first/$second/$third.txt: $line"

    # Create the directories
    mkdir -p "$1/$first/$second"

    # Add the line to the appropriate file
    echo "$line" >> "$1/$first/$second/$third.txt"

    # Sort the file and remove duplicates - this is inefficient, do this afterwards in a separate script
    #sort -u "$1/$first/$second/$third.txt" -o "$1/$first/$second/$third.txt"
  done < "$file"
  rm -I "$file"
done