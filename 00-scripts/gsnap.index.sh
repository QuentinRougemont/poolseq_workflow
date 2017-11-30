module load gmap/2016-06-09

# Global variables
GENOMEFOLDER="./08-genome"
FASTA="08-genome/genome.fasta"
GENOME="gmap_genome"

#prepare the genome
gmap_build --dir="$GENOMEFOLDER" "$FASTA" -d "$GENOME" 2>&1 | tee 10_log_files/"$TIMESTAMP"_index.log
