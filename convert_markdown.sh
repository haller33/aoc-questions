#!/bin/bash

for i in $(ls aoc | grep -v 'static'); do
	for q in $(ls aoc/$i/day | sort --version-sort); do
		dayofyeardir="aoc/$i/day/$q"
		echo "$dayofyeardir"
		
		file=$(ls $dayofyeardir | grep index )
		inputof=$(ls $dayofyeardir | grep input )

		cat $dayofyeardir'/'$file
		break;
	done
	break;
done
