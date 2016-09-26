#!/bin/bash
# -----
# Dummy filesystem stress
# Author: Adanos Flamel, The StormCage Institute
# -----
# Arguments:
# -d /path/to/directory
# -c # Chain more indicator 
# -----
# TODO:
# -s *dirctotysize*
# -i *numberofinstances*
# -----

# ----- CMD options analyze ----- Begin -----
while getopts "d:s:i:c" filey_option; do
	case $filey_option in
		d) filey_path=$OPTARG ;;
#		c) filey_chain=1 ;;
#		i) filey_instance=$OPTARG ;;
	esac
done

if [ ! -d $filey_path ]; then
	echo -e "[Filey-Bench]: ! Error: path is not set or if invalid! \a\a\a Will now exit."
	exit 1
fi
# ----- CMD options analyze -----  End  -----

if [ -z $filey_chain ]; then
	filey_counter=0  # Zero file number by default

	mkdir $filey_path/filey-bench                                        # Creating working directory
	filey_path=$filey_path/filey-bench                                   # Switching to it 
	dd if=/dev/zero of=$filey_path/dummy${filey_counter} count=4 bs=1024 # Creaing dummy file

#	filey_instance_counter=0 # Zero instance counter by default
#	while [ "$filey_instance_counter" -le "$filey_instance" ]; do
#		. $0 &
#	done
fi

while true; do
	let filey_counter=$filey_counter+1
	cp -f $filey_path/dummy0 $filey_path/dummy${filey_counter}
	echo -e "[Filey-Bench]: Created file number $filey_counter"
done