<?php
function wd_remove_accents($str, $charset='utf-8')
{
    $str = htmlentities($str, ENT_NOQUOTES, $charset);

    $str = preg_replace('#&([A-za-z])(?:acute|cedil|caron|circ|grave|orn|ring|slash|th|tilde|uml);#', '\1', $str);
    $str = preg_replace('#&([A-za-z]{2})(?:lig);#', '\1', $str); // pour les ligatures e.g. '&oelig;'
    $str = preg_replace('#&[^;]+;#', '', $str); // supprime les autres caractères
    $str = preg_replace('/\s+/', '-', $str);
    $str = strtolower($str);
    return $str;
}
function image_fix_orientation($filename) {
    $exif = exif_read_data($filename);
    if (!empty($exif['Orientation'])) {
        $image = imagecreatefromjpeg($filename);
        switch ($exif['Orientation']) {
            case 3:
                $image = imagerotate($image, 180, 0);
                break;

            case 6:
                $image = imagerotate($image, 90, 0);
                break;

            case 8:
                $image = imagerotate($image, -90, 0);
                break;
        }

        imagejpeg($image, $filename, 90);
    }
}


include("Image.php");

$path = '../'.$_GET["path"];
$type = '../'.$_GET["type"];
$fileName = $_FILES["file1"]["name"]; // The file name
$fileTmpLoc = $_FILES["file1"]["tmp_name"]; // File in the PHP tmp folder
$fileType = $_FILES["file1"]["type"]; // The type of file it is
$fileSize = $_FILES["file1"]["size"]; // File size in bytes
$fileErrorMsg = $_FILES["file1"]["error"]; // 0 for false... and 1 for true

$newName = wd_remove_accents($fileName);

if (!$fileTmpLoc) { // if file not chosen
    echo "ERROR: Please browse for a file before clicking the upload button.";
    exit();
}
if(move_uploaded_file($fileTmpLoc, "$path$newName")){

    $arr = array('path' => $path, 'name' => $newName, 'type' => $type);
    echo json_encode($arr);

    if($type==='img'){
        image_fix_orientation($path.$newName);
        $imgsize = getimagesize($path.$newName);
        if($imgsize[0]>1280){
            $imgresized = new Image($path.$newName);
            $imgresized->width(1280);
        }
        $imgresized->save();
    }

} else {
    echo "move_uploaded_file function failed";
}

?>