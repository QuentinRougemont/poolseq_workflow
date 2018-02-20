#!/bin/bash
#Run cutadapt on paired-end/single-end sequencing data
#remove adatapter and trim sequenced to a desired length
#BEFORE doing that, do not forget to have a look at the quality of the data (use fastqc for instance)
TIMESTAMP=$(date +%Y-%m-%d_%Hh%Mm%Ss)
NCPU=$1  #number of CPU, can be set to any number

mkdir 02-raw/cutadapt 2>/dev/null

if [ ! -d "10-log_files/" ]  ; 
then  
    echo "creation du dossier" ; 
    mkdir 10-log_files/; 
fi

input1=$( ls 02-raw/*R1.*.gz | sed -e 's/02-raw\///g' )
input2=$(echo "$input1" | perl -pe 's/R1/R2/')
adapter="-a AGATCGGAAGAGCG" #name of the first adapter
adapter2="-A AGACCGATCAGAAC" #name of the second adapter 
error="-e 0.1" #error rate 
m="-m 95" #length at which we want to trim the data

if [[ -z "$NCPU" ]] ;
then
   NCPU=1
fi

ls -1 02-raw/*.R1.fastq.gz |
parallel -j $NCPU cutadapt \
        $adapter \
        $adapter2 \
        -o 02-raw/cutadapt/{/} \
        -p 02-raw/cutadapt/"${input1%.R1.fastq.gz}".R2.fastq.gz\ #comment this line if single end
        $error\
        #$discard_trimmed $untrimmed_output $discard_short\
        $m {}\
        $input2\ #comment this line if single end
        '2>&1' /10-log_files/log_"$TIMESTAMP"_cutadapt_"${i%.fq.gz}".log

#All information on cutadapt is available here: http://cutadapt.readthedocs.org/en/stable/guide.html
#can be cloned from github at: git clone https://github.com/marcelm/cutadapt.git
#for dependencies see: http://cutadapt.readthedocs.org/en/stable/installation.html
