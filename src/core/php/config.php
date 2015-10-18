<?php
$local = $_SERVER['REMOTE_ADDR']=='127.0.0.1' ? 1 : 0;
$pathimgfolder = $local ? 'images/' : 'cloud/image/';
$pathdatafolder = $local ? 'data/' : '../data/';
?>