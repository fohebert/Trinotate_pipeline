#!/bin/bash

# GLOBAL VARIABLES
TRANSDECODER=`ls -1 02_transdecoder/*.fasta`
PFAM='/home/fogah/prg/Pfam-A.hmm'
OUT_DIR='06_hmmscan'

# Running HMMER to identify protein domains
hmmscan --cpu 8 --domtblout $OUT_DIR/TrinotatePFAM.out $PFAM $TRANSDECODER >$OUT_DIR/pfam.log
