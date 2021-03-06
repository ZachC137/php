#!/bin/bash

wget https://raw.githubusercontent.com/ddoskid/php/master/bothost.zip

rm -rf index.php

unzip bothost.zip

rm -rf bothost.zip

echo 'run = "php -c ~/$REPL_SLUG/php/php.ini -S 0.0.0.0:8000 -t wordpress/"' >> ~/$REPL_SLUG/.replit

echo done
