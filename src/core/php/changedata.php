<?php
require_once 'config.php';

$content = $_POST["content"];
$fileurl = $_POST["fileurl"];


function writer($fileurl, $content){
$myfile = fopen($fileurl, "w") or die("Unable to open file!");
fwrite($myfile, $content);
fclose($myfile);
}

writer('../'.$pathdatafolder.$fileurl.'.json', $content);


?>
