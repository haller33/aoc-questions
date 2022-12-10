#!/bin/bash

MARK_SIMBLE="#"

markdowndir=markdown

mkdir -p ${markdowndir}

for i in $(ls aoc | grep -v 'static'); do
    for q in $(ls aoc/$i/day | sort --version-sort); do
	dayofyeardirmkd="$markdowndir/$i/day/$q"
	dayofyeardir="aoc/$i/day/$q"
	echo "$dayofyeardir"
	echo "$dayofyeardirmkd"

	file=$(ls $dayofyeardir | grep index )
	inputof=$(ls $dayofyeardir | grep input )

	fileinput=${dayofyeardir}'/'${inputof}

	fileinputdestiny=${dayofyeardirmkd}'/'input

	filehtml=${dayofyeardir}'/'${file}
	# echo ${filehtml}
	
	mkdir -p ${dayofyeardirmkd}

	file_md_path="$dayofyeardirmkd/index.md"

	cp ${fileinput} ${fileinputdestiny}
	
	links -dump ${filehtml} > ${file_md_path}

	
	title=$(grep '\-\-\- Day' $file_md_path )

	echo "${MARK_SIMBLE} $title" > ${file_md_path}.new

	
	## to check the higer file lenght
	#  find . -type f -and -name '*.md' | xargs wc -l | awk '{print $1}' | uniq | sort --version-sort | tail -n 2

	
	cat ${file_md_path} | awk 'c&&c--;/Day/{c=512}' | head -n -3 >> ${file_md_path}.new

	rm ${file_md_path}
	
	mv ${file_md_path}.new ${file_md_path}
	
	
	# break;
    done
    # break;
done
