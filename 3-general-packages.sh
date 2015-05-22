#!/bin/bash

# GENERAL
standard=( \
	"stylus" \
	"less" \
	"gulp" \
	"jshint" \
	"forever" \
	"nodemon" \
	"localtunnel" \
    )

TOTAL=${#standard[@]} 
echo "start - $TOTAL packages"

# install and exit on sterr
for i in "${standard[@]}"
do
	rm -f errors

	PNAME="$i"

	echo -n "$PNAME - installing - "

	sudo npm install -g $PNAME 2>errors 1>/dev/null

	if [ -s errors ]; then 
		echo ""
		echo "############################################################################" 
		echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
		echo "There were errors:" 
		echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
		echo "############################################################################" 
		cat errors 
		exit 
	fi

	echo "OK"
	echo ""

	rm -f errors

	sleep 1

done

