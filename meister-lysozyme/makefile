all : morph-analysis.dat 
	echo DONE

postcharge/feps.cando  : precharge/feps.cando am1bcc/ab.out am1bcc/aa.out 
	runcmd -- precharge/feps.cando am1bcc/ab.out am1bcc/aa.out  -- postcharge/feps.cando  -- \
	iclasp-boehm -l charge.lisp


AA-AB/complex/recharge/recharge.mol2 AA-AB/complex/recharge/recharge.parm7 AA-AB/complex/recharge/recharge.rst7  : postcharge/feps.cando AA-AB/complex/solvated.mol2 AA-AB/complex/target.mol2 
	runcmd -- postcharge/feps.cando AA-AB/complex/solvated.mol2 AA-AB/complex/target.mol2  -- AA-AB/complex/recharge/recharge.mol2 AA-AB/complex/recharge/recharge.parm7 AA-AB/complex/recharge/recharge.rst7  -- \
	iclasp-boehm -l AA-AB/complex/recharge/recharge.lisp


AA-AB/complex/recharge/1.000/ti001.out AA-AB/complex/recharge/1.000/ti001.info AA-AB/complex/recharge/1.000/ti001.en AA-AB/complex/recharge/1.000/ti001.rst7 AA-AB/complex/recharge/1.000/ti001.nc AA-AB/complex/recharge/1.000/ti001.log  : AA-AB/complex/recharge/1.000/ti.in AA-AB/complex/recharge/1.000/heat.rst7 AA-AB/complex/recharge/recharge.parm7 
	runcmd -- AA-AB/complex/recharge/1.000/ti.in AA-AB/complex/recharge/1.000/heat.rst7 AA-AB/complex/recharge/recharge.parm7  -- AA-AB/complex/recharge/1.000/ti001.out AA-AB/complex/recharge/1.000/ti001.info AA-AB/complex/recharge/1.000/ti001.en AA-AB/complex/recharge/1.000/ti001.rst7 AA-AB/complex/recharge/1.000/ti001.nc AA-AB/complex/recharge/1.000/ti001.log  -- \
	pmemd.cuda -i AA-AB/complex/recharge/1.000/ti.in -c AA-AB/complex/recharge/1.000/heat.rst7 -p AA-AB/complex/recharge/recharge.parm7  \
	  -O -o AA-AB/complex/recharge/1.000/ti001.out -inf AA-AB/complex/recharge/1.000/ti001.info -e AA-AB/complex/recharge/1.000/ti001.en -r AA-AB/complex/recharge/1.000/ti001.rst7 -x AA-AB/complex/recharge/1.000/ti001.nc -l AA-AB/complex/recharge/1.000/ti001.log 

AA-AB/complex/recharge/dvdl.dat  : AA-AB/complex/recharge/1.000/ti001.en AA-AB/complex/recharge/0.500/ti001.en AA-AB/complex/recharge/0.000/ti001.en 
	runcmd -- AA-AB/complex/recharge/1.000/ti001.en AA-AB/complex/recharge/0.500/ti001.en AA-AB/complex/recharge/0.000/ti001.en  -- AA-AB/complex/recharge/dvdl.dat  -- \
	python2 getdvdl.py AA-AB/complex/recharge/dvdl.dat AA-AB/complex/recharge/1.000/ti001.en AA-AB/complex/recharge/0.500/ti001.en AA-AB/complex/recharge/0.000/ti001.en 


AA-AB/complex/side-analysis.dat  : AA-AB/complex/recharge/dvdl.dat AA-AB/complex/vdw-bonded/dvdl.dat AA-AB/complex/decharge/dvdl.dat 
	runcmd -- AA-AB/complex/recharge/dvdl.dat AA-AB/complex/vdw-bonded/dvdl.dat AA-AB/complex/decharge/dvdl.dat  -- AA-AB/complex/side-analysis.dat  -- \
	iclasp-boehm -l AA-AB/complex/side-script.lisp


morph-analysis.dat  : AA-AB/complex/side-analysis.dat AA-AB/ligand/side-analysis.dat 
	runcmd -- AA-AB/complex/side-analysis.dat AA-AB/ligand/side-analysis.dat  -- morph-analysis.dat  -- \
	iclasp-boehm -l morph-script.lisp


AA-AB/complex/recharge/1.000/heat.out AA-AB/complex/recharge/1.000/heat.info AA-AB/complex/recharge/1.000/heat.en AA-AB/complex/recharge/1.000/heat.rst7 AA-AB/complex/recharge/1.000/heat.nc AA-AB/complex/recharge/1.000/heat.log  : AA-AB/complex/recharge/1.000/heat.in AA-AB/complex/recharge/recharge.rst7 AA-AB/complex/recharge/recharge.parm7 
	runcmd -- AA-AB/complex/recharge/1.000/heat.in AA-AB/complex/recharge/recharge.rst7 AA-AB/complex/recharge/recharge.parm7  -- AA-AB/complex/recharge/1.000/heat.out AA-AB/complex/recharge/1.000/heat.info AA-AB/complex/recharge/1.000/heat.en AA-AB/complex/recharge/1.000/heat.rst7 AA-AB/complex/recharge/1.000/heat.nc AA-AB/complex/recharge/1.000/heat.log  -- \
	pmemd.cuda -i AA-AB/complex/recharge/1.000/heat.in -c AA-AB/complex/recharge/recharge.rst7 -ref AA-AB/complex/recharge/recharge.rst7 -p AA-AB/complex/recharge/recharge.parm7  \
	  -O -o AA-AB/complex/recharge/1.000/heat.out -inf AA-AB/complex/recharge/1.000/heat.info -e AA-AB/complex/recharge/1.000/heat.en -r AA-AB/complex/recharge/1.000/heat.rst7 -x AA-AB/complex/recharge/1.000/heat.nc -l AA-AB/complex/recharge/1.000/heat.log 

AA-AB/complex/recharge/0.500/ti001.out AA-AB/complex/recharge/0.500/ti001.info AA-AB/complex/recharge/0.500/ti001.en AA-AB/complex/recharge/0.500/ti001.rst7 AA-AB/complex/recharge/0.500/ti001.nc AA-AB/complex/recharge/0.500/ti001.log  : AA-AB/complex/recharge/0.500/ti.in AA-AB/complex/recharge/0.500/heat.rst7 AA-AB/complex/recharge/recharge.parm7 
	runcmd -- AA-AB/complex/recharge/0.500/ti.in AA-AB/complex/recharge/0.500/heat.rst7 AA-AB/complex/recharge/recharge.parm7  -- AA-AB/complex/recharge/0.500/ti001.out AA-AB/complex/recharge/0.500/ti001.info AA-AB/complex/recharge/0.500/ti001.en AA-AB/complex/recharge/0.500/ti001.rst7 AA-AB/complex/recharge/0.500/ti001.nc AA-AB/complex/recharge/0.500/ti001.log  -- \
	pmemd.cuda -i AA-AB/complex/recharge/0.500/ti.in -c AA-AB/complex/recharge/0.500/heat.rst7 -p AA-AB/complex/recharge/recharge.parm7  \
	  -O -o AA-AB/complex/recharge/0.500/ti001.out -inf AA-AB/complex/recharge/0.500/ti001.info -e AA-AB/complex/recharge/0.500/ti001.en -r AA-AB/complex/recharge/0.500/ti001.rst7 -x AA-AB/complex/recharge/0.500/ti001.nc -l AA-AB/complex/recharge/0.500/ti001.log 

AA-AB/complex/recharge/0.500/heat.out AA-AB/complex/recharge/0.500/heat.info AA-AB/complex/recharge/0.500/heat.en AA-AB/complex/recharge/0.500/heat.rst7 AA-AB/complex/recharge/0.500/heat.nc AA-AB/complex/recharge/0.500/heat.log  : AA-AB/complex/recharge/0.500/heat.in AA-AB/complex/recharge/recharge.rst7 AA-AB/complex/recharge/recharge.parm7 
	runcmd -- AA-AB/complex/recharge/0.500/heat.in AA-AB/complex/recharge/recharge.rst7 AA-AB/complex/recharge/recharge.parm7  -- AA-AB/complex/recharge/0.500/heat.out AA-AB/complex/recharge/0.500/heat.info AA-AB/complex/recharge/0.500/heat.en AA-AB/complex/recharge/0.500/heat.rst7 AA-AB/complex/recharge/0.500/heat.nc AA-AB/complex/recharge/0.500/heat.log  -- \
	pmemd.cuda -i AA-AB/complex/recharge/0.500/heat.in -c AA-AB/complex/recharge/recharge.rst7 -ref AA-AB/complex/recharge/recharge.rst7 -p AA-AB/complex/recharge/recharge.parm7  \
	  -O -o AA-AB/complex/recharge/0.500/heat.out -inf AA-AB/complex/recharge/0.500/heat.info -e AA-AB/complex/recharge/0.500/heat.en -r AA-AB/complex/recharge/0.500/heat.rst7 -x AA-AB/complex/recharge/0.500/heat.nc -l AA-AB/complex/recharge/0.500/heat.log 

AA-AB/complex/recharge/0.000/ti001.out AA-AB/complex/recharge/0.000/ti001.info AA-AB/complex/recharge/0.000/ti001.en AA-AB/complex/recharge/0.000/ti001.rst7 AA-AB/complex/recharge/0.000/ti001.nc AA-AB/complex/recharge/0.000/ti001.log  : AA-AB/complex/recharge/0.000/ti.in AA-AB/complex/recharge/0.000/heat.rst7 AA-AB/complex/recharge/recharge.parm7 
	runcmd -- AA-AB/complex/recharge/0.000/ti.in AA-AB/complex/recharge/0.000/heat.rst7 AA-AB/complex/recharge/recharge.parm7  -- AA-AB/complex/recharge/0.000/ti001.out AA-AB/complex/recharge/0.000/ti001.info AA-AB/complex/recharge/0.000/ti001.en AA-AB/complex/recharge/0.000/ti001.rst7 AA-AB/complex/recharge/0.000/ti001.nc AA-AB/complex/recharge/0.000/ti001.log  -- \
	pmemd.cuda -i AA-AB/complex/recharge/0.000/ti.in -c AA-AB/complex/recharge/0.000/heat.rst7 -p AA-AB/complex/recharge/recharge.parm7  \
	  -O -o AA-AB/complex/recharge/0.000/ti001.out -inf AA-AB/complex/recharge/0.000/ti001.info -e AA-AB/complex/recharge/0.000/ti001.en -r AA-AB/complex/recharge/0.000/ti001.rst7 -x AA-AB/complex/recharge/0.000/ti001.nc -l AA-AB/complex/recharge/0.000/ti001.log 

