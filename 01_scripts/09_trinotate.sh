#!/bin/bash

# GLOBAL VARIABLES
TRINOTATE="/home/fogah/prg/Trinotate-2.0.2/Trinotate"
TRINITY_UTILS="/prg/trinityrnaseq/2.0.6/util/support_scripts"
TRANSDECODER="02_transdecoder"
BLASTX="03_blastx_sprot"
BLASTP="04_blastp_sprot"
UNIREF90="05_OPTIONAL_blast_uniref90"
PFAM="06_hmmscan"
SIGNALIP="07_signalIP"
TMHMM="08_tmHMM"
RAW_DATA="00_raw_data"
OUTPUT="10_trinotate_results"

# Get gene/transcript relationships using Trinity support scripts
$TRINITY_UTILS/get_Trinity_gene_to_trans_map.pl $RAW_DATA/*.fasta >$OUTPUT/assembly.gene_trans_map

# Load transcripts and coding regions into SQlite database
$TRINOTATE $OUTPUT/Trinotate.sqlite init --gene_trans_map $OUTPUT/assembly.gene_trans_map --transcript_fasta $RAW_DATA/*.fasta --transdecoder_pep $TRANSDECODER/*.fasta

# Load protein hits
$TRINOTATE $OUTPUT/Trinotate.sqlite LOAD_swissprot_blastp $BLASTP/*.fmt6

# Load transcript hits
$TRINOTATE $OUTPUT/Trinotate.sqlite LOAD_swissprot_blastx $BLASTX/*.fmt6

####################### OPTIONAL STEP  #######################
# Load Uniref90 blast hits. Erase the "#" symbol before the 2 
# command lines down below if you want to use this optional step:

# $TRINOTATE $OUTPUT/Trinotate.sqlite LOAD_trembl_blastp $UNIREF90/*.blastp.uniref90.fmt6
# $TRINOTATE $OUTPUT/Trinotate.sqlite LOAD_trembl_blastx $UNIREF90/*.blastx.uniref90.fmt6
##############################################################

# Load Pfam domain entries
$TRINOTATE $OUTPUT/Trinotate.sqlite LOAD_pfam $PFAM/TrinotatePFAM.out

# Load transmembrane domains
# NB: this step did not work on KATAK. For an unknown reeason, it doesn't
# run properly, so this step is skipped here, but it can be used if the
# "#" symbol is erased.
# $TRINOTATE $OUTPUT/Trinotate.sqlite LOAD_tmhmm $TMHMM/tmhmm.out

# Load signal peptide predictions
$TRINOTATE $OUTPUT/Trinotate.sqlite LOAD_signalp $SIGNALIP/signalp.out

# Trinotate output and annotation report
$TRINOTATE $OUTPUT/Trinotate.sqlite report -E 0.0001 > $OUTPUT/trinotate.results.xls
