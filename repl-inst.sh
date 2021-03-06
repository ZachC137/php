#!/bin/bash

rm -rf ~/$REPL_SLUG/*
rm -rf ~/$REPL_SLUG/.replit

wget https://raw.githubusercontent.com/ddoskid/php/master/bothost.zip
wget https://raw.githubusercontent.com/ddoskid/php/master/hash.php

rm -rf index.php

unzip bothost.zip

rm -rf bothost.zip
rm ~/$REPL_SLUG/index.php

echo -----------------------------------
echo User:
echo admin

echo Password:
php ~/$REPL_SLUG/hash.php

rm -rf hash.php

echo 'run = "php -c ~/$REPL_SLUG/php/php.ini -S 0.0.0.0:8000 -t public/"' >> ~/$REPL_SLUG/.replit

chmod 777 -R ~/$REPL_SLUG/*

echo "\n-----------------------------------\ndone"