AA-AB/complex/recharge/0.000/heat.out AA-AB/complex/recharge/0.000/heat.info AA-AB/complex/recharge/0.000/heat.en AA-AB/complex/recharge/0.000/heat.rst7 AA-AB/complex/recharge/0.000/heat.nc AA-AB/complex/recharge/0.000/heat.log  : AA-AB/complex/recharge/0.000/heat.in AA-AB/complex/recharge/recharge.rst7 AA-AB/complex/recharge/recharge.parm7 
	runcmd -- AA-AB/complex/recharge/0.000/heat.in AA-AB/complex/recharge/recharge.rst7 AA-AB/complex/recharge/recharge.parm7  -- AA-AB/complex/recharge/0.000/heat.out AA-AB/complex/recharge/0.000/heat.info AA-AB/complex/recharge/0.000/heat.en AA-AB/complex/recharge/0.000/heat.rst7 AA-AB/complex/recharge/0.000/heat.nc AA-AB/complex/recharge/0.000/heat.log  -- \
	pmemd.cuda -i AA-AB/complex/recharge/0.000/heat.in -c AA-AB/complex/recharge/recharge.rst7 -ref AA-AB/complex/recharge/recharge.rst7 -p AA-AB/complex/recharge/recharge.parm7  \
	  -O -o AA-AB/complex/recharge/0.000/heat.out -inf AA-AB/complex/recharge/0.000/heat.info -e AA-AB/complex/recharge/0.000/heat.en -r AA-AB/complex/recharge/0.000/heat.rst7 -x AA-AB/complex/recharge/0.000/heat.nc -l AA-AB/complex/recharge/0.000/heat.log 

AA-AB/complex/decharge/decharge.mol2 AA-AB/complex/decharge/decharge.parm7 AA-AB/complex/decharge/decharge.rst7  : postcharge/feps.cando AA-AB/complex/solvated.mol2 AA-AB/complex/source.mol2 
	runcmd -- postcharge/feps.cando AA-AB/complex/solvated.mol2 AA-AB/complex/source.mol2  -- AA-AB/complex/decharge/decharge.mol2 AA-AB/complex/decharge/decharge.parm7 AA-AB/complex/decharge/decharge.rst7  -- \
	iclasp-boehm -l AA-AB/complex/decharge/decharge.lisp


AA-AB/complex/decharge/1.000/ti001.out AA-AB/complex/decharge/1.000/ti001.info AA-AB/complex/decharge/1.000/ti001.en AA-AB/complex/decharge/1.000/ti001.rst7 AA-AB/complex/decharge/1.000/ti001.nc AA-AB/complex/decharge/1.000/ti001.log  : AA-AB/complex/decharge/1.000/ti.in AA-AB/complex/decharge/1.000/heat.rst7 AA-AB/complex/decharge/decharge.parm7 
	runcmd -- AA-AB/complex/decharge/1.000/ti.in AA-AB/complex/decharge/1.000/heat.rst7 AA-AB/complex/decharge/decharge.parm7  -- AA-AB/complex/decharge/1.000/ti001.out AA-AB/complex/decharge/1.000/ti001.info AA-AB/complex/decharge/1.000/ti001.en AA-AB/complex/decharge/1.000/ti001.rst7 AA-AB/complex/decharge/1.000/ti001.nc AA-AB/complex/decharge/1.000/ti001.log  -- \
	pmemd.cuda -i AA-AB/complex/decharge/1.000/ti.in -c AA-AB/complex/decharge/1.000/heat.rst7 -p AA-AB/complex/decharge/decharge.parm7  \
	  -O -o AA-AB/complex/decharge/1.000/ti001.out -inf AA-AB/complex/decharge/1.000/ti001.info -e AA-AB/complex/decharge/1.000/ti001.en -r AA-AB/complex/decharge/1.000/ti001.rst7 -x AA-AB/complex/decharge/1.000/ti001.nc -l AA-AB/complex/decharge/1.000/ti001.log 

AA-AB/complex/decharge/dvdl.dat  : AA-AB/complex/decharge/1.000/ti001.en AA-AB/complex/decharge/0.500/ti001.en AA-AB/complex/decharge/0.000/ti001.en 
	runcmd -- AA-AB/complex/decharge/1.000/ti001.en AA-AB/complex/decharge/0.500/ti001.en AA-AB/complex/decharge/0.000/ti001.en  -- AA-AB/complex/decharge/dvdl.dat  -- \
	python2 getdvdl.py AA-AB/complex/decharge/dvdl.dat AA-AB/complex/decharge/1.000/ti001.en AA-AB/complex/decharge/0.500/ti001.en AA-AB/complex/decharge/0.000/ti001.en 


AA-AB/complex/decharge/1.000/heat.out AA-AB/complex/decharge/1.000/heat.info AA-AB/complex/decharge/1.000/heat.en AA-AB/complex/decharge/1.000/heat.rst7 AA-AB/complex/decharge/1.000/heat.nc AA-AB/complex/decharge/1.000/heat.log  : AA-AB/complex/decharge/1.000/heat.in AA-AB/complex/decharge/decharge.rst7 AA-AB/complex/decharge/decharge.parm7 
	runcmd -- AA-AB/complex/decharge/1.000/heat.in AA-AB/complex/decharge/decharge.rst7 AA-AB/complex/decharge/decharge.parm7  -- AA-AB/complex/decharge/1.000/heat.out AA-AB/complex/decharge/1.000/heat.info AA-AB/complex/decharge/1.000/heat.en AA-AB/complex/decharge/1.000/heat.rst7 AA-AB/complex/decharge/1.000/heat.nc AA-AB/complex/decharge/1.000/heat.log  -- \
	pmemd.cuda -i AA-AB/complex/decharge/1.000/heat.in -c AA-AB/complex/decharge/decharge.rst7 -ref AA-AB/complex/decharge/decharge.rst7 -p AA-AB/complex/decharge/decharge.parm7  \
	  -O -o AA-AB/complex/decharge/1.000/heat.out -inf AA-AB/complex/decharge/1.000/heat.info -e AA-AB/complex/decharge/1.000/heat.en -r AA-AB/complex/decharge/1.000/heat.rst7 -x AA-AB/complex/decharge/1.000/heat.nc -l AA-AB/complex/decharge/1.000/heat.log 

AA-AB/complex/decharge/0.500/ti001.out AA-AB/complex/decharge/0.500/ti001.info AA-AB/complex/decharge/0.500/ti001.en AA-AB/complex/decharge/0.500/ti001.rst7 AA-AB/complex/decharge/0.500/ti001.nc AA-AB/complex/decharge/0.500/ti001.log  : AA-AB/complex/decharge/0.500/ti.in AA-AB/complex/decharge/0.500/heat.rst7 AA-AB/complex/decharge/decharge.parm7 
	runcmd -- AA-AB/complex/decharge/0.500/ti.in AA-AB/complex/decharge/0.500/heat.rst7 AA-AB/complex/decharge/decharge.parm7  -- AA-AB/complex/decharge/0.500/ti001.out AA-AB/complex/decharge/0.500/ti001.info AA-AB/complex/decharge/0.500/ti001.en AA-AB/complex/decharge/0.500/ti001.rst7 AA-AB/complex/decharge/0.500/ti001.nc AA-AB/complex/decharge/0.500/ti001.log  -- \
	pmemd.cuda -i AA-AB/complex/decharge/0.500/ti.in -c AA-AB/complex/decharge/0.500/heat.rst7 -p AA-AB/complex/decharge/decharge.parm7  \
	  -O -o AA-AB/complex/decharge/0.500/ti001.out -inf AA-AB/complex/decharge/0.500/ti001.info -e AA-AB/complex/decharge/0.500/ti001.en -r AA-AB/complex/decharge/0.500/ti001.rst7 -x AA-AB/complex/decharge/0.500/ti001.nc -l AA-AB/complex/decharge/0.500/ti001.log 

AA-AB/complex/decharge/0.500/heat.out AA-AB/complex/decharge/0.500/heat.info AA-AB/complex/decharge/0.500/heat.en AA-AB/complex/decharge/0.500/heat.rst7 AA-AB/complex/decharge/0.500/heat.nc AA-AB/complex/decharge/0.500/heat.log  : AA-AB/complex/decharge/0.500/heat.in AA-AB/complex/decharge/decharge.rst7 AA-AB/complex/decharge/decharge.parm7 
	runcmd -- AA-AB/complex/decharge/0.500/heat.in AA-AB/complex/decharge/decharge.rst7 AA-AB/complex/decharge/decharge.parm7  -- AA-AB/complex/decharge/0.500/heat.out AA-AB/complex/decharge/0.500/heat.info AA-AB/complex/decharge/0.500/heat.en AA-AB/complex/decharge/0.500/heat.rst7 AA-AB/complex/decharge/0.500/heat.nc AA-AB/complex/decharge/0.500/heat.log  -- \
	pmemd.cuda -i AA-AB/complex/decharge/0.500/heat.in -c AA-AB/complex/decharge/decharge.rst7 -ref AA-AB/complex/decharge/decharge.rst7 -p AA-AB/complex/decharge/decharge.parm7  \
	  -O -o AA-AB/complex/decharge/0.500/heat.out -inf AA-AB/complex/decharge/0.500/heat.info -e AA-AB/complex/decharge/0.500/heat.en -r AA-AB/complex/decharge/0.500/heat.rst7 -x AA-AB/complex/decharge/0.500/heat.nc -l AA-AB/complex/decharge/0.500/heat.log 

