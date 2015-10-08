<?php

// require_once 'config.php';
// require_once 'image.php';

// $files = array_diff(scandir($pathimgfoder), array('..', '.', '.DS_Store'));

// function smaller ($files, $key, $pathimgfoder) {
// 	$imgpath = $pathimgfoder.'/'.$files;
//     $finfo = finfo_open();
// 	$fileinfo = finfo_file($finfo, $imgpath, FILEINFO_MIME);
// 	finfo_close($finfo);
// 	if (strpos($fileinfo,'image') !== false) {
// 		echo '$imgpath : '.$imgpath;
// 		// $img = new Image($imgpath);
// 		// $img->name($NewName);
// 		// $imgsize = getimagesize($imgpath);
// 		// echo '$imgsize : '.$imgsize[1];
// 		// if($imgsize[1]>2000){
// 		// $img->width(800);
// 		// }
// 		// $img->save();
// 	}
// }

// array_walk($files, 'smaller', $pathimgfoder);

?>

<?php
require_once 'config.php';
//Maximize script execution time
ini_set('max_execution_time', 0);

//Initial settings, Just specify Source and Destination Image folder.
$ImagesDirectory    = $pathimgfoder.'/'; //Source Image Directory End with Slash
$DestImagesDirectory    = $pathimgfoder.'new/'; //Destination Image Directory End with Slash
$NewImageWidth      = 500; //New Width of Image
$NewImageHeight     = 500; // New Height of Image
$Quality        = 80; //Image Quality

//Open Source Image directory, loop through each Image and resize it.
if($dir = opendir($ImagesDirectory)){
	echo 'opened';
    while(($file = readdir($dir))!== false){

        $imagePath = $ImagesDirectory.$file;
        echo 'imagePath'.$imagePath;
    	$destPath = $DestImagesDirectory.$file;
        $checkValidImage = @getimagesize($imagePath);

        if(file_exists($imagePath) && $checkValidImage) //Continue only if 2 given parameters are true
        {
            //Image looks valid, resize.
            if(resizeImage($imagePath,$destPath,$NewImageWidth,$NewImageHeight,$Quality))
            {
                echo $file.' resize Success!<br />';
                /*
                Now Image is resized, may be save information in database?
                */

            }else{
                echo $file.' resize Failed!<br />';
            }
        }
    }
    closedir($dir);
}

//Function that resizes image.
function resizeImage($SrcImage,$DestImage, $MaxWidth,$MaxHeight,$Quality)
{
    list($iWidth,$iHeight,$type)    = getimagesize($SrcImage);
    $ImageScale             = min($MaxWidth/$iWidth, $MaxHeight/$iHeight);
    $NewWidth               = ceil($ImageScale*$iWidth);
    $NewHeight              = ceil($ImageScale*$iHeight);
    $NewCanves              = imagecreatetruecolor($NewWidth, $NewHeight);

    switch(strtolower(image_type_to_mime_type($type)))
    {
        case 'image/jpeg':
        case 'image/png':
        case 'image/gif':
            $NewImage = imagecreatefromjpeg($SrcImage);
            break;
        default:
            return false;
    }

    // Resize Image
    if(imagecopyresampled($NewCanves, $NewImage,0, 0, 0, 0, $NewWidth, $NewHeight, $iWidth, $iHeight))
    {
        // copy file
        if(imagejpeg($NewCanves,$DestImage,$Quality))
        {
            imagedestroy($NewCanves);
            return true;
        }
    }
}

?>