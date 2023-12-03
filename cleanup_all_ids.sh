#!/bin/bash
# Organizes all IDs of the specified type to ensure they are in-order and contain no duplicates
# Usage: cleanup_ids.sh type

find "./$1" -name "*.txt" -type f -exec ./cleanup_ids.sh {} \;