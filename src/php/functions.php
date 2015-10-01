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
	$output = 'fuck'.$keystring;
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



foreach ($jsonIterator as $key => $val) {
     // if(is_array($val)) {
     //     echo "$key:\n";
     // } else {
     //     echo "$key => $val\n";
     // }
 }