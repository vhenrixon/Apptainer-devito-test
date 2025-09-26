#!/bin/bash
#SBATCH --job-name build-apptainer-cpu
#SBATCH --ntasks=1
#SBATCH --output=%x_%j.out

srun apptainer build devito-cpu.sif devito-cpu.def
