<?php

session_start();
require_once 'functions.php';

$logged = false;
$login = $_POST["login"];
$pw = $_POST["password"];
$filename = '../data/login.json';
$logstring = file_get_contents($filename);
$loginjson = json_decode($logstring, true);


if(isin($loginjson,'login',$login)){
	if($pw === getmein($loginjson,'password',$login, 'login')){
		$logged = true;
		$_SESSION['user_id'] = getmein($loginjson,'id',$login, 'login');
		$_SESSION['user_login'] = $login;
		$_SESSION['user_name'] = getmein($loginjson,'name',$login, 'login');
		echo 'logged';
	}//// check si le pass word est le bon
}//// si le login est dans le file


?>