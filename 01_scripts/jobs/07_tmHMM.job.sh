#!/bin/bash
#$ -N tmHMM
#$ -M francois-olivier.gagnon-hebert.1@ulaval.ca
#$ -m eas
#$ -pe smp 1
#$ -cwd
#$ -l h_vmem=2G
#$ -l h_rt=24:00:00
#$ -S /bin/bash

time 01_scripts/07_tmHMM.sh
