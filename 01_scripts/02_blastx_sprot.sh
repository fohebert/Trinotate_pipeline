#!/bin/bash

# GLOBAL VARIABLES
QUERY="00_raw_data/"
DATABASE="/home/fogah/blast/databases/uniprot_sprot_trinotate"
OUTPUT_DIR="03_blastx_sprot"

# Blasting assembly sequences (nucl) on swissprot
for file in `ls -1 $QUERY/*.fasta`; do
    
    OUTFILE=${file%.fasta}.blastx.sprot.fmt6 # prepare the name of output file
    
    # Blast command using parallel to increase speed
    cat $file | \
    parallel -j 10 -k --block 1K --recstart '>' \
    --pipe blastx \
    -query - \
    -db $DATABASE \
    -num_threads 5 \
    -max_target_seqs 1 \
    -outfmt 6 \
    > $OUTFILE;
done

# Moving output file into output directory
mv $QUERY/*.fmt6 $OUTPUT_DIR

touch 02_blastx.complete
