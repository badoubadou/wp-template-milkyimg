<?php
$path = $_SERVER['DOCUMENT_ROOT'].'/'.$_POST["path"];
$type = $_POST["type"];

if($type=='file'){
	unlink($path);
	echo $path;
}
if($type=='folder'){
	if(substr($path, -1) == '/') {
	    $path = substr($path, 0, -1);
	}
	rmdir($path);
	echo $path.'  folder';
}

?>