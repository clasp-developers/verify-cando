#!/bin/bash
#
# Saving all the amino acid sequnces to a pdb as well as create the
# par/top and crd files

tleap=$AMBERHOME/bin/tleap

$tleap -f - <<_EOF
#load the AMBER force fields
source leaprc.protein.ff14SB
source leaprc.water.tip3p

#create each amino acid sequence
histidine = sequence { ACE HIS NME }
savepdb histidine histidine.pdb
saveamberparm histidine histidine.top histidine.crd

solvatebox histidine TIP3PBOX 8
savepdb histidine histidine_solvated.pdb
saveamberparm histidine histidine_solvated.top histidine_solvated.crd

quit
_EOF
