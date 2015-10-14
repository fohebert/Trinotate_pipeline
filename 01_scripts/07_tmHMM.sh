#!/bin/bash

# GLOBAL VARIABLES
TRANSDECODER="02_transdecoder"
OUTPUT="08_tmHMM"

# Running the program
tmhmm --short < $TRANSDECODER/*.fasta > $OUTPUT/tmhmm.out
