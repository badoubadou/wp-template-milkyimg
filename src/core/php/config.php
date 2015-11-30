<?php
$local = $_SERVER['REMOTE_ADDR']=='127.0.0.1' ? 1 : 0;
$pathimgfolder = $local ? 'cloud/images/' : 'cloud/image/';
$pathcloud = $local ? 'cloud/' : 'cloud/';
$pathdatafolder = $local ? 'data/' : '../data/';

// echo  $_SERVER['DOCUMENT_ROOT'];
// echo file_exists($pathdatafolder);
?>