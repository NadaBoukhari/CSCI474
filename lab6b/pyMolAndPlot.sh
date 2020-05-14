#!/bin/bash

# declare arrays of PDBs
pdbIDs=('5con' '5coo' '5cop' '4hla' '5bry' '5bs4' '4hdp' '5dgw')
target="5dgu"
echo $target
echo ${pdbIDs[@]}
pdbLen=${#pdbIDs[@]}
echo $pdbLen

# fetch the target pdbID
echo "fetch 5dgu, async=0" > pymolCmnds.pml

# fetch all of the drug candidate structures
for pdbID in "${pdbIDs[@]}"
do
	echo "fetch $pdbID, async=0" >> pymolCmnds.pml
done

# structurally align each candidate structure against the target
for pdbID in "${pdbIDs[@]}"
do
	echo "align $pdbID & res 1-40+60-90 & name n+ca+c+o, $target & res 1-40+60-90 & name n+ca+c+o" >> pymolCmnds.pml
	echo "save ${pdbID}_aligned.pdb, $pdbID" >> pymolCmnds.pml
done

#invoke pymol
pymol pymolCmnds.pml -qc
