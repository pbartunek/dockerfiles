#!/bin/sh

reportFile=report.html
logFile=scraper.log
totalUrls=$#

for site in $@; do
  /usr/bin/chromium-browser --headless --disable-gpu --window-size=1280,800 --screenshot="$(basename $site).png" $site 2>> $logFile
done

files=$(cat $logFile | grep "Written to" | wc -l)

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
cat $logFile | grep "Written to" | cut -d" " -f5 | sed 's/\.$//' | while read filename; do
domain=$(basename $filename .png)
cat <<-HTML
    <tr>
      <td><a href="http://${domain}" target="_blank">${domain}</a></td>
      <td><img src="./${filename}" /></td>
    </tr>
HTML
done
cat <<-HTML
  </table>
  </body>
</html>
HTML
fi
