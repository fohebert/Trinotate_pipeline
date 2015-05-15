#!/bin/bash

# GLOBAL VARIABLES
QUERY="02_transdecoder/"
DATABASE="/home/fogah/blast/databases/uniprot_sprot_trinotate"
OUTPUT_DIR="04_blastp_sprot"

# Blasting the longest ORFs found with TransDecoder on swissprot
for file in `ls -1 $QUERY/*.fasta`; do
    
    # Specifiying the name of the output file from blastp
    OUTFILE=${file%.fasta}.blastp.sprot.fmt6
    
    # Blast command using parallel to increase speed
    cat $file \
    parallel -j 5 -k --block 1K --recstart '>' \
    --pipe blastp \
    -query - \
    -db $DATABASE \
    -num_threads 5 \
    -max_target_seqs 1 \
    -outfmt 6 \
    >$OUTFILE;
done

# Moving output file into output directory
mv $QUERY/*.fmt6 $OUTPUT_DIR

touch 03_blastp.complete