AA-AB/complex/decharge/0.000/ti001.out AA-AB/complex/decharge/0.000/ti001.info AA-AB/complex/decharge/0.000/ti001.en AA-AB/complex/decharge/0.000/ti001.rst7 AA-AB/complex/decharge/0.000/ti001.nc AA-AB/complex/decharge/0.000/ti001.log  : AA-AB/complex/decharge/0.000/ti.in AA-AB/complex/decharge/0.000/heat.rst7 AA-AB/complex/decharge/decharge.parm7 
	runcmd -- AA-AB/complex/decharge/0.000/ti.in AA-AB/complex/decharge/0.000/heat.rst7 AA-AB/complex/decharge/decharge.parm7  -- AA-AB/complex/decharge/0.000/ti001.out AA-AB/complex/decharge/0.000/ti001.info AA-AB/complex/decharge/0.000/ti001.en AA-AB/complex/decharge/0.000/ti001.rst7 AA-AB/complex/decharge/0.000/ti001.nc AA-AB/complex/decharge/0.000/ti001.log  -- \
	pmemd.cuda -i AA-AB/complex/decharge/0.000/ti.in -c AA-AB/complex/decharge/0.000/heat.rst7 -p AA-AB/complex/decharge/decharge.parm7  \
	  -O -o AA-AB/complex/decharge/0.000/ti001.out -inf AA-AB/complex/decharge/0.000/ti001.info -e AA-AB/complex/decharge/0.000/ti001.en -r AA-AB/complex/decharge/0.000/ti001.rst7 -x AA-AB/complex/decharge/0.000/ti001.nc -l AA-AB/complex/decharge/0.000/ti001.log 

AA-AB/complex/decharge/0.000/heat.out AA-AB/complex/decharge/0.000/heat.info AA-AB/complex/decharge/0.000/heat.en AA-AB/complex/decharge/0.000/heat.rst7 AA-AB/complex/decharge/0.000/heat.nc AA-AB/complex/decharge/0.000/heat.log  : AA-AB/complex/decharge/0.000/heat.in AA-AB/complex/decharge/decharge.rst7 AA-AB/complex/decharge/decharge.parm7 
	runcmd -- AA-AB/complex/decharge/0.000/heat.in AA-AB/complex/decharge/decharge.rst7 AA-AB/complex/decharge/decharge.parm7  -- AA-AB/complex/decharge/0.000/heat.out AA-AB/complex/decharge/0.000/heat.info AA-AB/complex/decharge/0.000/heat.en AA-AB/complex/decharge/0.000/heat.rst7 AA-AB/complex/decharge/0.000/heat.nc AA-AB/complex/decharge/0.000/heat.log  -- \
	pmemd.cuda -i AA-AB/complex/decharge/0.000/heat.in -c AA-AB/complex/decharge/decharge.rst7 -ref AA-AB/complex/decharge/decharge.rst7 -p AA-AB/complex/decharge/decharge.parm7  \
	  -O -o AA-AB/complex/decharge/0.000/heat.out -inf AA-AB/complex/decharge/0.000/heat.info -e AA-AB/complex/decharge/0.000/heat.en -r AA-AB/complex/decharge/0.000/heat.rst7 -x AA-AB/complex/decharge/0.000/heat.nc -l AA-AB/complex/decharge/0.000/heat.log 

AA-AB/complex/complex-vdw-bonded.rst7 AA-AB/complex/complex-vdw-bonded.parm7 AA-AB/complex/complex-vdw-bonded.mol2  : postcharge/feps.cando 
	runcmd -- postcharge/feps.cando  -- AA-AB/complex/complex-vdw-bonded.rst7 AA-AB/complex/complex-vdw-bonded.parm7 AA-AB/complex/complex-vdw-bonded.mol2  -- \
	iclasp-boehm -l AA-AB/complex/solvate-addion.lisp


AA-AB/complex/min.out AA-AB/complex/min.info AA-AB/complex/min.en AA-AB/complex/min.rst7 AA-AB/complex/min.nc AA-AB/complex/min.log  : AA-AB/complex/min.in AA-AB/complex/complex-vdw-bonded.rst7 AA-AB/complex/complex-vdw-bonded.parm7 
	runcmd -- AA-AB/complex/min.in AA-AB/complex/complex-vdw-bonded.rst7 AA-AB/complex/complex-vdw-bonded.parm7  -- AA-AB/complex/min.out AA-AB/complex/min.info AA-AB/complex/min.en AA-AB/complex/min.rst7 AA-AB/complex/min.nc AA-AB/complex/min.log  -- \
	pmemd -i AA-AB/complex/min.in -c AA-AB/complex/complex-vdw-bonded.rst7 -ref AA-AB/complex/complex-vdw-bonded.rst7 -p AA-AB/complex/complex-vdw-bonded.parm7  -O -o AA-AB/complex/min.out -inf AA-AB/complex/min.info -e AA-AB/complex/min.en -r AA-AB/complex/min.rst7 -x AA-AB/complex/min.nc -l AA-AB/complex/min.log 


AA-AB/complex/heat.out AA-AB/complex/heat.info AA-AB/complex/heat.en AA-AB/complex/heat.rst7 AA-AB/complex/heat.nc AA-AB/complex/heat.log  : AA-AB/complex/heat.in AA-AB/complex/min.rst7 AA-AB/complex/complex-vdw-bonded.parm7 
	runcmd -- AA-AB/complex/heat.in AA-AB/complex/min.rst7 AA-AB/complex/complex-vdw-bonded.parm7  -- AA-AB/complex/heat.out AA-AB/complex/heat.info AA-AB/complex/heat.en AA-AB/complex/heat.rst7 AA-AB/complex/heat.nc AA-AB/complex/heat.log  -- \
	pmemd.cuda -i AA-AB/complex/heat.in -c AA-AB/complex/min.rst7 -ref AA-AB/complex/min.rst7 -p AA-AB/complex/complex-vdw-bonded.parm7  -O -o AA-AB/complex/heat.out -inf AA-AB/complex/heat.info -e AA-AB/complex/heat.en -r AA-AB/complex/heat.rst7 -x AA-AB/complex/heat.nc -l AA-AB/complex/heat.log 


AA-AB/complex/press.out AA-AB/complex/press.info AA-AB/complex/press.en AA-AB/complex/press.rst7 AA-AB/complex/press.nc AA-AB/complex/press.log  : AA-AB/complex/press.in AA-AB/complex/heat.rst7 AA-AB/complex/complex-vdw-bonded.parm7 
	runcmd -- AA-AB/complex/press.in AA-AB/complex/heat.rst7 AA-AB/complex/complex-vdw-bonded.parm7  -- AA-AB/complex/press.out AA-AB/complex/press.info AA-AB/complex/press.en AA-AB/complex/press.rst7 AA-AB/complex/press.nc AA-AB/complex/press.log  -- \
	pmemd -i AA-AB/complex/press.in -c AA-AB/complex/heat.rst7 -ref AA-AB/complex/heat.rst7 -p AA-AB/complex/complex-vdw-bonded.parm7  -O -o AA-AB/complex/press.out -inf AA-AB/complex/press.info -e AA-AB/complex/press.en -r AA-AB/complex/press.rst7 -x AA-AB/complex/press.nc -l AA-AB/complex/press.log 


AA-AB/complex/vdw-bonded/1.000/heat.out AA-AB/complex/vdw-bonded/1.000/heat.info AA-AB/complex/vdw-bonded/1.000/heat.en AA-AB/complex/vdw-bonded/1.000/heat.rst7 AA-AB/complex/vdw-bonded/1.000/heat.nc AA-AB/complex/vdw-bonded/1.000/heat.log  : AA-AB/complex/vdw-bonded/1.000/heat.in AA-AB/complex/press.rst7 AA-AB/complex/complex-vdw-bonded.parm7 
	runcmd -- AA-AB/complex/vdw-bonded/1.000/heat.in AA-AB/complex/press.rst7 AA-AB/complex/complex-vdw-bonded.parm7  -- AA-AB/complex/vdw-bonded/1.000/heat.out AA-AB/complex/vdw-bonded/1.000/heat.info AA-AB/complex/vdw-bonded/1.000/heat.en AA-AB/complex/vdw-bonded/1.000/heat.rst7 AA-AB/complex/vdw-bonded/1.000/heat.nc AA-AB/complex/vdw-bonded/1.000/heat.log  -- \
	pmemd.cuda -i AA-AB/complex/vdw-bonded/1.000/heat.in -c AA-AB/complex/press.rst7 -ref AA-AB/complex/press.rst7 -p AA-AB/complex/complex-vdw-bonded.parm7  \
	  -O -o AA-AB/complex/vdw-bonded/1.000/heat.out -inf AA-AB/complex/vdw-bonded/1.000/heat.info -e AA-AB/complex/vdw-bonded/1.000/heat.en -r AA-AB/complex/vdw-bonded/1.000/heat.rst7 -x AA-AB/complex/vdw-bonded/1.000/heat.nc -l AA-AB/complex/vdw-bonded/1.000/heat.log 

AA-AB/complex/vdw-bonded/1.000/ti001.out AA-AB/complex/vdw-bonded/1.000/ti001.info AA-AB/complex/vdw-bonded/1.000/ti001.en AA-AB/complex/vdw-bonded/1.000/ti001.rst7 AA-AB/complex/vdw-bonded/1.000/ti001.nc AA-AB/complex/vdw-bonded/1.000/ti001.log  : AA-AB/complex/vdw-bonded/1.000/ti.in AA-AB/complex/vdw-bonded/1.000/heat.rst7 AA-AB/complex/complex-vdw-bonded.parm7 
	runcmd -- AA-AB/complex/vdw-bonded/1.000/ti.in AA-AB/complex/vdw-bonded/1.000/heat.rst7 AA-AB/complex/complex-vdw-bonded.parm7  -- AA-AB/complex/vdw-bonded/1.000/ti001.out AA-AB/complex/vdw-bonded/1.000/ti001.info AA-AB/complex/vdw-bonded/1.000/ti001.en AA-AB/complex/vdw-bonded/1.000/ti001.rst7 AA-AB/complex/vdw-bonded/1.000/ti001.nc AA-AB/complex/vdw-bonded/1.000/ti001.log  -- \
	pmemd.cuda -i AA-AB/complex/vdw-bonded/1.000/ti.in -c AA-AB/complex/vdw-bonded/1.000/heat.rst7 -p AA-AB/complex/complex-vdw-bonded.parm7  \
	  -O -o AA-AB/complex/vdw-bonded/1.000/ti001.out -inf AA-AB/complex/vdw-bonded/1.000/ti001.info -e AA-AB/complex/vdw-bonded/1.000/ti001.en -r AA-AB/complex/vdw-bonded/1.000/ti001.rst7 -x AA-AB/complex/vdw-bonded/1.000/ti001.nc -l AA-AB/complex/vdw-bonded/1.000/ti001.log 

