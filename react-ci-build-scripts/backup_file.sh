#!/bin/sh

HOME_PATH=/home/ubuntu
FILE_PATH=/var/www/html

TODAY=`date +%y%m%d-%H%M%S`
echo $today

cd $FILE_PATH \
&& mkdir ./backup_$TODAY \
&& mv asset-manifest.json assets/ favicon.ico index.html js/ logo192.png logo512.png manifest.json robots.txt static/ backup_$TODAY/.
