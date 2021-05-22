# This script takes all the work reports of the last weeks (roughly the last month)
# concatenates them and converts them to a PDF named as `Work-Report-April` where April
# is the name of the last month.
# The conversion from markdown to PDF is done with `pandoc`. Pandoc usually expects `latex-base`
# and latex-extra` to be installed for the PDF engine to work correctly.
#!/bin/bash

LANG=en_us_8859_1

LAST_MONTH=$(date -d "last month" '+%B')
CALENDAR_WEEK=$(date +%V)
FILE_NAME=~/Desktop/Arbeit/Skycoin/Work\ Reports/Work-Report-$LAST_MONTH.md
FILE_NAME_TRIMMED=~/Desktop/Arbeit/Skycoin/Work\ Reports/Work-Report-$LAST_MONTH

touch "$FILE_NAME"

for i in {4..0}
do 
EVAL_WEEK=$(($CALENDAR_WEEK - $i))
cat ~/Desktop/Arbeit/Skycoin/Work\ Reports/CW-$EVAL_WEEK.md >> "$FILE_NAME"
done

pandoc "$FILE_NAME" -o "$FILE_NAME_TRIMMED".pdf

rm "$FILE_NAME"


