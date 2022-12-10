#!/bin/bash

MARK_SIMBLE="*"

orgdir="org-mode"

mkdir -p ${orgdir}

for i in $(ls aoc | grep -v 'static'); do
    for q in $(ls aoc/$i/day | sort --version-sort); do
	dayofyeardirmkd="${orgdir}/$i/day/$q"
	dayofyeardir="aoc/$i/day/$q"
	echo "$dayofyeardir"
	echo "$dayofyeardirorg"


	file=$(ls $dayofyeardir | grep index )
	inputof=$(ls $dayofyeardir | grep input )

	fileinput=${dayofyeardir}'/'${inputof}

	fileinputdestiny=${dayofyeardirmkd}'/'input

	filehtml=${dayofyeardir}'/'${file}
	# echo ${filehtml}

	
	mkdir -p ${dayofyeardirmkd}

	file_org_path="$dayofyeardirmkd/README.org"

	cp ${fileinput} ${fileinputdestiny}
	
	links -dump ${filehtml} > ${file_org_path}

	
	title=$(grep '\-\-\- Day' $file_org_path )

	echo "${MARK_SIMBLE} $title" > ${file_org_path}.new

	
	## to check the higer file lenght
	#  find . -type f -and -name '*.org' | xargs wc -l | awk '{print $1}' | uniq | sort --version-sort | tail -n 2

	
	cat ${file_org_path} | awk 'c&&c--;/Day/{c=512}' | head -n -3 >> ${file_org_path}.new

	rm ${file_org_path}
	
	mv ${file_org_path}.new ${file_org_path}
	
	# break;
    done
    # break;
done
