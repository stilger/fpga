#!/bin/bash
clear
card=`echo "$1" |tr A-Z a-z`

if [ -f "$card.log" ]; then
	while true; do 
		echo " $(date) - Starting: Currently: $(tail -20 $card.log | grep FTDI | wc -l) -  Waiting 5 minutes"
		sleep 300
		while [ "$(tail -20 $card.log | grep FTDI | wc -l)" -ge 10 ]; do
			echo "$(date) - Good: $(tail -20 $card.log | grep FTDI | wc -l) of 10 needed -  Waiting 5 minutes"
			done 
		echo "$(date) - Problem: $(tail -20 $card.log | grep FTDI | wc -l) of 10 needed - killing card"
		pkill -f ".$card -"
		done
else
	echo "Error: $card.log does not exist"
	echo "Syntax: monitor.sh card"
	echo "Example: monitor.sh fk1"
fi
