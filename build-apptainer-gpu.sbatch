#!/bin/bash
#SBATCH --job-name build-apptainer-gpu
#SBATCH --ntasks=1
#SBATCH --output=%x_%j.out

srun apptainer build devito-gpu.sif devito-gpu.def
