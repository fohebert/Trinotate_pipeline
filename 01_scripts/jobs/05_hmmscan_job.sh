#!/bin/bash
#$ -N hmmscan
#$ -M francois-olivier.gagnon-hebert.1@ulaval.ca
#$ -m eas
#$ -pe smp 8
#$ -l h_vmem=30G
#$ -l h_rt=24:00:00
#$ -cwd
#$ -S /bin/bash

time 01_scripts/05_hmmscan.sh
