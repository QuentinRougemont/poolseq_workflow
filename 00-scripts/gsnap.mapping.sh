#module prerequis
#module load gmap/2016-06-09
#module load samtools/1.3

# Global variables
DATAOUTPUT="11-gsnap"
DATAINPUT="04-all_samples"
GENOMEFOLDER="08-genome"
GENOME="gmap_lobster"

base=$( awk '{print $1}' 01-info_files/population_map.txt )
for i in $base ; 
do 
    # Align reads
    echo "Aligning $base"

    gsnap --gunzip -t 8 -A sam -m 5 -i 2 --min-coverage=1.00 \
          --dir="$GENOMEFOLDER" -d "$GENOME" --read-group-id=$i\
           -o "$DATAOUTPUT"/$i.sam \
           "$DATAINPUT"/$i.fq.gz 

    # Create bam file
    echo "Creating bam for $i"

    samtools view -Sb -q 5 -F 4 -F 256 -F 2048  \
        $DATAOUTPUT/$i.sam >  $DATAOUTPUT/$i.bam

     echo "Creating sorted bam for $base"
     samtools sort "$DATAOUTPUT"/$i.bam > "$DATAOUTPUT"/$i.sort.bam
     samtools index "$DATAOUTPUT"/$i.sort.bam 

    # Clean up
    echo "Removing "$DATAOUTPUT"/"$base".sam"
    echo "Removing "$DATAOUTPUT"/"$base".bam"
done
   	#rm $DATAOUTPUT/"$base".sam
    #rm $DATAOUTPUT/"$base".bam
