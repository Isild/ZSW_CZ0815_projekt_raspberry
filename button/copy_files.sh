#! /bin/bash

mountpoint=("$1")
copydir=("$2")
date=("$3")
string=`ls -t /dev/sd*`
set -- $string
match=`echo $1 | grep -Po 'sd.[0-9]$'`

if ! grep -q $match /proc/mdstat
then
	sudo mount -v -o umask=0022 $1 $mountpoint
	files=`find $mountpoint -type f \( -iname \*.jpg -o -iname \*.png \)`
	mkdir -v $copydir/$date
	cp -v $files $copydir/$date
	sudo umount -v $1
fi
