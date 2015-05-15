#!/bin/bash
#$ -N blastx
#$ -M francois-olivier.gagnon-hebert.1@ulaval.ca
#$ -m eas
#$ -l h_vmem=80G
#$ -l h_rt=72:00:00
#$ -pe smp 5
#$ -cwd
#$ -S /bin/bash

time ./01_scripts/02_blastx_sprot.sh
