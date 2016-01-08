<?php
require_once 'config.php';

////////////// SUB DOMAINE ////////////// SUB DOMAINE ////////////// SUB DOMAINE
$sub = (explode('.',$_SERVER['HTTP_HOST']));
$level_0 = ($sub[0]=='www') ? 1 : 0;
$level_1 = ($sub[0]=='www') ? 2 : 1;
$admin = ($sub[$level_0]=='admin') ? true : false;
$levelsublang = $admin ? $level_1 : $level_0;
////////////// SUB DOMAINE ////////////// SUB DOMAINE ////////////// SUB DOMAINE
////////////// LANGUE ////////////// LANGUE ////////////// LANGUE
$dl = 'en';///set default language
$browserlang = substr($_SERVER['HTTP_ACCEPT_LANGUAGE'], 0, 2);///get browser language
$defaultlang = ($browserlang ==='en' || $browserlang ==='de') ? $browserlang : $dl;
$lang = ($sub[$levelsublang]=='de' || $sub[$levelsublang]=='en') ? $sub[$levelsublang] : $defaultlang;
$oppositelang =($lang=='en') ? 'de' : 'en';
////////////// LANGUE ////////////// LANGUE ////////////// LANGUE
////////////// WHAT TO LOAD ////////////// WHAT TO LOAD ////////////// WHAT TO LOAD
$slash1 = strtolower(htmlspecialchars($_GET['slash1']));//////// récupère
$slash2 = strtolower(htmlspecialchars($_GET['slash2']));//////// récupère
$slash3 = strtolower(htmlspecialchars($_GET['slash3']));//////// récupère

$lastslash = $slash1;
$lastslash = $slash2 ? $slash2 : $lastslash;
$lastslash = $slash3 ? $slash3 : $lastslash;

$levelslash = 0;
$levelslash = ($slash1 === '') ? $levelslash : 1;
$levelslash = ($slash2 === '') ? $levelslash : 2;
$levelslash = ($slash3 === '') ? $levelslash : 3;

$navname = ($slash1 === '') ? 'nav' : $slash1.'nav';


$navdata = json_decode(file_get_contents($pathdatafolder.$navname.$lang.'.json'), true);
$selectedlink = ($lastslash === '') ? getfirst('link',$navdata) : $lastslash;


$title0 = 'Micha';
$title =  getmein($navdata,'title',$selectedlink, 'link');
$linkoposit = getmein($navdata,'linkopposite',$selectedlink, 'link');
$linkjson = getmein($navdata,'datajson',$selectedlink, 'link');
$speciallayout = getmein($navdata,'speciallayout',$selectedlink, 'link');

$pagetoload = strlen($title) ? $linkjson : '404';
$pagetoload = (($selectedlink === 'serveur') && $admin) ? '' : $pagetoload;
$speciallayout = (($selectedlink === 'serveur') && $admin) ? 'managefile' : $speciallayout;

//////// NEW PAGE //////// NEW PAGE //////// NEW PAGE //////// NEW PAGE
$is_a_new_page = ((strlen(strtolower(htmlspecialchars($_GET['newpage']))) > 0 ) && $admin) ;
$speciallayout = $is_a_new_page ? 'newpage' : $speciallayout;
$pagetoload = $is_a_new_page ? 'newpage' : $pagetoload;

////////// BREAD CRUMB
$breadcrumb[0]['title'] = $title0;
$breadcrumb[0]['link'] = '/';
$breadcrumblink = '';

if(strlen($slash1)){
	$nav_data = json_decode(file_get_contents($pathdatafolder.'nav'.$lang.'.json'), true);
	$breadcrumb[1]['title'] = getmein($nav_data,'title',$slash1, 'link');
	$breadcrumb[1]['link'] = $slash1;
	$breadcrumblink = '/'.$slash1.'/';
}
if(strlen($slash2)){
	$nav_data = json_decode(file_get_contents($pathdatafolder.$navname.$lang.'.json'), true);
	$breadcrumb[2]['title'] = getmein($nav_data,'title',$slash2, 'link');
	$breadcrumb[2]['link'] = $slash2;
}
if(strlen($slash3)){
	array_push($breadcrumb, $slash3);
}

$serveur = $local ? '.micha:8888/' : '.micha.com/';
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

$data['level'] = '0';
$data['key'] = 'firstline';
$data['type'] = 'repeater';
$data = $pagejson;

