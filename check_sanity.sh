#!/bin/bash

echo "files with problem"
echo ""

grep -rin "Please don't repeatedly request this endpoint before it unlocks! The calendar cou" | awk -F':' '{print $1  "----"  $3}'

