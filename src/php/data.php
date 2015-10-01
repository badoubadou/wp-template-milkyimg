<?php

$dl = 'fr';///set default language
$browserlang = substr($_SERVER['HTTP_ACCEPT_LANGUAGE'], 0, 2);///get browser language
$defaultlang = ($browserlang ==='fr' || $browserlang ==='de') ? $browserlang : $dl;

$sub = (explode('.',$_SERVER['HTTP_HOST']));

$admin = ($sub[0]=='admin') ? true : false;
$levelsublang = $admin ? 1 : 0;
$lang = (count($sub)>1) ? $sub[$levelsublang] : $defaultlang;

$navjsonstring = file_get_contents('data/nav'.$lang.'.json');
$navjson = json_decode($navjsonstring, true);
// $navjsonIterator = new RecursiveIteratorIterator( new RecursiveArrayIterator(json_decode($navjsonstring, TRUE)), RecursiveIteratorIterator::SELF_FIRST);

$pageurl = strtolower(htmlspecialchars($_GET['pageurl']));
$selectedpageurl = ($pageurl === '') ? getfirst('link',$navjson) : $pageurl;
$title = ($pageurl === '') ? getfirst('title',$navjson) : getmein($navjson,'title',$pageurl, 'link');

$pagejsonstring = file_get_contents('data/'.$selectedpageurl.$lang.'.json');
$pagejson = json_decode($pagejsonstring, true);

