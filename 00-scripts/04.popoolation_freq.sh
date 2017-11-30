#!/bin/bash

path=00-scripts/popoolation2/
folder="06-popoolation"

in="--input "$folder"/pool.sync"
out="--output-prefix "$folder"/pool_all"
min="--min-count 6"
minc="--min-coverage 50 "
maxc="--max-coverage 1000 "

perl $path/snp-frequency-diff.pl $in  $out --min-count 10 --min-coverage 10 --max-coverage 10000

