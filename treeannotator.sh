#!/bin/bash 
# Slurm script input variables 
#SBATCH --account=def-qingrunz-ab 
#SBATCH --job-name=simulation_1_treeannotator 
#SBATCH --chdir=/scratch/dhyang/simulation_long/ 
#SBATCH --error=simulation_1_treeannotator.error 
#SBATCH --output=simulation_1_treeannotator.out 
#SBATCH --mem=210G 
#SBATCH --nodes=1 
#SBATCH --ntasks=1 
#SBATCH --cpus-per-task=10 
#SBATCH --time=2-00:00:00 
echo "==============" 
echo "running logcombiner" 
echo "==============" 
start=$SECONDS  
module load beast/2.6.2 
/scratch/dhyang/software/beast/bin/./treeannotator -lowMem -heights ca -burnin 10 simulation_1_combined.trees simulation_1_combined_ta.tree 
end=$SECONDS 
echo "duration: $((end-start)) seconds." 
