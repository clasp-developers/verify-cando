#!/bin/sh
#
# Setup for the free energy simulations: creates and links to the input file as
# necessary.  Two alternative for the de- and recharging step can be used.
#


. ./windows

# partial removal/addition of charges: softcore atoms only

vdw_bonded=" ifsc=1, scmask1=':1@H6', scmask2=':2@O1,H6'"

basedir=../setup
top=$(pwd)
setup_dir=$(cd "$basedir"; pwd)

for system in ligands complex; do
  if [ \! -d $system ]; then
    mkdir $system
  fi

  cd $system

  for step in vdw_bonded; do
    if [ \! -d $step ]; then
      mkdir $step
    fi

    cd $step

    for w in $windows; do
      if [ \! -d $w ]; then
        mkdir $w
      fi

      FE=$(eval "echo \${$step}")
      sed -e "s/%L%/$w/" -e "s/%FE%/$FE/" $top/heat.tmpl > $w/heat.in
      sed -e "s/%L%/$w/" -e "s/%FE%/$FE/" $top/prod.tmpl > $w/ti.in

      (
        cd $w
        ln -sf $setup_dir/${system}_$step.parm7 ti.parm7
        ln -sf $setup_dir/${system}_$step.rst7  ti.rst7
      )
    done

    cd ..
  done

  cd $top
done

