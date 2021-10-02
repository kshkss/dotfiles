#!/bin/env bash

set -ue
repo=$(pwd)

function link_to_homedir(){
	abspath=$(readlink -f $1)
	dest=$HOME/$1

	if [ -d $dest ] && [ ! -L $dest ]; then
		for i in $(ls $1); do
			link_to_homedir $1/$i
		done
	else
		ln -sfnv $abspath $dest
	fi
}

function show_file(){
	dest=$HOME/$1

	if [ -d $dest ] && [ ! -L $dest ]; then
		for i in $(ls $1); do
			show_file $1/$i
		done
	else
		ls -dF $1
	fi
}

function remove_link_from_homedir(){
	tgt=$HOME/$1

	if [ -d $tgt ] && [ ! -L $tgt ]; then
		for i in $(ls $1); do
			remove_link_from_homedir $1/$i
		done
	else
		if [ -L $tgt ] && readlink -f $tgt | grep "^$repo" > /dev/null; then
			rm -v $tgt
		fi
	fi
}

CLEAN=0
SHOW=0
while getopts df OPT
do
	case $OPT in
		d) CLEAN=1;;
		f) SHOW=1;;
		?) exit 1;;
	esac
done
shift $((OPTIND - 1))

if [ $CLEAN = 1 ]; then
	#echo "remove $1"
	remove_link_from_homedir $1
	exit 0
fi

if [ $SHOW = 1 ]; then
	show_file $1
	exit 0
fi

#echo "install $1"
link_to_homedir $1

