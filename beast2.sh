#!/bin/bash 
# Slurm script input variables 
#SBATCH --account=def-qingrunz-ab 
#SBATCH --job-name=simulation_1_beast_tree 
#SBATCH --chdir=/scratch/dhyang/simulation_long/ 
#SBATCH --error=simulation_1.error 
#SBATCH --output=simulation_1.out 
#SBATCH --gres=gpu:v100:1 
#SBATCH --mem=16G 
#SBATCH --nodes=1 
#SBATCH --ntasks=1 
#SBATCH --cpus-per-task=1 
#SBATCH --time=7-00:00:00 
echo "==============" 
echo "running " simulation_1_beast_tree
echo "==============" 
start=$SECONDS  
module load nixpkgs/16.09 
module load intel/2018.3 
module load cuda 
module load beagle-lib 
module load beast/2.6.2 
beast -beagle_info 
beast -beagle_GPU -beagle_order 1 /scratch/dhyang/xml/simulation/long/simulation_1.xml 
end=$SECONDS 
echo "duration: $((end-start)) seconds." 
