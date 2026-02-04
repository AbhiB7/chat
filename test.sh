#!/bin/bash
#SBATCH --nodes=1
#SBATCH --cpus-per-task=4
#SBATCH --time=00:05:00
#SBATCH --job-name=hw_probe
#SBATCH --output=hw_probe_%j.out
#SBATCH --error=hw_probe_%j.err
#SBATCH --mail-type=ALL
# If you need GPUs, uncomment and adjust the next line:
# SBATCH --gpus=1

echo "===== SLURM JOB INFO ====="
echo "Job ID:          $SLURM_JOB_ID"
echo "Job name:        $SLURM_JOB_NAME"
echo "Node list:       $SLURM_JOB_NODELIST"
echo "CPUs on node:    $SLURM_CPUS_ON_NODE"
echo "CPUs per task:   $SLURM_CPUS_PER_TASK"
echo "Tasks:           $SLURM_NTASKS"
echo "Mem per node:    $SLURM_MEM_PER_NODE"
echo "Mem per CPU:     $SLURM_MEM_PER_CPU"
echo "Job GPUs:        $SLURM_JOB_GPUS"
echo

echo "===== CPU INFO (lscpu) ====="
lscpu
echo

echo "===== MEMORY INFO (free -h) ====="
free -h
echo

echo "===== GPU INFO (nvidia-smi) ====="
if command -v nvidia-smi &> /dev/null; then
    nvidia-smi --query-gpu=name,index,memory.total,memory.used --format=csv
else
    echo "nvidia-smi not found (no GPU or NVIDIA driver not installed)."
fi
