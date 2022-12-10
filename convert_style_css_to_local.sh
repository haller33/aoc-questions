#!/bin/bash

cd aoc

find . -type f -and -name 'index.html' | xargs sed -i 's/\/static\/style\.css/..\/..\/..\/static\/style\.css/g'
