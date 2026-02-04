#!/bin/bash
# set the number of nodes
#SBATCH --nodes=1

# number of CPU cores per task
#SBATCH --cpus-per-task=4 

# set max wallclock time
#SBATCH --time=00:01:00

# set name of job
#SBATCH --job-name=test123

# mail alert at start, end and abortion of execution
#SBATCH --mail-type=ALL

#SBATCH --output=result.out    # Output file
#SBATCH --error=result.err     # Error file

# run the application
echo "Hello, World!"
