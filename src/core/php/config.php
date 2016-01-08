<?php
$local = $_SERVER['REMOTE_ADDR']=='127.0.0.1' ? 1 : 0;
$pathimgfolder = $local ? 'cloud/image/' : 'cloud/image/';
$pathcloud = $local ? 'cloud/' : 'cloud/';
$pathdatafolder = $local ? '../src/data/' : '../data/';
$modulaire = false;

// echo  $_SERVER['DOCUMENT_ROOT'];
// echo file_exists($pathdatafolder);
?>