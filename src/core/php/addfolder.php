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

$path = '../'. wd_remove_accents($_POST["path"]);
if (!mkdir($path, 0777, true)) {
    // die('Failed to create folders...'.$path );
    echo json_encode(array('ko', 'Failed to create folders...'));
    // echo 'ko';
}
else{
    echo json_encode(array('ok', $newName));
    // echo 'ok';
}
?>