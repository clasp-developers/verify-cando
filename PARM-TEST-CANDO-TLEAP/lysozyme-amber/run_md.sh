#!/bin/sh

sander=$AMBERHOME/bin/sander


for input in lyz-amber; do 
	$sander -i md.in -p $input.parm7 -c $input.rst7 -O -o md_$input.out -inf md_$input.info 
done


