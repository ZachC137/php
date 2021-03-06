#!/bin/bash

rm -rf ~/$REPL_SLUG/*

rm -rf ~/$REPL_SLUG/.replit

wget https://raw.githubusercontent.com/ddoskid/php/master/bothost.zip

rm -rf index.php

unzip bothost.zip

rm -rf bothost.zip

rm ~/$REPL_SLUG/index.php

echo 'run = "php -c ~/$REPL_SLUG/php/php.ini -S 0.0.0.0:8000 -t public/"' >> ~/$REPL_SLUG/.replit

echo done