AA-AB/complex/vdw-bonded/dvdl.dat  : AA-AB/complex/vdw-bonded/1.000/ti001.en AA-AB/complex/vdw-bonded/0.500/ti001.en AA-AB/complex/vdw-bonded/0.000/ti001.en 
	runcmd -- AA-AB/complex/vdw-bonded/1.000/ti001.en AA-AB/complex/vdw-bonded/0.500/ti001.en AA-AB/complex/vdw-bonded/0.000/ti001.en  -- AA-AB/complex/vdw-bonded/dvdl.dat  -- \
	python2 getdvdl.py AA-AB/complex/vdw-bonded/dvdl.dat AA-AB/complex/vdw-bonded/1.000/ti001.en AA-AB/complex/vdw-bonded/0.500/ti001.en AA-AB/complex/vdw-bonded/0.000/ti001.en 


AA-AB/complex/vdw-bonded/0.500/heat.out AA-AB/complex/vdw-bonded/0.500/heat.info AA-AB/complex/vdw-bonded/0.500/heat.en AA-AB/complex/vdw-bonded/0.500/heat.rst7 AA-AB/complex/vdw-bonded/0.500/heat.nc AA-AB/complex/vdw-bonded/0.500/heat.log  : AA-AB/complex/vdw-bonded/0.500/heat.in AA-AB/complex/press.rst7 AA-AB/complex/complex-vdw-bonded.parm7 
	runcmd -- AA-AB/complex/vdw-bonded/0.500/heat.in AA-AB/complex/press.rst7 AA-AB/complex/complex-vdw-bonded.parm7  -- AA-AB/complex/vdw-bonded/0.500/heat.out AA-AB/complex/vdw-bonded/0.500/heat.info AA-AB/complex/vdw-bonded/0.500/heat.en AA-AB/complex/vdw-bonded/0.500/heat.rst7 AA-AB/complex/vdw-bonded/0.500/heat.nc AA-AB/complex/vdw-bonded/0.500/heat.log  -- \
	pmemd.cuda -i AA-AB/complex/vdw-bonded/0.500/heat.in -c AA-AB/complex/press.rst7 -ref AA-AB/complex/press.rst7 -p AA-AB/complex/complex-vdw-bonded.parm7  \
	  -O -o AA-AB/complex/vdw-bonded/0.500/heat.out -inf AA-AB/complex/vdw-bonded/0.500/heat.info -e AA-AB/complex/vdw-bonded/0.500/heat.en -r AA-AB/complex/vdw-bonded/0.500/heat.rst7 -x AA-AB/complex/vdw-bonded/0.500/heat.nc -l AA-AB/complex/vdw-bonded/0.500/heat.log 

AA-AB/complex/vdw-bonded/0.500/ti001.out AA-AB/complex/vdw-bonded/0.500/ti001.info AA-AB/complex/vdw-bonded/0.500/ti001.en AA-AB/complex/vdw-bonded/0.500/ti001.rst7 AA-AB/complex/vdw-bonded/0.500/ti001.nc AA-AB/complex/vdw-bonded/0.500/ti001.log  : AA-AB/complex/vdw-bonded/0.500/ti.in AA-AB/complex/vdw-bonded/0.500/heat.rst7 AA-AB/complex/complex-vdw-bonded.parm7 
	runcmd -- AA-AB/complex/vdw-bonded/0.500/ti.in AA-AB/complex/vdw-bonded/0.500/heat.rst7 AA-AB/complex/complex-vdw-bonded.parm7  -- AA-AB/complex/vdw-bonded/0.500/ti001.out AA-AB/complex/vdw-bonded/0.500/ti001.info AA-AB/complex/vdw-bonded/0.500/ti001.en AA-AB/complex/vdw-bonded/0.500/ti001.rst7 AA-AB/complex/vdw-bonded/0.500/ti001.nc AA-AB/complex/vdw-bonded/0.500/ti001.log  -- \
	pmemd.cuda -i AA-AB/complex/vdw-bonded/0.500/ti.in -c AA-AB/complex/vdw-bonded/0.500/heat.rst7 -p AA-AB/complex/complex-vdw-bonded.parm7  \
	  -O -o AA-AB/complex/vdw-bonded/0.500/ti001.out -inf AA-AB/complex/vdw-bonded/0.500/ti001.info -e AA-AB/complex/vdw-bonded/0.500/ti001.en -r AA-AB/complex/vdw-bonded/0.500/ti001.rst7 -x AA-AB/complex/vdw-bonded/0.500/ti001.nc -l AA-AB/complex/vdw-bonded/0.500/ti001.log 

AA-AB/complex/vdw-bonded/0.000/heat.out AA-AB/complex/vdw-bonded/0.000/heat.info AA-AB/complex/vdw-bonded/0.000/heat.en AA-AB/complex/vdw-bonded/0.000/heat.rst7 AA-AB/complex/vdw-bonded/0.000/heat.nc AA-AB/complex/vdw-bonded/0.000/heat.log  : AA-AB/complex/vdw-bonded/0.000/heat.in AA-AB/complex/press.rst7 AA-AB/complex/complex-vdw-bonded.parm7 
	runcmd -- AA-AB/complex/vdw-bonded/0.000/heat.in AA-AB/complex/press.rst7 AA-AB/complex/complex-vdw-bonded.parm7  -- AA-AB/complex/vdw-bonded/0.000/heat.out AA-AB/complex/vdw-bonded/0.000/heat.info AA-AB/complex/vdw-bonded/0.000/heat.en AA-AB/complex/vdw-bonded/0.000/heat.rst7 AA-AB/complex/vdw-bonded/0.000/heat.nc AA-AB/complex/vdw-bonded/0.000/heat.log  -- \
	pmemd.cuda -i AA-AB/complex/vdw-bonded/0.000/heat.in -c AA-AB/complex/press.rst7 -ref AA-AB/complex/press.rst7 -p AA-AB/complex/complex-vdw-bonded.parm7  \
	  -O -o AA-AB/complex/vdw-bonded/0.000/heat.out -inf AA-AB/complex/vdw-bonded/0.000/heat.info -e AA-AB/complex/vdw-bonded/0.000/heat.en -r AA-AB/complex/vdw-bonded/0.000/heat.rst7 -x AA-AB/complex/vdw-bonded/0.000/heat.nc -l AA-AB/complex/vdw-bonded/0.000/heat.log 

AA-AB/complex/vdw-bonded/0.000/ti001.out AA-AB/complex/vdw-bonded/0.000/ti001.info AA-AB/complex/vdw-bonded/0.000/ti001.en AA-AB/complex/vdw-bonded/0.000/ti001.rst7 AA-AB/complex/vdw-bonded/0.000/ti001.nc AA-AB/complex/vdw-bonded/0.000/ti001.log  : AA-AB/complex/vdw-bonded/0.000/ti.in AA-AB/complex/vdw-bonded/0.000/heat.rst7 AA-AB/complex/complex-vdw-bonded.parm7 
	runcmd -- AA-AB/complex/vdw-bonded/0.000/ti.in AA-AB/complex/vdw-bonded/0.000/heat.rst7 AA-AB/complex/complex-vdw-bonded.parm7  -- AA-AB/complex/vdw-bonded/0.000/ti001.out AA-AB/complex/vdw-bonded/0.000/ti001.info AA-AB/complex/vdw-bonded/0.000/ti001.en AA-AB/complex/vdw-bonded/0.000/ti001.rst7 AA-AB/complex/vdw-bonded/0.000/ti001.nc AA-AB/complex/vdw-bonded/0.000/ti001.log  -- \
	pmemd.cuda -i AA-AB/complex/vdw-bonded/0.000/ti.in -c AA-AB/complex/vdw-bonded/0.000/heat.rst7 -p AA-AB/complex/complex-vdw-bonded.parm7  \
	  -O -o AA-AB/complex/vdw-bonded/0.000/ti001.out -inf AA-AB/complex/vdw-bonded/0.000/ti001.info -e AA-AB/complex/vdw-bonded/0.000/ti001.en -r AA-AB/complex/vdw-bonded/0.000/ti001.rst7 -x AA-AB/complex/vdw-bonded/0.000/ti001.nc -l AA-AB/complex/vdw-bonded/0.000/ti001.log 

AA-AB/complex/solvated.mol2 AA-AB/complex/source.mol2 AA-AB/complex/target.mol2  : AA-AB/complex/strip.in AA-AB/complex/complex-vdw-bonded.parm7 AA-AB/complex/press.rst7 
	runcmd -- AA-AB/complex/strip.in AA-AB/complex/complex-vdw-bonded.parm7 AA-AB/complex/press.rst7  -- AA-AB/complex/solvated.mol2 AA-AB/complex/source.mol2 AA-AB/complex/target.mol2  -- \
	cpptraj -i AA-AB/complex/strip.in -p AA-AB/complex/complex-vdw-bonded.parm7  


AA-AB/ligand/recharge/recharge.mol2 AA-AB/ligand/recharge/recharge.parm7 AA-AB/ligand/recharge/recharge.rst7  : postcharge/feps.cando AA-AB/ligand/solvated.mol2 AA-AB/ligand/target.mol2 
	runcmd -- postcharge/feps.cando AA-AB/ligand/solvated.mol2 AA-AB/ligand/target.mol2  -- AA-AB/ligand/recharge/recharge.mol2 AA-AB/ligand/recharge/recharge.parm7 AA-AB/ligand/recharge/recharge.rst7  -- \
	iclasp-boehm -l AA-AB/ligand/recharge/recharge.lisp


