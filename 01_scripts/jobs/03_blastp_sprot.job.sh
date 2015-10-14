#!/bin/bash
#$ -N blastp
#$ -M francois-olivier.gagnon-hebert.1@ulaval.ca
#$ -m eas
#$ -l h_vmem=4G
#$ -l h_rt=72:00:00
#$ -pe smp 5
#$ -cwd
#$ -S /bin/bash

time ./01_scripts/03_blastp_sprot.sh
