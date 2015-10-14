#!/bin/bash
#$ -N rnammer
#$ -M francois-olivier.gagnon-hebert.1@ulaval.ca
#$ -m eas
#$ -pe smp 1
#$ -l h_vmem=2G
#$ -l h_rt=10:00:00
#$ -cwd
#$ -S /bin/bash

time 01_scripts/08_rnammer.sh
