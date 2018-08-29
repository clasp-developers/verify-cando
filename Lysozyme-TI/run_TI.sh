#!/bin/sh

#This is the script that can run the whole TI calculation. 
# Make sure that you have the receptor and the ligands file in the leap directory of setup
# and folders named - ligands_prepare and complex_prepare in setup with min.in, heat.in, press.in, run_all_md.sh 


# Setting up the system for TI calculation
# 1_leap - creates the initial prmtop and inpcrdd for both ligands in solution and the complex in solution
./setup/1_leap.sh
# 2_run_md - performs minimization and MD simulations to prepare the simulation box for TI
./setup/2_run_md.sh
# 3_strip.sh - cpptraj to extract the individual ligands and the rest of the system - to get coordinates
# to keep the same number of molecules for all steps
./setup/3_strip.sh
# create the prmtop and inpcrd for all the three steps - decharge, vdw-bonded and recharge 
./setup/4_leap.sh

# Free_energy calculation - TI
# setup of the protocol for TI and run
./free_energy/setup.sh
.free_energy/submit_complex.sh
.free_energy/submit_ligands.sh
.free_energy/analyse.sh > result-TI.txt

