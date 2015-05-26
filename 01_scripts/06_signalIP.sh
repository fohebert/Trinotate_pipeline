#!/bin/bash

# GLOBAL VARIABLES
OUT_DIR='07_signalIP'
TRANSDECODER='02_transdecoder/*.fasta'

# Predicting signal peptides using the ORFs found with TransDecoder
signalp -f short -n $OUT_DIR/signalp.out $TRANSDECODER
