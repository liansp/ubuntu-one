#!/bin/sh

version=$(sed -n '1p' ~/work/P500/source/romfs/etc_ro/version 2>&-)
if [ version = "" ];then
	echo "error, no build image version found."
	exit 255
fi


ver=$(echo "$version" | cut -d '[' -f1)
customer=$(echo "$ver" | cut -d '-' -f3)

cp -p ~/work/P500/source/images/liansp_uImage ./${ver}_uImage
echo "Done, Copy image"
