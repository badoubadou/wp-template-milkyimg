<?php
ob_start();
session_start();

require 'php/functions.php';
require 'php/data.php';

$logged = false;
if(isset($_SESSION['user_id'])){ // OR isset($_SESSION['user']), if array
	$logged = true;
	$user_name = $_SESSION['user_name'];
	$user_id = $_SESSION['user_id'];
}

//init variables
$cf = array();
$sr = false;

if(isset($_SESSION['cf_returndata'])){
    $cf = $_SESSION['cf_returndata'];
    $sr = true;
}


if($speciallayout){
	// if (!(($speciallayout == 'contact') && $admin)){
		include($speciallayout.'.php');
	// }
}else{
	$admin ? include('admin.php') : include('page.php');
}
ob_end_flush();