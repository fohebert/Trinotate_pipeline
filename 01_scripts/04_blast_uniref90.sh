#!/bin/bash

# GLOBAL VARIABLES
QUERY_BLASTX="00_raw_data"
QUERY_BLASTP="02_transdecoder"
DATABASE="/home/fogah/blast/databases/uniprot_uniref90_trinotate"
OUTPUT_DIR="05_OPTIONAL_blast_uniref90"

# BLASTx of the assembly, nucleotide sequences against uniref90
for nucl_assembly in `ls -1 $QUERY_BLASTX/*.fasta`; do
    
    # Specifying the name of the output file from blastx
    OUT_BX="${nucl_assembly%.fasta}.blastx.uniref90.fmt6"
    
    # Blastx command using parallel to increase speed
    cat $nucl_assembly | \
    parallel -k -j 4 --block 1K --recstart '>' \
    --pipe blastx \
    -query - \
    -db $DATABASE \
    -num_threads 5 \
    -max_target_seqs 1 \
    -outfmt 6 \
    >$OUT_BX;
done

# Moving output file into output directory
mv $QUERY_BLASTX/*.fmt6 $OUTPUT_DIR

# BLASTp of the longest ORFs found with TransDecoder on uniref90
for seq_pep in `ls -1 $QUERY_BLASTP/*.fasta`; do
    
    # Specifying the name of the output file from blastx
    OUT_BP="${seq_pep%.fasta}.blastp.uniref90.fmt6"
    
    # Blastx command using parallel to increase speed
    cat $seq_pep | \
    parallel -k -j 4 --block 1K --recstart '>' \
    --pipe blastx \
    -query - \
    -db $DATABASE \
    -num_threads 5 \
    -max_target_seqs 1 \
    -outfmt 6 \
    >$OUT_BP;
done

# Moving output file into output directory
mv $QUERY_BLASTP/*.fmt6 $OUTPUT_DIR

touch 04_blast_uniref90.complete
