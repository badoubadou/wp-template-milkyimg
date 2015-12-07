<?php
$path = $_SERVER['DOCUMENT_ROOT'].'/'.$_POST["path"];
$type = $_POST["type"];

function deleteDirectory($dir) {
    if (!file_exists($dir)) {
        return true;
    }

    if (!is_dir($dir)) {
        return unlink($dir);
    }

    foreach (scandir($dir) as $item) {
        if ($item == '.' || $item == '..') {
            continue;
        }

        if (!deleteDirectory($dir . DIRECTORY_SEPARATOR . $item)) {
            return false;
        }

    }

    return rmdir($dir);
}

if($type=='file'){
	unlink($path);
	echo $path;
}
if($type=='folder'){
	if(substr($path, -1) == '/') {
	    $path = substr($path, 0, -1);
	}

	deleteDirectory($path);
	echo $path.'  folder';
}

?>