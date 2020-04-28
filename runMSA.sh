#!/bin/bash

# retrieve from command line how many interations to perform 
numIterations=${1}

#retrieve the 5 sequences
seq1=${2}
seq2=${3}
seq3=${4}
seq4=${5}
seq5=${6}

#calculate sequence length
seqLength=${#seq1}

#declare variables
trialNum=0
largestOutputYet=0

#as many times as the user has specified, run randomMSA
for numTries in `seq 1 ${numIterations}`; do

	#invoke the java program, pass the right parameters
	output=$(java randomMSA ${seq1} ${seq2} ${seq3} ${seq4} ${seq5})

	#increment the number of tries
	trialNum=$((trialNum +1))

	#retain the value of the highest scoring MSA
	#print the MSA each time that a new better alignment is found
	if [ $output -gt $largestOutputYet ]; then
		largestOutputYet=$output
		echo " Score: $output on try number $numTries"
		while read line; do
			echo $line
		done < "msa.txt"
	fi

done