AA-AB/ligand/recharge/1.000/ti001.out AA-AB/ligand/recharge/1.000/ti001.info AA-AB/ligand/recharge/1.000/ti001.en AA-AB/ligand/recharge/1.000/ti001.rst7 AA-AB/ligand/recharge/1.000/ti001.nc AA-AB/ligand/recharge/1.000/ti001.log  : AA-AB/ligand/recharge/1.000/ti.in AA-AB/ligand/recharge/1.000/heat.rst7 AA-AB/ligand/recharge/recharge.parm7 
	runcmd -- AA-AB/ligand/recharge/1.000/ti.in AA-AB/ligand/recharge/1.000/heat.rst7 AA-AB/ligand/recharge/recharge.parm7  -- AA-AB/ligand/recharge/1.000/ti001.out AA-AB/ligand/recharge/1.000/ti001.info AA-AB/ligand/recharge/1.000/ti001.en AA-AB/ligand/recharge/1.000/ti001.rst7 AA-AB/ligand/recharge/1.000/ti001.nc AA-AB/ligand/recharge/1.000/ti001.log  -- \
	pmemd.cuda -i AA-AB/ligand/recharge/1.000/ti.in -c AA-AB/ligand/recharge/1.000/heat.rst7 -p AA-AB/ligand/recharge/recharge.parm7  \
	  -O -o AA-AB/ligand/recharge/1.000/ti001.out -inf AA-AB/ligand/recharge/1.000/ti001.info -e AA-AB/ligand/recharge/1.000/ti001.en -r AA-AB/ligand/recharge/1.000/ti001.rst7 -x AA-AB/ligand/recharge/1.000/ti001.nc -l AA-AB/ligand/recharge/1.000/ti001.log 

AA-AB/ligand/recharge/dvdl.dat  : AA-AB/ligand/recharge/1.000/ti001.en AA-AB/ligand/recharge/0.500/ti001.en AA-AB/ligand/recharge/0.000/ti001.en 
	runcmd -- AA-AB/ligand/recharge/1.000/ti001.en AA-AB/ligand/recharge/0.500/ti001.en AA-AB/ligand/recharge/0.000/ti001.en  -- AA-AB/ligand/recharge/dvdl.dat  -- \
	python2 getdvdl.py AA-AB/ligand/recharge/dvdl.dat AA-AB/ligand/recharge/1.000/ti001.en AA-AB/ligand/recharge/0.500/ti001.en AA-AB/ligand/recharge/0.000/ti001.en 


AA-AB/ligand/side-analysis.dat  : AA-AB/ligand/recharge/dvdl.dat AA-AB/ligand/vdw-bonded/dvdl.dat AA-AB/ligand/decharge/dvdl.dat 
	runcmd -- AA-AB/ligand/recharge/dvdl.dat AA-AB/ligand/vdw-bonded/dvdl.dat AA-AB/ligand/decharge/dvdl.dat  -- AA-AB/ligand/side-analysis.dat  -- \
	iclasp-boehm -l AA-AB/ligand/side-script.lisp


AA-AB/ligand/recharge/1.000/heat.out AA-AB/ligand/recharge/1.000/heat.info AA-AB/ligand/recharge/1.000/heat.en AA-AB/ligand/recharge/1.000/heat.rst7 AA-AB/ligand/recharge/1.000/heat.nc AA-AB/ligand/recharge/1.000/heat.log  : AA-AB/ligand/recharge/1.000/heat.in AA-AB/ligand/recharge/recharge.rst7 AA-AB/ligand/recharge/recharge.parm7 
	runcmd -- AA-AB/ligand/recharge/1.000/heat.in AA-AB/ligand/recharge/recharge.rst7 AA-AB/ligand/recharge/recharge.parm7  -- AA-AB/ligand/recharge/1.000/heat.out AA-AB/ligand/recharge/1.000/heat.info AA-AB/ligand/recharge/1.000/heat.en AA-AB/ligand/recharge/1.000/heat.rst7 AA-AB/ligand/recharge/1.000/heat.nc AA-AB/ligand/recharge/1.000/heat.log  -- \
	pmemd.cuda -i AA-AB/ligand/recharge/1.000/heat.in -c AA-AB/ligand/recharge/recharge.rst7 -ref AA-AB/ligand/recharge/recharge.rst7 -p AA-AB/ligand/recharge/recharge.parm7  \
	  -O -o AA-AB/ligand/recharge/1.000/heat.out -inf AA-AB/ligand/recharge/1.000/heat.info -e AA-AB/ligand/recharge/1.000/heat.en -r AA-AB/ligand/recharge/1.000/heat.rst7 -x AA-AB/ligand/recharge/1.000/heat.nc -l AA-AB/ligand/recharge/1.000/heat.log 

AA-AB/ligand/recharge/0.500/ti001.out AA-AB/ligand/recharge/0.500/ti001.info AA-AB/ligand/recharge/0.500/ti001.en AA-AB/ligand/recharge/0.500/ti001.rst7 AA-AB/ligand/recharge/0.500/ti001.nc AA-AB/ligand/recharge/0.500/ti001.log  : AA-AB/ligand/recharge/0.500/ti.in AA-AB/ligand/recharge/0.500/heat.rst7 AA-AB/ligand/recharge/recharge.parm7 
	runcmd -- AA-AB/ligand/recharge/0.500/ti.in AA-AB/ligand/recharge/0.500/heat.rst7 AA-AB/ligand/recharge/recharge.parm7  -- AA-AB/ligand/recharge/0.500/ti001.out AA-AB/ligand/recharge/0.500/ti001.info AA-AB/ligand/recharge/0.500/ti001.en AA-AB/ligand/recharge/0.500/ti001.rst7 AA-AB/ligand/recharge/0.500/ti001.nc AA-AB/ligand/recharge/0.500/ti001.log  -- \
	pmemd.cuda -i AA-AB/ligand/recharge/0.500/ti.in -c AA-AB/ligand/recharge/0.500/heat.rst7 -p AA-AB/ligand/recharge/recharge.parm7  \
	  -O -o AA-AB/ligand/recharge/0.500/ti001.out -inf AA-AB/ligand/recharge/0.500/ti001.info -e AA-AB/ligand/recharge/0.500/ti001.en -r AA-AB/ligand/recharge/0.500/ti001.rst7 -x AA-AB/ligand/recharge/0.500/ti001.nc -l AA-AB/ligand/recharge/0.500/ti001.log 

AA-AB/ligand/recharge/0.500/heat.out AA-AB/ligand/recharge/0.500/heat.info AA-AB/ligand/recharge/0.500/heat.en AA-AB/ligand/recharge/0.500/heat.rst7 AA-AB/ligand/recharge/0.500/heat.nc AA-AB/ligand/recharge/0.500/heat.log  : AA-AB/ligand/recharge/0.500/heat.in AA-AB/ligand/recharge/recharge.rst7 AA-AB/ligand/recharge/recharge.parm7 
	runcmd -- AA-AB/ligand/recharge/0.500/heat.in AA-AB/ligand/recharge/recharge.rst7 AA-AB/ligand/recharge/recharge.parm7  -- AA-AB/ligand/recharge/0.500/heat.out AA-AB/ligand/recharge/0.500/heat.info AA-AB/ligand/recharge/0.500/heat.en AA-AB/ligand/recharge/0.500/heat.rst7 AA-AB/ligand/recharge/0.500/heat.nc AA-AB/ligand/recharge/0.500/heat.log  -- \
	pmemd.cuda -i AA-AB/ligand/recharge/0.500/heat.in -c AA-AB/ligand/recharge/recharge.rst7 -ref AA-AB/ligand/recharge/recharge.rst7 -p AA-AB/ligand/recharge/recharge.parm7  \
	  -O -o AA-AB/ligand/recharge/0.500/heat.out -inf AA-AB/ligand/recharge/0.500/heat.info -e AA-AB/ligand/recharge/0.500/heat.en -r AA-AB/ligand/recharge/0.500/heat.rst7 -x AA-AB/ligand/recharge/0.500/heat.nc -l AA-AB/ligand/recharge/0.500/heat.log 

AA-AB/ligand/recharge/0.000/ti001.out AA-AB/ligand/recharge/0.000/ti001.info AA-AB/ligand/recharge/0.000/ti001.en AA-AB/ligand/recharge/0.000/ti001.rst7 AA-AB/ligand/recharge/0.000/ti001.nc AA-AB/ligand/recharge/0.000/ti001.log  : AA-AB/ligand/recharge/0.000/ti.in AA-AB/ligand/recharge/0.000/heat.rst7 AA-AB/ligand/recharge/recharge.parm7 
	runcmd -- AA-AB/ligand/recharge/0.000/ti.in AA-AB/ligand/recharge/0.000/heat.rst7 AA-AB/ligand/recharge/recharge.parm7  -- AA-AB/ligand/recharge/0.000/ti001.out AA-AB/ligand/recharge/0.000/ti001.info AA-AB/ligand/recharge/0.000/ti001.en AA-AB/ligand/recharge/0.000/ti001.rst7 AA-AB/ligand/recharge/0.000/ti001.nc AA-AB/ligand/recharge/0.000/ti001.log  -- \
	pmemd.cuda -i AA-AB/ligand/recharge/0.000/ti.in -c AA-AB/ligand/recharge/0.000/heat.rst7 -p AA-AB/ligand/recharge/recharge.parm7  \
	  -O -o AA-AB/ligand/recharge/0.000/ti001.out -inf AA-AB/ligand/recharge/0.000/ti001.info -e AA-AB/ligand/recharge/0.000/ti001.en -r AA-AB/ligand/recharge/0.000/ti001.rst7 -x AA-AB/ligand/recharge/0.000/ti001.nc -l AA-AB/ligand/recharge/0.000/ti001.log 

