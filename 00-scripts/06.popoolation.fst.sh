#/bin/bash

path=00-scripts/popoolation2/
folder="05-popoolation"

in="--input "$folder"/pool.sync"
out="--output "$folder"/pool.fst"
perl "$path"/fst-sliding.pl $in $out  --suppress-noninformative \
    --min-count 10 \
    --min-coverage 50 \
    --max-coverage 1000 \
    --min-covered-fraction 1 \
    --window-size 1 \
    --step-size 1 \
    --pool-size 48
#perl "$path"/fst-sliding.pl $in $out  --suppress-noninformative "$min" "$minc" $maxc" "$mcf" "$win" "$sts" "$psiz"
