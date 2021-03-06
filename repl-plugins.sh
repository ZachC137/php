#!/bin/bash
# Install WordPress on Repl.it
# 
# Create a new Repl.it as a PHP Web Server and run this script.
# wget -O - https://raw.githubusercontent.com/ethanpil/wordpress-on-replit/master/wordpress-on-replit.sh | bash

#Download, extract and cleanup required missing PHP modules
wget http://archive.ubuntu.com/ubuntu/pool/main/p/php7.2/php7.2-mysql_7.2.24-0ubuntu0.18.04.7_amd64.deb
wget http://archive.ubuntu.com/ubuntu/pool/main/p/php7.2/php7.2-sqlite3_7.2.24-0ubuntu0.18.04.7_amd64.deb
wget http://archive.ubuntu.com/ubuntu/pool/main/p/php7.2/php7.2-curl_7.2.3-1ubuntu1_amd64.deb
wget http://archive.ubuntu.com/ubuntu/pool/universe/p/php7.2/php7.2-mbstring_7.2.3-1ubuntu1_amd64.deb
for Module in $( ls php*.deb ); do dpkg -x $Module .; done
mkdir ~/$REPL_SLUG/php
cp usr/lib/php/*/* ~/$REPL_SLUG/php
echo 'extension=pdo.so' > ~/$REPL_SLUG/php/php.ini
mv ~/$REPL_SLUG/php/mysqlnd.so ~/$REPL_SLUG/php/A-mysqlnd.so #To ensure mysqlnd.so is loaded before mysqli.so
for Module in $( ls ~/$REPL_SLUG/php/*.so ); do echo "extension=$Module" >> ~/$REPL_SLUG/php/php.ini; done
rm -rf ./etc/ 
rm -rf ./usr/
rm php7.2-mysql_7.2.24-0ubuntu0.18.04.7_amd64.deb
rm php7.2-sqlite3_7.2.24-0ubuntu0.18.04.7_amd64.deb
rm php7.2-curl_7.2.3-1ubuntu1_amd64.deb
rm php7.2-mbstring_7.2.3-1ubuntu1_amd64.deb

mkdir public/

#remove default repl.it code file
rm ~/$REPL_SLUG/index.php

#Setup the repl to start PHP with the correct php.ini that includes our modules
echo 'run = "php -c ~/$REPL_SLUG/php/php.ini -S 0.0.0.0:8000 -t public/"' >> ~/$REPL_SLUG/.replit

echo "Done!"
