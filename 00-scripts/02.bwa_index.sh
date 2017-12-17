#!/bin/bash

# Global variables
GENOMEFOLDER="08-genome"
GENOME="your_genome"
NCPU=$1

# Test if user specified a number of CPUs
if [[ -z "$NCPU" ]]
then
    NCPU=1
fi

# Index genome if not alread done
 bwa index -p $GENOMEFOLDER/$GENOME $GENOMEFOLDER/$GENOME.fasta
 samtools faidx $GENOMEFOLDER/$GENOME.fasta
