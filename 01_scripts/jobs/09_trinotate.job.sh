#!/bin/bash
#$ -N trinotate
#$ -M francois-olivier.gagnon-hebert.1@ulaval.ca
#$ -m eas
#$ -pe smp 1
#$ -l h_vmem=30G
#$ -l h_rt=72:00:00
#$ -cwd
#$ -S /bin/bash

time 01_scripts/09_trinotate.sh
