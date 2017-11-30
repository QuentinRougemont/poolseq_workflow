#!/bin/bash

path=00-scripts/popoolation2/
folder="06-popoolation"

in="--input"
out="--output"
fq="--fastq-type sanger"
qual="--min-qual 30"
th="--threads 8" 

java -ea -Xmx7g -jar "$path"/mpileup2sync.jar "$in" "$folder"/pool.mpileup $out $folder/pool.sync  --min-qual 20 --threads 8
echo "job pool2sync.jar  successfuly finished"
