#!/bin/bash

LANG=en_us_8859_1

LAST_MONTH=$(date -d "last month" '+%B')
CALENDAR_WEEK=$(date +%V)
FILE_NAME=~/Schreibtisch/Arbeit/Skycoin/Work\ Reports/Work-Report-$LAST_MONTH.md
FILE_NAME_TRIMMED=~/Schreibtisch/Arbeit/Skycoin/Work\ Reports/Work-Report-$LAST_MONTH

touch "$FILE_NAME"

for i in {4..0}
do 
EVAL_WEEK=$(($CALENDAR_WEEK - $i))
cat ~/Schreibtisch/Arbeit/Skycoin/Work\ Reports/CW-$EVAL_WEEK.md >> "$FILE_NAME"
done

pandoc "$FILE_NAME" -o "$FILE_NAME_TRIMMED".pdf

rm "$FILE_NAME"


