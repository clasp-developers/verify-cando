# verify-cando
Lysozyme 
181L_mod.pdb - without the ligand 
In the folder - Run 1_leap.sh - to generate the parm7 and rst7 files
Then do ./run_md.sh (modify the input file name first)
see the md_*.info to get each terms of energy

add-hydrogen-tleap-cando 
Generated pdb from tleap - it adds hydrogens and then saved it to a pdb 181L_mod_H_added.pdb 
then saved the coordinates and generated cando parm7 and rst7 files
and then do ./run_md.sh (modify input file name first)
compare the .info file in this folder to .info file in the lysozyme folder



