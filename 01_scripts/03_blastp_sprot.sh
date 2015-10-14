#!/bin/bash

# GLOBAL VARIABLES
QUERY="02_transdecoder"
DATABASE="/home/fogah/blast/databases/uniprot_sprot_trinotate"
OUTPUT_DIR="04_blastp_sprot"

# Blasting the longest ORFs found with TransDecoder on swissprot
for file in `ls -1 $QUERY/*.fasta | sed 's/02_transdecoder\///g'`; do
    
    # Specifiying the name of the output file from blastp
    OUTFILE=${file%.fasta}.blastp.sprot.fmt6
    
    # Blast command using parallel to increase speed
    cat $QUERY/$file | \
    parallel -j 4 -k --block 1K --recstart '>' \
    --pipe blastp \
    -query - \
    -db $DATABASE \
    -num_threads 5 \
    -max_target_seqs 1 \
    -outfmt 6 \
    >$OUTPUT_DIR/$OUTFILE;
done

touch blastp.complete
