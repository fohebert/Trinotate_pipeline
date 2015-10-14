#!/bin/bash

# GLOBAL VARIABLES
TARGET="00_raw_data"
TRANSDECODER_DIR="02_transdecoder"
OUTPUT_SUFFIX=`ls -1 $TARGET/*.fasta`
FILE_NAME=`ls -1 $TARGET/*.fasta | sed 's/00_raw_data\///g' | sed 's/\.fasta//g'`

# Using TransDecoder to find the longest ORFs
for file in `ls -1 $TARGET/*.fasta`; do
    /home/fogah/prg/TransDecoder-2.0.1/TransDecoder.LongOrfs -t $file;
done

# Rename and move output file for further processing
mv $OUTPUT_SUFFIX.transdecoder_dir/ $TRANSDECODER_DIR
mv $TRANSDECODER_DIR/$OUTPUT_SUFFIX.transdecoder_dir/longest_orfs.pep $TRANSDECODER_DIR/$FILE_NAME.TransD.ORFs.pep.fasta

touch transdecoder.complete
