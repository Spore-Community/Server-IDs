#!/bin/bash
# Organizes all IDs in a single file to ensure they are in-order and contain no duplicates
# Usage: cleanup_ids.sh path/to/file.txt

sort -u "$1" -o "$1"