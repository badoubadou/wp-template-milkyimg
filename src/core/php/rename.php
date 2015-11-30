<?php
$path = realpath(__DIR__ . '/..').'/'.$_POST["path"];
$oldname = $path.$_POST["oldname"];
$newname = $path.$_POST["newname"];

echo $path.' |||||'. $oldname.' |||||'. $newname.' |||||'.realpath(__DIR__ . '/..');
rename ($oldname, $oldname)
?>