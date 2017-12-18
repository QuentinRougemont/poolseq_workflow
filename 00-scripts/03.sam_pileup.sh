#!/bin/bash

list_bam="list_pools"
genome="06-genome/your_genome.fasta"
out="05-popoolation"
samtools mpileup -f $genome -B $(ls ./04-all_samples/*sort.bam) -d 10000  > $out/pool.mpileup
