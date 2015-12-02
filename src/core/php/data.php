<?php

require_once 'config.php';

$dl = 'fr';///set default language
$browserlang = substr($_SERVER['HTTP_ACCEPT_LANGUAGE'], 0, 2);///get browser language
$defaultlang = ($browserlang ==='fr' || $browserlang ==='de') ? $browserlang : $dl;

$sub = (explode('.',$_SERVER['HTTP_HOST']));

$level_0 = ($sub[0]=='www') ? 1 : 0;
$level_1 = ($sub[0]=='www') ? 2 : 1;

$admin = ($sub[$level_0]=='admin') ? true : false;
$levelsublang = $admin ? $level_1 : $level_0;
$lang = (count($sub)>1) ? $sub[$levelsublang] : $defaultlang;
$oppositelang =($lang=='fr') ? 'de' : 'fr';


$navjson = json_decode(file_get_contents($pathdatafolder.'nav'.$lang.'.json'), true);
// echo $sub[0];


// echo file_exists($pathdatafolder.'nav'.$lang.'.json').'   ???????? ';
// echo $pathdatafolder.'nav'.$lang.'.json';

$pageurl = strtolower(htmlspecialchars($_GET['pageurl']));//////// récupère
$selectedpageurl = ($pageurl === '') ? getfirst('link',$navjson) : $pageurl;
$title = ($pageurl === '') ? getfirst('title',$navjson) : getmein($navjson,'title',$pageurl, 'link');
$linkoposit = ($pageurl === '') ? getfirst('linkopposite',$navjson) : getmein($navjson,'linkopposite',$pageurl, 'link');
$linkjson = ($pageurl === '') ? getfirst('datajson',$navjson) : getmein($navjson,'datajson',$pageurl, 'link');
$speciallayout = ($pageurl === '') ? getfirst('speciallayout',$navjson) : getmein($navjson,'speciallayout',$pageurl, 'link');

$pagetoload = strlen($title) ? $linkjson : '404';

$speciallayout = (($pageurl === 'serveur') && $admin) ? 'managefile' : $speciallayout;
$pagetoload = (($pageurl === 'serveur') && $admin) ? '' : $pagetoload;


$serveur = $local ? '.beton:8888/' : '.beton.ink/';
$linkadmin = $admin ? 'admin.' : '';
$linklangoposit = 'http://'.$linkadmin.$oppositelang.$serveur.$linkoposit;


$pagejsonstring = file_get_contents($pathdatafolder.$pagetoload.$lang.'.json');
$pagejson = json_decode($pagejsonstring, true);

$imgonserver = array_diff(scandir($pathimgfolder), array('..', '.', '.DS_Store'));

$dicostring = file_get_contents('dico/dico'.$lang.'.json');
$dico = json_decode($dicostring, true);

$logged = false;

$logstring = file_get_contents($pathdatafolder.'login.json');
$loginjson = json_decode(file_get_contents($pathdatafolder.'login.json'), true);



// $test = print_r($loginjson);
// print_r($loginjson);
	// $login = 'romain';
	// $pw = 'mechoui';
	// if(isin($loginjson,'login',$login))
	// 	if($pw === getmein($loginjson,'password',$login, 'login'))
	// 		$logged = true;


