#!/bin/bash

path=00-scripts/popoolation2/
folder="05-popoolation"

in="--input "$folder"/pool.sync"
out="--output-prefix "$folder"/pool_all"

perl $path/snp-frequency-diff.pl $in  \
    $out \
    --min-count 10 \
    --min-coverage 10 \
    --max-coverage 10000