AA-AB/ligand/recharge/0.000/heat.out AA-AB/ligand/recharge/0.000/heat.info AA-AB/ligand/recharge/0.000/heat.en AA-AB/ligand/recharge/0.000/heat.rst7 AA-AB/ligand/recharge/0.000/heat.nc AA-AB/ligand/recharge/0.000/heat.log  : AA-AB/ligand/recharge/0.000/heat.in AA-AB/ligand/recharge/recharge.rst7 AA-AB/ligand/recharge/recharge.parm7 
	runcmd -- AA-AB/ligand/recharge/0.000/heat.in AA-AB/ligand/recharge/recharge.rst7 AA-AB/ligand/recharge/recharge.parm7  -- AA-AB/ligand/recharge/0.000/heat.out AA-AB/ligand/recharge/0.000/heat.info AA-AB/ligand/recharge/0.000/heat.en AA-AB/ligand/recharge/0.000/heat.rst7 AA-AB/ligand/recharge/0.000/heat.nc AA-AB/ligand/recharge/0.000/heat.log  -- \
	pmemd.cuda -i AA-AB/ligand/recharge/0.000/heat.in -c AA-AB/ligand/recharge/recharge.rst7 -ref AA-AB/ligand/recharge/recharge.rst7 -p AA-AB/ligand/recharge/recharge.parm7  \
	  -O -o AA-AB/ligand/recharge/0.000/heat.out -inf AA-AB/ligand/recharge/0.000/heat.info -e AA-AB/ligand/recharge/0.000/heat.en -r AA-AB/ligand/recharge/0.000/heat.rst7 -x AA-AB/ligand/recharge/0.000/heat.nc -l AA-AB/ligand/recharge/0.000/heat.log 

AA-AB/ligand/decharge/decharge.mol2 AA-AB/ligand/decharge/decharge.parm7 AA-AB/ligand/decharge/decharge.rst7  : postcharge/feps.cando AA-AB/ligand/solvated.mol2 AA-AB/ligand/source.mol2 
	runcmd -- postcharge/feps.cando AA-AB/ligand/solvated.mol2 AA-AB/ligand/source.mol2  -- AA-AB/ligand/decharge/decharge.mol2 AA-AB/ligand/decharge/decharge.parm7 AA-AB/ligand/decharge/decharge.rst7  -- \
	iclasp-boehm -l AA-AB/ligand/decharge/decharge.lisp


AA-AB/ligand/decharge/1.000/ti001.out AA-AB/ligand/decharge/1.000/ti001.info AA-AB/ligand/decharge/1.000/ti001.en AA-AB/ligand/decharge/1.000/ti001.rst7 AA-AB/ligand/decharge/1.000/ti001.nc AA-AB/ligand/decharge/1.000/ti001.log  : AA-AB/ligand/decharge/1.000/ti.in AA-AB/ligand/decharge/1.000/heat.rst7 AA-AB/ligand/decharge/decharge.parm7 
	runcmd -- AA-AB/ligand/decharge/1.000/ti.in AA-AB/ligand/decharge/1.000/heat.rst7 AA-AB/ligand/decharge/decharge.parm7  -- AA-AB/ligand/decharge/1.000/ti001.out AA-AB/ligand/decharge/1.000/ti001.info AA-AB/ligand/decharge/1.000/ti001.en AA-AB/ligand/decharge/1.000/ti001.rst7 AA-AB/ligand/decharge/1.000/ti001.nc AA-AB/ligand/decharge/1.000/ti001.log  -- \
	pmemd.cuda -i AA-AB/ligand/decharge/1.000/ti.in -c AA-AB/ligand/decharge/1.000/heat.rst7 -p AA-AB/ligand/decharge/decharge.parm7  \
	  -O -o AA-AB/ligand/decharge/1.000/ti001.out -inf AA-AB/ligand/decharge/1.000/ti001.info -e AA-AB/ligand/decharge/1.000/ti001.en -r AA-AB/ligand/decharge/1.000/ti001.rst7 -x AA-AB/ligand/decharge/1.000/ti001.nc -l AA-AB/ligand/decharge/1.000/ti001.log 

AA-AB/ligand/decharge/dvdl.dat  : AA-AB/ligand/decharge/1.000/ti001.en AA-AB/ligand/decharge/0.500/ti001.en AA-AB/ligand/decharge/0.000/ti001.en 
	runcmd -- AA-AB/ligand/decharge/1.000/ti001.en AA-AB/ligand/decharge/0.500/ti001.en AA-AB/ligand/decharge/0.000/ti001.en  -- AA-AB/ligand/decharge/dvdl.dat  -- \
	python2 getdvdl.py AA-AB/ligand/decharge/dvdl.dat AA-AB/ligand/decharge/1.000/ti001.en AA-AB/ligand/decharge/0.500/ti001.en AA-AB/ligand/decharge/0.000/ti001.en 


AA-AB/ligand/decharge/1.000/heat.out AA-AB/ligand/decharge/1.000/heat.info AA-AB/ligand/decharge/1.000/heat.en AA-AB/ligand/decharge/1.000/heat.rst7 AA-AB/ligand/decharge/1.000/heat.nc AA-AB/ligand/decharge/1.000/heat.log  : AA-AB/ligand/decharge/1.000/heat.in AA-AB/ligand/decharge/decharge.rst7 AA-AB/ligand/decharge/decharge.parm7 
	runcmd -- AA-AB/ligand/decharge/1.000/heat.in AA-AB/ligand/decharge/decharge.rst7 AA-AB/ligand/decharge/decharge.parm7  -- AA-AB/ligand/decharge/1.000/heat.out AA-AB/ligand/decharge/1.000/heat.info AA-AB/ligand/decharge/1.000/heat.en AA-AB/ligand/decharge/1.000/heat.rst7 AA-AB/ligand/decharge/1.000/heat.nc AA-AB/ligand/decharge/1.000/heat.log  -- \
	pmemd.cuda -i AA-AB/ligand/decharge/1.000/heat.in -c AA-AB/ligand/decharge/decharge.rst7 -ref AA-AB/ligand/decharge/decharge.rst7 -p AA-AB/ligand/decharge/decharge.parm7  \
	  -O -o AA-AB/ligand/decharge/1.000/heat.out -inf AA-AB/ligand/decharge/1.000/heat.info -e AA-AB/ligand/decharge/1.000/heat.en -r AA-AB/ligand/decharge/1.000/heat.rst7 -x AA-AB/ligand/decharge/1.000/heat.nc -l AA-AB/ligand/decharge/1.000/heat.log 

AA-AB/ligand/decharge/0.500/ti001.out AA-AB/ligand/decharge/0.500/ti001.info AA-AB/ligand/decharge/0.500/ti001.en AA-AB/ligand/decharge/0.500/ti001.rst7 AA-AB/ligand/decharge/0.500/ti001.nc AA-AB/ligand/decharge/0.500/ti001.log  : AA-AB/ligand/decharge/0.500/ti.in AA-AB/ligand/decharge/0.500/heat.rst7 AA-AB/ligand/decharge/decharge.parm7 
	runcmd -- AA-AB/ligand/decharge/0.500/ti.in AA-AB/ligand/decharge/0.500/heat.rst7 AA-AB/ligand/decharge/decharge.parm7  -- AA-AB/ligand/decharge/0.500/ti001.out AA-AB/ligand/decharge/0.500/ti001.info AA-AB/ligand/decharge/0.500/ti001.en AA-AB/ligand/decharge/0.500/ti001.rst7 AA-AB/ligand/decharge/0.500/ti001.nc AA-AB/ligand/decharge/0.500/ti001.log  -- \
	pmemd.cuda -i AA-AB/ligand/decharge/0.500/ti.in -c AA-AB/ligand/decharge/0.500/heat.rst7 -p AA-AB/ligand/decharge/decharge.parm7  \
	  -O -o AA-AB/ligand/decharge/0.500/ti001.out -inf AA-AB/ligand/decharge/0.500/ti001.info -e AA-AB/ligand/decharge/0.500/ti001.en -r AA-AB/ligand/decharge/0.500/ti001.rst7 -x AA-AB/ligand/decharge/0.500/ti001.nc -l AA-AB/ligand/decharge/0.500/ti001.log 

AA-AB/ligand/decharge/0.500/heat.out AA-AB/ligand/decharge/0.500/heat.info AA-AB/ligand/decharge/0.500/heat.en AA-AB/ligand/decharge/0.500/heat.rst7 AA-AB/ligand/decharge/0.500/heat.nc AA-AB/ligand/decharge/0.500/heat.log  : AA-AB/ligand/decharge/0.500/heat.in AA-AB/ligand/decharge/decharge.rst7 AA-AB/ligand/decharge/decharge.parm7 
	runcmd -- AA-AB/ligand/decharge/0.500/heat.in AA-AB/ligand/decharge/decharge.rst7 AA-AB/ligand/decharge/decharge.parm7  -- AA-AB/ligand/decharge/0.500/heat.out AA-AB/ligand/decharge/0.500/heat.info AA-AB/ligand/decharge/0.500/heat.en AA-AB/ligand/decharge/0.500/heat.rst7 AA-AB/ligand/decharge/0.500/heat.nc AA-AB/ligand/decharge/0.500/heat.log  -- \
	pmemd.cuda -i AA-AB/ligand/decharge/0.500/heat.in -c AA-AB/ligand/decharge/decharge.rst7 -ref AA-AB/ligand/decharge/decharge.rst7 -p AA-AB/ligand/decharge/decharge.parm7  \
	  -O -o AA-AB/ligand/decharge/0.500/heat.out -inf AA-AB/ligand/decharge/0.500/heat.info -e AA-AB/ligand/decharge/0.500/heat.en -r AA-AB/ligand/decharge/0.500/heat.rst7 -x AA-AB/ligand/decharge/0.500/heat.nc -l AA-AB/ligand/decharge/0.500/heat.log 

