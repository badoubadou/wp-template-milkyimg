<?php
require_once 'config.php';

/////////////////// change

$content = $_POST["content"];
$fileurl = $_POST["fileurl"];


function writer($fileurl, $content){
$myfile = fopen($fileurl, "w") or die("Unable to open file!");
fwrite($myfile, $content);
fclose($myfile);
}

writer('../'.$pathdatafolder.$fileurl.'.json', $content);


////////////// save
function recurse_copy($src,$dst) {
    $dir = opendir($src);
    @mkdir($dst);
    while(false !== ( $file = readdir($dir)) ) {
        if (( $file != '.' ) && ( $file != '..' )) {
            if ( is_dir($src . '/' . $file) ) {
                recurse_copy($src . '/' . $file,$dst . '/' . $file);
            }
            else {
                copy($src . '/' . $file,$dst . '/' . $file);
            }
        }
    }
    closedir($dir);
}

$dst = "../cloud/srv/data_".time();
mkdir($dst, 0700);

recurse_copy("../".$pathdatafolder,$dst);

?>
