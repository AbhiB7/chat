#!/bin/bash
#SBATCH --partition=a100-test
#SBATCH --nodes=1
#SBATCH --cpus-per-task=4
#SBATCH --gres=shard:1
#SBATCH --time=00:15:00
#SBATCH --job-name=test_gpu
#SBATCH --output=test_gpu_%j.out
#SBATCH --error=test_gpu_%j.err
#SBATCH --mail-type=ALL

echo "===== SLURM JOB INFO ====="
echo "Job ID:          $SLURM_JOB_ID"
echo "Partition:       $SLURM_JOB_PARTITION"
echo "Node:            $SLURM_JOB_NODELIST"
echo "CPUs:            $SLURM_CPUS_ON_NODE"
echo

echo "===== GPU INFO ====="
nvidia-smi
echo

python will_python_work.py

