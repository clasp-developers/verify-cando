#!/bin/sh
#
# Run all ligand simulations.  This is mostly a template for the LSF job
# scheduler.
#


. ./windows


mdrun=$AMBERHOME/bin/pmemd

cd ligands

for step in decharge vdw_bonded recharge; do
  cd $step

  for w in $windows; do
    cd $w

$mdrun -i heat.in -c ti.rst7 -ref ti.rst7 -p ti.parm7 \
  -O -o heat.out -inf heat.info -e heat.en -r heat.rst7 -x heat.nc -l heat.log

$mdrun -i ti.in -c heat.rst7 -p ti.parm7 \
  -O -o ti001.out -inf ti001.info -e ti001.en -r ti001.rst7 -x ti001.nc \
     -l ti001.log


    cd ..
  done

  cd ..
done

