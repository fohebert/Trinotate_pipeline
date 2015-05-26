#!/bin/bash
#$ -N signalIP
#$ -M francois-olivier.gagnon-hebert.1@ulaval.ca
#$ -m eas
#$ -pe smp 4
#$ -l h_vmem=5G
#$ -l h_rt=24:00:00
#$ -cwd
#$ -S /bin/bash

time 01_scripts/06_signalIP.sh
