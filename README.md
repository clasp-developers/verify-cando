# verify-cando
This section has two folders:
1. Lysozyme-TI - free energy calculation of transformation of benzene to phenol in lysozyme protein and in solution

        a. setup
                Run the scripts
                a. 1_leap.sh
                b. 2_run_md.sh
                c. 3_strip.sh
                d. 4_leap.sh
        b. free_energy
                a. setup.sh
                b. submit_complex.sh
                c. submit_ligands.sh
                d. analyse.sh
        c. fe-just-ligand-in-sol
                a. setup.sh
                b. submit_ligands.sh
`               c. analyse.sh

2. PARM-TEST-CANDO-TLEAP - verification of parameterization using cando and tleap

lysozyme-add-H-tleap-cando: Usha uploaded parameter files generated from cando for lysozyme written as a mol2 file
This folder contaies the jupyter lab file that loads mol2 and saves the .parm7 and .rst7 files and then do run_md.sh

lysozyme-amber: Usha uploaded parameter files generated from tleap for lysozyme from pdb saved as mol2 and read as mol2 again

1. Run the 1_leap.sh to get the parameters and run_md.sh to generate .parm7, .rst7 and .info files for comparison with .info file of lysozyme-add-H-tleap-cand

test-HIS: Usha uploaded files on Oct 3rd for a question raised by Shiho on charges after solvation of HIS
