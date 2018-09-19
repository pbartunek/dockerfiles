#!/bin/bash

# output files
logFile=scraper.log
reportFile=report.html

# capture screenshots
phantomjs --proxy=$PROXY /data/scraper-phantom.js $@ >> $logFile

# generate HTML report for successful URLs
# based on log file from phantomjs script

files=$(cat $logFile | grep Rendered | wc -l)

if [[ "$files" -gt "0" ]]; then
exec 1<>$reportFile
cat <<-HTML
<html>
  <head>
    <title></title>
    <style>
    table, td, tr {
      border: 1px solid black;
    }
    </style>
  </head>
  <body>
  <table>
HTML
cat $logFile | grep Rendered | cut -d" " -f5,8 | while read line; do
  if [ -z "$line" ]; then
    continue;
  fi
  IFS=", " read url img <<< $line
cat <<-HTML
    <tr>
      <td width="400px"><a href="${url}" target="_blank">${url}</a></td>
      <td><img src="./${img}" /></td>
    </tr>
HTML
done
cat <<-HTML
  </table>
  </body>
</html>
HTML
fi
