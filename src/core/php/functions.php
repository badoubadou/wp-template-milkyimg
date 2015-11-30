<?php

if(!function_exists('d')) {
	function d($key, $data = null) {
	  $output = '';
	  if($key === '*') {
	    $output = $data;
	  } elseif(isset($data) && is_array($data) && array_key_exists($key, $data)) {
	    $output = $data[$key];
	  }
	  return $output;
	}
}

function getfirst($keystring,$jsonarray){
	$output = '';
	foreach($jsonarray as $key => $val) {
		$output = d($keystring,$val);
		break;
	}
	return $output;
}
function getmein($thisarray,$thisattr,$matchingstring,$thatattr){
	$output = false;
	foreach($thisarray as $k => $val) {
		if(d($thatattr,$val) === $matchingstring){
			$output = d($thisattr,$val);
			break;
		};
	}
	return $output;
}
function isin($thisarray,$thisattr,$matchingstring){
    $output = false;
    foreach($thisarray as $k => $val) {
        if(d($thisattr,$val) === $matchingstring){
            $output = true;
            break;
        };
    }
    return $output;
}
function getclass($jsonarray){
    $output = '';
    foreach($jsonarray as $key => $val) {
        $output .=  $val.' ';
    }
    return $output;
}

function ListFolder($path, $sub, $level)
{
    $lev = $level ? $level : 0;
    //using the opendir function
    $dir_handle = @opendir($path) or die("Unable to open $path");

    $pathtoimg .= $path.'/';
    $racine = (!$sub) ? str_lreplace('/','',$path) : ($sub.'/');
    //Leave only the lastest folder name
    $dirname = end(explode("/", $path));
    $type = 'img';
    if($dirname==='srv'){
        return false;
    }
    $ispdf = false;
    if($dirname==='pdf'){
        $ispdf = true;
        $type = 'pdf';
    }
    $ismp3 = false;
    if($dirname==='mp3'){
        $ismp3 = true;
        $type = 'mp3';
    }
    $isvideo = false;
    if($dirname==='video'){
        $isvideo = true;
        $type = 'video';
    }
    $pathsubfolder = $dirname.'/';

    $idlist = 'idlist_'.uniqid();
    //display the target folder.
    if($sub){
        echo "<div class=\"notsortable folder\" data-path=\"$pathtoimg\"  data-name=\"$dirname\"  data-list=\"sub_".$lev."\" data-check=\"$dirname$lev\" >\n";
        echo "<input type=\"checkbox\" id=\"$dirname$lev\" class=\"notsortable folder_".$lev."  folder-trigger\" />\n";
        echo "<label for=\"$dirname$lev\" class='icon-folder notsortable'>$dirname</label>";
        echo "<ul class=\"listimg sub_".$lev."\"  id='$idlist' data-path=\"$pathtoimg\">\n";
    }
    else{
        echo "<ul id=$racine class=\"notsortable racine\" data-path=\"$pathtoimg\">\n";
    }


    while (false !== ($file = readdir($dir_handle)))
    {
        if($file!="." && $file!=".." && $file!=".DS_Store")
        {
            if (is_dir($path."/".$file))
            {
                //Display a list of sub folders.
                ListFolder($path."/".$file, $racine, ($lev+1));
            }
            else
            {
                //Display a list of files.
                $mini =  "mini-me-";
                if(!$ispdf && !$ismp3){
                    echo "<li class='$idlist' data-type='$type' data-from-where='$idlist' data-list=\"sub_".$lev."\" data-check=\"$dirname$lev\" data-path='$pathtoimg' data-path-file='$pathtoimg$file'  data-name='$file'><div class='contimg'><img src='$pathtoimg$mini$file'></div><div class='name'>$file</div></li>";
                }
                if($ispdf){
                    echo "<li class='$idlist' data-type='$type' data-from-where='$idlist' data-list=\"sub_".$lev."\" data-check=\"$dirname$lev\" data-path='$pathtoimg' data-path-file='$pathtoimg$file'  data-name='$file'><div class='name'>$file</div></li>";
                }
                if($ismp3){
                    echo "<li class='$idlist' data-type='$type' data-from-where='$idlist' data-list=\"sub_".$lev."\" data-check=\"$dirname$lev\" data-path='$pathtoimg' data-path-file='$pathtoimg$file'  data-name='$file'><div class='name'>$file</div></li>";
                }
            }
        }
    }
    echo "</li>\n";
    echo "</ul>\n";
    if($sub){
        echo "</div>\n";
    }
    //closing the directory
    closedir($dir_handle);
}
function str_lreplace($search, $replace, $subject)
{
    $pos = strrpos($subject, $search);

    if($pos !== false)
    {
        $subject = substr_replace($subject, $replace, $pos, strlen($search));
    }
    return $subject;
}

function parser($tab, $admin, $dico){
    foreach($tab as $index => $module) {
        $data = $module;
        $data['key'] = $index;
        $data['level'] = d('level',$data);
        $data['column'] = d('column',$data);
        $class = implode(' ', d('classes',$data));
        $data['moreclass'] = $class;
        $data['blockclass'] = 'level-'.d('level',$data).' '.d('type',$data).' '.$class.' ';
        $data['isfullscreen'] = in_array('fullscreen', d('classes',$data));
        $data['color'] = '';
        if(in_array('white', d('classes',$data))){
            $data['color'] = 'white';
        }
        if(in_array('red', d('classes',$data))){
            $data['color'] = 'red';
        }
        if(in_array('black', d('classes',$data))){
            $data['color'] = 'black';
        }
        if(d('type',$data) === 'repeater'){
            $data['contentclass'] .= ' grid';
        }else{
            $nbcol = count($tab);
            if($data['column'])
                $data['blockclass'] .= $data['column'];
            else
                $data['blockclass'] .= 'col-'.round((12/$nbcol)*10)/10;

            $data['nbcol'] = $nbcol;
        };
        include 'module/blocks/index.php.php';
    }
}