AA-AB/ligand/decharge/0.000/ti001.out AA-AB/ligand/decharge/0.000/ti001.info AA-AB/ligand/decharge/0.000/ti001.en AA-AB/ligand/decharge/0.000/ti001.rst7 AA-AB/ligand/decharge/0.000/ti001.nc AA-AB/ligand/decharge/0.000/ti001.log  : AA-AB/ligand/decharge/0.000/ti.in AA-AB/ligand/decharge/0.000/heat.rst7 AA-AB/ligand/decharge/decharge.parm7 
	runcmd -- AA-AB/ligand/decharge/0.000/ti.in AA-AB/ligand/decharge/0.000/heat.rst7 AA-AB/ligand/decharge/decharge.parm7  -- AA-AB/ligand/decharge/0.000/ti001.out AA-AB/ligand/decharge/0.000/ti001.info AA-AB/ligand/decharge/0.000/ti001.en AA-AB/ligand/decharge/0.000/ti001.rst7 AA-AB/ligand/decharge/0.000/ti001.nc AA-AB/ligand/decharge/0.000/ti001.log  -- \
	pmemd.cuda -i AA-AB/ligand/decharge/0.000/ti.in -c AA-AB/ligand/decharge/0.000/heat.rst7 -p AA-AB/ligand/decharge/decharge.parm7  \
	  -O -o AA-AB/ligand/decharge/0.000/ti001.out -inf AA-AB/ligand/decharge/0.000/ti001.info -e AA-AB/ligand/decharge/0.000/ti001.en -r AA-AB/ligand/decharge/0.000/ti001.rst7 -x AA-AB/ligand/decharge/0.000/ti001.nc -l AA-AB/ligand/decharge/0.000/ti001.log 

AA-AB/ligand/decharge/0.000/heat.out AA-AB/ligand/decharge/0.000/heat.info AA-AB/ligand/decharge/0.000/heat.en AA-AB/ligand/decharge/0.000/heat.rst7 AA-AB/ligand/decharge/0.000/heat.nc AA-AB/ligand/decharge/0.000/heat.log  : AA-AB/ligand/decharge/0.000/heat.in AA-AB/ligand/decharge/decharge.rst7 AA-AB/ligand/decharge/decharge.parm7 
	runcmd -- AA-AB/ligand/decharge/0.000/heat.in AA-AB/ligand/decharge/decharge.rst7 AA-AB/ligand/decharge/decharge.parm7  -- AA-AB/ligand/decharge/0.000/heat.out AA-AB/ligand/decharge/0.000/heat.info AA-AB/ligand/decharge/0.000/heat.en AA-AB/ligand/decharge/0.000/heat.rst7 AA-AB/ligand/decharge/0.000/heat.nc AA-AB/ligand/decharge/0.000/heat.log  -- \
	pmemd.cuda -i AA-AB/ligand/decharge/0.000/heat.in -c AA-AB/ligand/decharge/decharge.rst7 -ref AA-AB/ligand/decharge/decharge.rst7 -p AA-AB/ligand/decharge/decharge.parm7  \
	  -O -o AA-AB/ligand/decharge/0.000/heat.out -inf AA-AB/ligand/decharge/0.000/heat.info -e AA-AB/ligand/decharge/0.000/heat.en -r AA-AB/ligand/decharge/0.000/heat.rst7 -x AA-AB/ligand/decharge/0.000/heat.nc -l AA-AB/ligand/decharge/0.000/heat.log 

AA-AB/ligand/ligand-vdw-bonded.rst7 AA-AB/ligand/ligand-vdw-bonded.parm7 AA-AB/ligand/ligand-vdw-bonded.mol2  : postcharge/feps.cando 
	runcmd -- postcharge/feps.cando  -- AA-AB/ligand/ligand-vdw-bonded.rst7 AA-AB/ligand/ligand-vdw-bonded.parm7 AA-AB/ligand/ligand-vdw-bonded.mol2  -- \
	iclasp-boehm -l AA-AB/ligand/solvate-addion.lisp


AA-AB/ligand/min.out AA-AB/ligand/min.info AA-AB/ligand/min.en AA-AB/ligand/min.rst7 AA-AB/ligand/min.nc AA-AB/ligand/min.log  : AA-AB/ligand/min.in AA-AB/ligand/ligand-vdw-bonded.rst7 AA-AB/ligand/ligand-vdw-bonded.parm7 
	runcmd -- AA-AB/ligand/min.in AA-AB/ligand/ligand-vdw-bonded.rst7 AA-AB/ligand/ligand-vdw-bonded.parm7  -- AA-AB/ligand/min.out AA-AB/ligand/min.info AA-AB/ligand/min.en AA-AB/ligand/min.rst7 AA-AB/ligand/min.nc AA-AB/ligand/min.log  -- \
	pmemd -i AA-AB/ligand/min.in -c AA-AB/ligand/ligand-vdw-bonded.rst7 -ref AA-AB/ligand/ligand-vdw-bonded.rst7 -p AA-AB/ligand/ligand-vdw-bonded.parm7  -O -o AA-AB/ligand/min.out -inf AA-AB/ligand/min.info -e AA-AB/ligand/min.en -r AA-AB/ligand/min.rst7 -x AA-AB/ligand/min.nc -l AA-AB/ligand/min.log 


AA-AB/ligand/heat.out AA-AB/ligand/heat.info AA-AB/ligand/heat.en AA-AB/ligand/heat.rst7 AA-AB/ligand/heat.nc AA-AB/ligand/heat.log  : AA-AB/ligand/heat.in AA-AB/ligand/min.rst7 AA-AB/ligand/ligand-vdw-bonded.parm7 
	runcmd -- AA-AB/ligand/heat.in AA-AB/ligand/min.rst7 AA-AB/ligand/ligand-vdw-bonded.parm7  -- AA-AB/ligand/heat.out AA-AB/ligand/heat.info AA-AB/ligand/heat.en AA-AB/ligand/heat.rst7 AA-AB/ligand/heat.nc AA-AB/ligand/heat.log  -- \
	pmemd.cuda -i AA-AB/ligand/heat.in -c AA-AB/ligand/min.rst7 -ref AA-AB/ligand/min.rst7 -p AA-AB/ligand/ligand-vdw-bonded.parm7  -O -o AA-AB/ligand/heat.out -inf AA-AB/ligand/heat.info -e AA-AB/ligand/heat.en -r AA-AB/ligand/heat.rst7 -x AA-AB/ligand/heat.nc -l AA-AB/ligand/heat.log 


AA-AB/ligand/press.out AA-AB/ligand/press.info AA-AB/ligand/press.en AA-AB/ligand/press.rst7 AA-AB/ligand/press.nc AA-AB/ligand/press.log  : AA-AB/ligand/press.in AA-AB/ligand/heat.rst7 AA-AB/ligand/ligand-vdw-bonded.parm7 
	runcmd -- AA-AB/ligand/press.in AA-AB/ligand/heat.rst7 AA-AB/ligand/ligand-vdw-bonded.parm7  -- AA-AB/ligand/press.out AA-AB/ligand/press.info AA-AB/ligand/press.en AA-AB/ligand/press.rst7 AA-AB/ligand/press.nc AA-AB/ligand/press.log  -- \
	pmemd -i AA-AB/ligand/press.in -c AA-AB/ligand/heat.rst7 -ref AA-AB/ligand/heat.rst7 -p AA-AB/ligand/ligand-vdw-bonded.parm7  -O -o AA-AB/ligand/press.out -inf AA-AB/ligand/press.info -e AA-AB/ligand/press.en -r AA-AB/ligand/press.rst7 -x AA-AB/ligand/press.nc -l AA-AB/ligand/press.log 


AA-AB/ligand/vdw-bonded/1.000/heat.out AA-AB/ligand/vdw-bonded/1.000/heat.info AA-AB/ligand/vdw-bonded/1.000/heat.en AA-AB/ligand/vdw-bonded/1.000/heat.rst7 AA-AB/ligand/vdw-bonded/1.000/heat.nc AA-AB/ligand/vdw-bonded/1.000/heat.log  : AA-AB/ligand/vdw-bonded/1.000/heat.in AA-AB/ligand/press.rst7 AA-AB/ligand/ligand-vdw-bonded.parm7 
	runcmd -- AA-AB/ligand/vdw-bonded/1.000/heat.in AA-AB/ligand/press.rst7 AA-AB/ligand/ligand-vdw-bonded.parm7  -- AA-AB/ligand/vdw-bonded/1.000/heat.out AA-AB/ligand/vdw-bonded/1.000/heat.info AA-AB/ligand/vdw-bonded/1.000/heat.en AA-AB/ligand/vdw-bonded/1.000/heat.rst7 AA-AB/ligand/vdw-bonded/1.000/heat.nc AA-AB/ligand/vdw-bonded/1.000/heat.log  -- \
	pmemd.cuda -i AA-AB/ligand/vdw-bonded/1.000/heat.in -c AA-AB/ligand/press.rst7 -ref AA-AB/ligand/press.rst7 -p AA-AB/ligand/ligand-vdw-bonded.parm7  \
	  -O -o AA-AB/ligand/vdw-bonded/1.000/heat.out -inf AA-AB/ligand/vdw-bonded/1.000/heat.info -e AA-AB/ligand/vdw-bonded/1.000/heat.en -r AA-AB/ligand/vdw-bonded/1.000/heat.rst7 -x AA-AB/ligand/vdw-bonded/1.000/heat.nc -l AA-AB/ligand/vdw-bonded/1.000/heat.log 

AA-AB/ligand/vdw-bonded/1.000/ti001.out AA-AB/ligand/vdw-bonded/1.000/ti001.info AA-AB/ligand/vdw-bonded/1.000/ti001.en AA-AB/ligand/vdw-bonded/1.000/ti001.rst7 AA-AB/ligand/vdw-bonded/1.000/ti001.nc AA-AB/ligand/vdw-bonded/1.000/ti001.log  : AA-AB/ligand/vdw-bonded/1.000/ti.in AA-AB/ligand/vdw-bonded/1.000/heat.rst7 AA-AB/ligand/ligand-vdw-bonded.parm7 
	runcmd -- AA-AB/ligand/vdw-bonded/1.000/ti.in AA-AB/ligand/vdw-bonded/1.000/heat.rst7 AA-AB/ligand/ligand-vdw-bonded.parm7  -- AA-AB/ligand/vdw-bonded/1.000/ti001.out AA-AB/ligand/vdw-bonded/1.000/ti001.info AA-AB/ligand/vdw-bonded/1.000/ti001.en AA-AB/ligand/vdw-bonded/1.000/ti001.rst7 AA-AB/ligand/vdw-bonded/1.000/ti001.nc AA-AB/ligand/vdw-bonded/1.000/ti001.log  -- \
	pmemd.cuda -i AA-AB/ligand/vdw-bonded/1.000/ti.in -c AA-AB/ligand/vdw-bonded/1.000/heat.rst7 -p AA-AB/ligand/ligand-vdw-bonded.parm7  \
	  -O -o AA-AB/ligand/vdw-bonded/1.000/ti001.out -inf AA-AB/ligand/vdw-bonded/1.000/ti001.info -e AA-AB/ligand/vdw-bonded/1.000/ti001.en -r AA-AB/ligand/vdw-bonded/1.000/ti001.rst7 -x AA-AB/ligand/vdw-bonded/1.000/ti001.nc -l AA-AB/ligand/vdw-bonded/1.000/ti001.log 

