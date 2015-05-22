#!/bin/bash

# GENERAL
standard=( \
	"generator-backbone" \
	"generator-ionic" \
	"generator-bootstrap" \
	"generator-mobile" \
	"generator-browserify" \
	"generator-pure" \
	"generator-meanstack" \
	"generator-modern-frontend" \
	"generator-sails-rest-api" \
	"generator-jade" \
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
		rm -f errors
		continue
		#exit 
	fi

	echo "OK"
	echo ""

	rm -f errors

	sleep 1

done

