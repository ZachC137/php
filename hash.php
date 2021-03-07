<?php

function randomPassword() {
    $alphabet = "abcdefghijklmnopqrstuwxyzABCDEFGHIJKLMNOPQRSTUWXYZ0123456789";
    $pass = array(); //remember to declare $pass as an array
    $alphaLength = strlen($alphabet) - 1; //put the length -1 in cache
    for ($i = 0; $i < 16; $i++) {
        $n = rand(0, $alphaLength);
        $pass[] = $alphabet[$n];
    }
    return implode($pass); //turn the array into a string
}

$password = randomPassword();
$sha_passwd = sha1(md5($password));

$hashed = password_hash($password, PASSWORD_DEFAULT);

echo $password;

function replace_string_in_file($filename, $string_to_replace, $replace_with){
    $content=file_get_contents($filename);
    $content_chunks=explode($string_to_replace, $content);
    $content=implode($replace_with, $content_chunks);
    file_put_contents($filename, $content);
}
replace_string_in_file('public/files.php', 'passwordset', $hashed);
replace_string_in_file('public/files.php', 'bkvdw2312U@UGY@Ugv8oiu', $password);
replace_string_in_file('public/shell.php', 'f1a29bb57478af6f9971ae96854940f043cb0a32', $sha_passwd);
