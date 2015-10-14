#!/bin/bash

# GLOBAL VARIABLES
TRINOTATE="/home/fogah/prg/Trinotate-2.0.2"
RNAMMER="/home/fogah/prg/rnammer_1.2/rnammer"
TRANSCRIPTOME="00_raw_data"
OUTPUT="09_rnammer"

# Running the program
$TRINOTATE/util/rnammer_support/RnammerTranscriptome.pl --transcriptome $TRANSCRIPTOME/*.fasta --path_to_rnammer $RNAMMER

# Cleaning
rm tmp.superscaff.rnammer.gff
mv *.gff $OUTPUT
mv *.bed *.fasta $OUTPUT
