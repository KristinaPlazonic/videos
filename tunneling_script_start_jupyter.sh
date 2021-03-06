#!/bin/bash

#SBATCH --partition=main             # Partition (job queue)
#SBATCH --job-name=jupyter          # Assign an short name to your job
#SBATCH --nodes=1                    # Number of nodes you require
#SBATCH --ntasks=1                   # Total # of tasks across all nodes
#SBATCH --cpus-per-task=1            # Cores per task (>1 if multithread tasks)
#SBATCH --mem=4000                 # Real memory (RAM) required (MB)
#SBATCH --time=01:00:00              # Total run time limit (HH:MM:SS)
#SBATCH --output=slurm.%N.%j.out     # STDOUT output file
#SBATCH --error=slurm.%N.%j.err      # STDERR output file (optional) 

export XDG_RUNTIME_DIR=$HOME/tmp   ## needed for jupyter writting temporary files

module load python/2.7.12           # loads sytem-installed python

#run system-installed jupyter notebook on port 8889. ip 0.0.0.0 means "any ip as interface"
srun jupyter notebook --no-browser --ip=0.0.0.0 --port=8889

