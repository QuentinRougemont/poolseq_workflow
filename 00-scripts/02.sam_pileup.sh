#!/bin/bash

list_bam="list_pools"
genome="08-genome/probes-RAPTURE-9818.fasta"
out="06-popoolation"
samtools mpileup -f $genome -B $(ls ./04-all_samples/*sort.bam) -d 10000  > $out/pool.mpileup
