<?php
$oldname = $_SERVER['DOCUMENT_ROOT'].'/'.$_POST["oldname"];
$newname = $_SERVER['DOCUMENT_ROOT'].'/'.$_POST["newname"];

if (file_exists($oldname)) {
    echo "fuck ok Le fichier $filename existe.".$oldname;
} else {
    echo "pas glop pas ok Le fichier $filename n'existe pas.   ".$oldname;
}

echo $path.' |||||'. $oldname.' |||||'. $newname.' |||||'.realpath(__DIR__ . '/..');
rename ($oldname, $newname);
?>