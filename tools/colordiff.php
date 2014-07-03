#!/usr/bin/php
<?php
define('TO_ENC', 'UTF8');
define('FROM_ENC', 'SJIS');

mb_internal_encoding(TO_ENC);


$cmd="diff $argv[2] \"$argv[3]\" $argv[6] $argv[7] $argv[4] \"$argv[5]\" -U 3";

if(isset($_ENV['ignore_cr']) && $_ENV['ignore_cr']==="1"){
    $cmd .= " --strip-trailing-cr";
}
exec($cmd, $res);
if(empty($res)) exit;

foreach($res as $li){
    $line = mb_convert_encoding($li, TO_ENC, FROM_ENC); 
    if(preg_match('/^\++/', $line)){
        $line = "\033[0;33m".$line."\033[0;39m";
    }else if(preg_match('/^\-+/', $line)){
        $line = "\033[0;36m".$line."\033[0;39m";
    }else if(preg_match('/^@+/', $line)){
        $line = "\033[1;35m".$line."\033[0;39m";
    }else if(preg_match('/^\\\\\s/', $line)){
        $line = $li;
    }
    echo "$line\n";
}

