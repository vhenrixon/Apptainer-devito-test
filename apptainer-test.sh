#!/bin/bash
mpirun -n 4 apptainer exec \
    devito-cpu-test.sif \
    python3 /workspace/devito/benchmarks/user/benchmark.py run -P acoustic -d 20 20 20 -so 12 --tn 100
