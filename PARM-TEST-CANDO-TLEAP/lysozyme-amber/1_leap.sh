#!/bin/sh
#

tleap=$AMBERHOME/bin/tleap


$tleap -f - <<_EOF
# load the AMBER force fields
source leaprc.protein.ff14SB

# load the coordinates and create the complex
#complex = loadpdb 181L_mod.pdb

#saveMol2 complex 181L_mod_H_added_0.mol2 0
#saveMol2 complex 181L_mod_H_added_1.mol2 1

complexnew = loadMol2 181L_mod_H_added_1.mol2

saveamberparm complexnew lyz-amber.parm7 lyz-amber.rst7

quit
_EOF
