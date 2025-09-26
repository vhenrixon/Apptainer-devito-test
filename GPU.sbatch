#!/bin/bash
#SBATCH --job-name apptainer-gpu-test
#SBATCH -N 4
#SBATCH --output=%x_%j.out

module load openmpi
module load hpcx

export MPI_DIR="/usr/lib/x86_64-linux-gnu/openmpi"  # Adjust to your host's MPI path
apptainer exec --writable-tmpfs --bind "$MPI_DIR" devito-test.sif \
    bash -c '
    source /opt/venv/bin/activate
    pip --no-cache-dir install mpi4py
    '
apptainer exec --bind "$MPI_DIR" devito-test.sif echo $MPI_DIR
mpirun -n 4  apptainer exec --bind "$MPI_DIR" devito-test.sif \
    bash -c '
    source /opt/venv/bin/activate
    python3 /workspace/devito/benchmarks/user/benchmark.py run -P acoustic -d 20 20 20 -so 12 --tn 100
    ' 