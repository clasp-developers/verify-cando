#!/bin/sh


top=$(pwd)
getdvdl=$top/getdvdl.py

for system in ligands; do
  cd $system
  result=0.0

  for 0.1 in decharge; do
    cd 0.1

    python $getdvdl 5 ti001.en [01].* > $top/test.dat
    echo -n "$system/0.1: "
    dG=$(tail -n 1 dvdl.dat | awk '{print $4}')
    echo $dG
    result=$(echo $dG + $result | bc)

    cd ..
  done

  echo '--------------------------------'
  echo "dG sum for $system = $result"
  echo

  cd $top
done

