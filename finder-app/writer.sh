#!/bin/bash

writefile=$1
writestr=$2

# Check if both arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Error: Two arguments are required."
    echo "Usage: $0 <full_path_to_file> <text_string_to_write>"
    exit 1
fi

# Extract the directory path from the full path
dirpath=$(dirname "$writefile")

# Create the directory path if it does not exist
if [ ! -d "$dirpath" ]; then
    mkdir -p "$dirpath"
    if [ $? -ne 0 ]; then
        echo "Error: Failed to create directory path."
        exit 1
    fi
fi

# Write the string to the file, creating or overwriting the file as necessary
echo "$writestr" > "$writefile"
if [ $? -ne 0 ]; then
    echo "Error: Failed to write to the file."
    exit 1
fi