AA-AB/ligand/vdw-bonded/dvdl.dat  : AA-AB/ligand/vdw-bonded/1.000/ti001.en AA-AB/ligand/vdw-bonded/0.500/ti001.en AA-AB/ligand/vdw-bonded/0.000/ti001.en 
	runcmd -- AA-AB/ligand/vdw-bonded/1.000/ti001.en AA-AB/ligand/vdw-bonded/0.500/ti001.en AA-AB/ligand/vdw-bonded/0.000/ti001.en  -- AA-AB/ligand/vdw-bonded/dvdl.dat  -- \
	python2 getdvdl.py AA-AB/ligand/vdw-bonded/dvdl.dat AA-AB/ligand/vdw-bonded/1.000/ti001.en AA-AB/ligand/vdw-bonded/0.500/ti001.en AA-AB/ligand/vdw-bonded/0.000/ti001.en 


AA-AB/ligand/vdw-bonded/0.500/heat.out AA-AB/ligand/vdw-bonded/0.500/heat.info AA-AB/ligand/vdw-bonded/0.500/heat.en AA-AB/ligand/vdw-bonded/0.500/heat.rst7 AA-AB/ligand/vdw-bonded/0.500/heat.nc AA-AB/ligand/vdw-bonded/0.500/heat.log  : AA-AB/ligand/vdw-bonded/0.500/heat.in AA-AB/ligand/press.rst7 AA-AB/ligand/ligand-vdw-bonded.parm7 
	runcmd -- AA-AB/ligand/vdw-bonded/0.500/heat.in AA-AB/ligand/press.rst7 AA-AB/ligand/ligand-vdw-bonded.parm7  -- AA-AB/ligand/vdw-bonded/0.500/heat.out AA-AB/ligand/vdw-bonded/0.500/heat.info AA-AB/ligand/vdw-bonded/0.500/heat.en AA-AB/ligand/vdw-bonded/0.500/heat.rst7 AA-AB/ligand/vdw-bonded/0.500/heat.nc AA-AB/ligand/vdw-bonded/0.500/heat.log  -- \
	pmemd.cuda -i AA-AB/ligand/vdw-bonded/0.500/heat.in -c AA-AB/ligand/press.rst7 -ref AA-AB/ligand/press.rst7 -p AA-AB/ligand/ligand-vdw-bonded.parm7  \
	  -O -o AA-AB/ligand/vdw-bonded/0.500/heat.out -inf AA-AB/ligand/vdw-bonded/0.500/heat.info -e AA-AB/ligand/vdw-bonded/0.500/heat.en -r AA-AB/ligand/vdw-bonded/0.500/heat.rst7 -x AA-AB/ligand/vdw-bonded/0.500/heat.nc -l AA-AB/ligand/vdw-bonded/0.500/heat.log 

AA-AB/ligand/vdw-bonded/0.500/ti001.out AA-AB/ligand/vdw-bonded/0.500/ti001.info AA-AB/ligand/vdw-bonded/0.500/ti001.en AA-AB/ligand/vdw-bonded/0.500/ti001.rst7 AA-AB/ligand/vdw-bonded/0.500/ti001.nc AA-AB/ligand/vdw-bonded/0.500/ti001.log  : AA-AB/ligand/vdw-bonded/0.500/ti.in AA-AB/ligand/vdw-bonded/0.500/heat.rst7 AA-AB/ligand/ligand-vdw-bonded.parm7 
	runcmd -- AA-AB/ligand/vdw-bonded/0.500/ti.in AA-AB/ligand/vdw-bonded/0.500/heat.rst7 AA-AB/ligand/ligand-vdw-bonded.parm7  -- AA-AB/ligand/vdw-bonded/0.500/ti001.out AA-AB/ligand/vdw-bonded/0.500/ti001.info AA-AB/ligand/vdw-bonded/0.500/ti001.en AA-AB/ligand/vdw-bonded/0.500/ti001.rst7 AA-AB/ligand/vdw-bonded/0.500/ti001.nc AA-AB/ligand/vdw-bonded/0.500/ti001.log  -- \
	pmemd.cuda -i AA-AB/ligand/vdw-bonded/0.500/ti.in -c AA-AB/ligand/vdw-bonded/0.500/heat.rst7 -p AA-AB/ligand/ligand-vdw-bonded.parm7  \
	  -O -o AA-AB/ligand/vdw-bonded/0.500/ti001.out -inf AA-AB/ligand/vdw-bonded/0.500/ti001.info -e AA-AB/ligand/vdw-bonded/0.500/ti001.en -r AA-AB/ligand/vdw-bonded/0.500/ti001.rst7 -x AA-AB/ligand/vdw-bonded/0.500/ti001.nc -l AA-AB/ligand/vdw-bonded/0.500/ti001.log 

AA-AB/ligand/vdw-bonded/0.000/heat.out AA-AB/ligand/vdw-bonded/0.000/heat.info AA-AB/ligand/vdw-bonded/0.000/heat.en AA-AB/ligand/vdw-bonded/0.000/heat.rst7 AA-AB/ligand/vdw-bonded/0.000/heat.nc AA-AB/ligand/vdw-bonded/0.000/heat.log  : AA-AB/ligand/vdw-bonded/0.000/heat.in AA-AB/ligand/press.rst7 AA-AB/ligand/ligand-vdw-bonded.parm7 
	runcmd -- AA-AB/ligand/vdw-bonded/0.000/heat.in AA-AB/ligand/press.rst7 AA-AB/ligand/ligand-vdw-bonded.parm7  -- AA-AB/ligand/vdw-bonded/0.000/heat.out AA-AB/ligand/vdw-bonded/0.000/heat.info AA-AB/ligand/vdw-bonded/0.000/heat.en AA-AB/ligand/vdw-bonded/0.000/heat.rst7 AA-AB/ligand/vdw-bonded/0.000/heat.nc AA-AB/ligand/vdw-bonded/0.000/heat.log  -- \
	pmemd.cuda -i AA-AB/ligand/vdw-bonded/0.000/heat.in -c AA-AB/ligand/press.rst7 -ref AA-AB/ligand/press.rst7 -p AA-AB/ligand/ligand-vdw-bonded.parm7  \
	  -O -o AA-AB/ligand/vdw-bonded/0.000/heat.out -inf AA-AB/ligand/vdw-bonded/0.000/heat.info -e AA-AB/ligand/vdw-bonded/0.000/heat.en -r AA-AB/ligand/vdw-bonded/0.000/heat.rst7 -x AA-AB/ligand/vdw-bonded/0.000/heat.nc -l AA-AB/ligand/vdw-bonded/0.000/heat.log 

AA-AB/ligand/vdw-bonded/0.000/ti001.out AA-AB/ligand/vdw-bonded/0.000/ti001.info AA-AB/ligand/vdw-bonded/0.000/ti001.en AA-AB/ligand/vdw-bonded/0.000/ti001.rst7 AA-AB/ligand/vdw-bonded/0.000/ti001.nc AA-AB/ligand/vdw-bonded/0.000/ti001.log  : AA-AB/ligand/vdw-bonded/0.000/ti.in AA-AB/ligand/vdw-bonded/0.000/heat.rst7 AA-AB/ligand/ligand-vdw-bonded.parm7 
	runcmd -- AA-AB/ligand/vdw-bonded/0.000/ti.in AA-AB/ligand/vdw-bonded/0.000/heat.rst7 AA-AB/ligand/ligand-vdw-bonded.parm7  -- AA-AB/ligand/vdw-bonded/0.000/ti001.out AA-AB/ligand/vdw-bonded/0.000/ti001.info AA-AB/ligand/vdw-bonded/0.000/ti001.en AA-AB/ligand/vdw-bonded/0.000/ti001.rst7 AA-AB/ligand/vdw-bonded/0.000/ti001.nc AA-AB/ligand/vdw-bonded/0.000/ti001.log  -- \
	pmemd.cuda -i AA-AB/ligand/vdw-bonded/0.000/ti.in -c AA-AB/ligand/vdw-bonded/0.000/heat.rst7 -p AA-AB/ligand/ligand-vdw-bonded.parm7  \
	  -O -o AA-AB/ligand/vdw-bonded/0.000/ti001.out -inf AA-AB/ligand/vdw-bonded/0.000/ti001.info -e AA-AB/ligand/vdw-bonded/0.000/ti001.en -r AA-AB/ligand/vdw-bonded/0.000/ti001.rst7 -x AA-AB/ligand/vdw-bonded/0.000/ti001.nc -l AA-AB/ligand/vdw-bonded/0.000/ti001.log 

AA-AB/ligand/solvated.mol2 AA-AB/ligand/source.mol2 AA-AB/ligand/target.mol2  : AA-AB/ligand/strip.in AA-AB/ligand/ligand-vdw-bonded.parm7 AA-AB/ligand/press.rst7 
	runcmd -- AA-AB/ligand/strip.in AA-AB/ligand/ligand-vdw-bonded.parm7 AA-AB/ligand/press.rst7  -- AA-AB/ligand/solvated.mol2 AA-AB/ligand/source.mol2 AA-AB/ligand/target.mol2  -- \
	cpptraj -i AA-AB/ligand/strip.in -p AA-AB/ligand/ligand-vdw-bonded.parm7  


am1bcc/aa.out  : am1bcc/aa.in 
	runcmd -- am1bcc/aa.in  -- am1bcc/aa.out  -- \
	sqm -i am1bcc/aa.in  -O -o am1bcc/aa.out 


am1bcc/ab.out  : am1bcc/ab.in 
	runcmd -- am1bcc/ab.in  -- am1bcc/ab.out  -- \
	sqm -i am1bcc/ab.in  -O -o am1bcc/ab.out 



