#!/bin/sh
#
# Run all ligand simulations.  This is mostly a template for the LSF job
# scheduler.
#


. ./windows


mdrun=$AMBERHOME/bin/pmemd.MPI

cd complex

for step in vdw_bonded; do
  cd $step

  for w in 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0; do
    cd $w


mpirun -np 4 $mdrun -i heat.in -c ti.rst7 -ref ti.rst7 -p ti.parm7 \
  -O -o heat.out -inf heat.info -e heat.en -r heat.rst7 -x heat.nc -l heat.log

mpirun -np 4 $mdrun -i ti.in -c heat.rst7 -p ti.parm7 \
  -O -o ti001.out -inf ti001.info -e ti001.en -r ti001.rst7 -x ti001.nc \
     -l ti001.log


    cd ..
  done

  cd ..
done

