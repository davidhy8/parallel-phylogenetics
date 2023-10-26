#!/bin/bash 
# Slurm script input variables 
#SBATCH --account=def-qingrunz-ab 
#SBATCH --job-name=simulation_1_logcombiner 
#SBATCH --chdir=/scratch/dhyang/simulation_parallel/ 
#SBATCH --error=simulation_1_logcombiner.error 
#SBATCH --output=simulation_1_logcombiner.out 
#SBATCH --mem=50G 
#SBATCH --nodes=1 
#SBATCH --ntasks=1 
#SBATCH --cpus-per-task=10 
#SBATCH --time=3-00:00:00 
echo "==============" 
echo "running logcombiner" 
echo "==============" 
start=$SECONDS  
module load nixpkgs/16.09 
module load intel/2018.3 
module load beast/2.6.2 
logcombiner -log simulation_1-1.log -log simulation_1-2.log -log simulation_1-3.log -log simulation_1-4.log -log simulation_1-5.log -log simulation_1-6.log -log simulation_1-7.log -log simulation_1-8.log -log simulation_1-9.log -log simulation_1-10.log -log simulation_1-11.log -log simulation_1-12.log -log simulation_1-13.log -log simulation_1-14.log -log simulation_1-15.log -log simulation_1-16.log -log simulation_1-17.log -log simulation_1-18.log -log simulation_1-19.log -log simulation_1-20.log -log simulation_1-21.log -log simulation_1-22.log -log simulation_1-23.log -log simulation_1-24.log -log simulation_1-25.log -log simulation_1-26.log -log simulation_1-27.log -log simulation_1-28.log -log simulation_1-29.log -o simulation_1-combined.log 
logcombiner -resample 5000 -log simulation_1-1.log -log simulation_1-2.log -log simulation_1-3.log -log simulation_1-4.log -log simulation_1-5.log -log simulation_1-6.log -log simulation_1-7.log -log simulation_1-8.log -log simulation_1-9.log -log simulation_1-10.log -log simulation_1-11.log -log simulation_1-12.log -log simulation_1-13.log -log simulation_1-14.log -log simulation_1-15.log -log simulation_1-16.log -log simulation_1-17.log -log simulation_1-18.log -log simulation_1-19.log -log simulation_1-20.log -log simulation_1-21.log -log simulation_1-22.log -log simulation_1-23.log -log simulation_1-24.log -log simulation_1-25.log -log simulation_1-26.log -log simulation_1-27.log -log simulation_1-28.log -log simulation_1-29.log -o simulation_1-combined.log 
logcombiner -resample 5000 -log simulation_1-1.trees -log simulation_1-2.trees -log simulation_1-3.trees -log simulation_1-4.trees -log simulation_1-5.trees -log simulation_1-6.trees -log simulation_1-7.trees -log simulation_1-8.trees -log simulation_1-9.trees -log simulation_1-10.trees -log simulation_1-11.trees -log simulation_1-12.trees -log simulation_1-13.trees -log simulation_1-14.trees -log simulation_1-15.trees -log simulation_1-16.trees -log simulation_1-17.trees -log simulation_1-18.trees -log simulation_1-19.trees -log simulation_1-20.trees -log simulation_1-21.trees -log simulation_1-22.trees -log simulation_1-23.trees -log simulation_1-24.trees -log simulation_1-25.trees -log simulation_1-26.trees -log simulation_1-27.trees -log simulation_1-28.trees -log simulation_1-29.trees -o simulation_1-combined.trees 
end=$SECONDS 
echo "duration: $((end-start)) seconds." 
