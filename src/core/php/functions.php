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

function ListFolder($path, $sub)
{
    //using the opendir function
    $dir_handle = @opendir($path) or die("Unable to open $path");

    $racine = (!$sub) ? str_lreplace('/','',$path) : ($sub.'/');
    //Leave only the lastest folder name
    $dirname = end(explode("/", $path));
    $pathsubfolder = $dirname.'/';
    //display the target folder.
    if($sub){
        echo "<div class=\"folder\">\n";
        echo "<input type=\"checkbox\" id='$dirname' class=\"folder-trigger\" />\n";
        echo "<label for=\"$dirname\" class='icon-folder'>$dirname</label>";
        echo "<ul class=\"sub\">\n";
    }
    else{
        echo "<ul id=$racine class=\"racine\">\n";
    }


    while (false !== ($file = readdir($dir_handle)))
    {
        if($file!="." && $file!=".." && $file!=".DS_Store")
        {
            if (is_dir($path."/".$file))
            {
                //Display a list of sub folders.
                ListFolder($path."/".$file, $racine);
            }
            else
            {
                //Display a list of files.
                echo "<li><img src='$racine$pathsubfolder$file'>$file</li>";
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
        $class = implode(' ', d('classes',$data));
        $data['moreclass'] = $class;
        $data['blockclass'] = 'level-'.d('level',$data).' '.d('type',$data).' '.$class.' ';
        if(d('type',$data) === 'repeater'){
            $data['contentclass'] .= ' grid';
        }else{
            $nbcol = count($tab);
            $data['blockclass'] .= 'col-'.round((12/$nbcol)*10)/10;
        };
        include 'module/blocks/index.php.php';
    }
}


foreach ($jsonIterator as $key => $val) {
     // if(is_array($val)) {
     //     echo "$key:\n";
     // } else {
     //     echo "$key => $val\n";
     // }
 }