#!/bin/sh

reportFile=report.html

for site in $@; do
  cd /workdir
  /usr/bin/chromium-browser --headless --disable-gpu --window-size=1280,800 --screenshot="$(basename $site).png" $site
done

files=$(ls *.png | wc -l)

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
ls *.png | while read file; do
domain=$(basename $file .png)
cat <<-HTML
    <tr>
      <td><a href="http://${domain}" target="_blank">${domain}</a></td>
      <td><img src="./${file}" /></td>
    </tr>
HTML
done
cat <<-HTML
  </table>
  </body>
</html>
HTML
fi
