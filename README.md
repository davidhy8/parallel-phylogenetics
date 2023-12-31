# parallel-phylogenetics
In this project, we propose a parallelized MCMC phylogenetic method involving the software BEAST2 that greatly reduces computational run-times. We demonstrated the validity of our methods by performing phylogenetic analyses on two sets of simulation data and one set of real-world SARS-CoV-2 data. To aid our understanding, we employed various distance metrics and statistical tests to assess output phylogenetic trees and MCMC predicted parameters. Our results suggested that parallelization of MCMC in Bayesian phylogenetic analyses drastically reduced run-times by 28 times without causing significant deviations in parameter estimates and predicted phylogenetic trees. 
This github repository will demonstrate the scripts used in various steps of the project. 

## Preparation of simulation data
HIV1 B-DNA-POL-LITTLE simulation data was generated via the software Framework for viral Transmission and Evolution Simulation (FAVITES) using the configuration file HIV_FAVITES_ART_0.125x found on FAVITES with minor modifications. Notably, this evolution configuration utilizes a GTR gamma sequence evolution model and a “VirusTreeSimulator” node evolution model. 
In the first set of simulation data, 10 samples of 1000 FASTA sequences along with their corresponding phylogenetic trees were generated with perfect sequence sampling. In the second set of simulation data, 10 samples of 1000 FASTA sequences along with their corresponding phylogenetic trees were generated with 10% sequence sampling. A 10% sampling rate was selected as studies from the United Kingdom reporting similar sampling rates for COVID-19.

The configuration files used to create the simulation data were:
1. *HIV_FAVITES_BA_EXPECTEDDEGREE_02_ART_0.125x_CONFIG.json* for the simulation dataset with perfect sampling, and
2. *CONFIG_10percent_sampling.json* for the simulation dataset with 10% sampling rate.

For more information on how to use FAVITES please visit https://github.com/niemasd/FAVITES.

## Preparation of SARS-CoV-2 data
A total of six 1000 FASTA sequence subsamples were obtained from GISAID’s SARS-CoV-2 database using random and weighted sampling from SARS-CoV-2 sequences between the dates of February 1st, 2020, to October 31st, 2020 that were available on GISAID as of March 1st, 2021. Random sampling was performed using the Software Augur (augur filter) from NextStrain on the FASTA file and associated metadata obtained from GISAID on March 1st, 2021(13). The following parameters were used: --min-date 2020-02-01 --max-date 2020-10-31 –subsample-max-sequences 1000.  
The following steps were performed to determine the number of desired sequences to be sampled from each region and month in weighted sampling. First, the number of sequences to be obtained from each month globally (monthly sequencing allowance) was determined based on the proportion of SARS-CoV- 2 infections that occurred in each month out of all months. Next, the number of sequences to be obtained from each country in each month was determined based on the proportion of SARS-CoV- 2 infections that occurred in each country out of all countries during each respective month. The proportion of infections in each country was then multiplied by the monthly sequencing allowance to ensure that the number of sequences obtained in each month and country was proportional to their respective infection proportions. In total, 25,000 sequences were obtained. The number of SARS-CoV-2 infections during each month and in each country was estimated using the IHME epidemiological model. Using the following strategy, a CSV file containing the number of sequences to be obtained from each region and month was generated and fed into the software Nybbler which allows this weighted sampling strategy to be performed on sequencing data and its associated metadata. 

The Nybbler Github repository is found at the following link: https://github.com/nodrogluap/nybbler.

## Creating phylogenetic trees (TransCOVID pipeline)
The TransCovid pipeline was used to create phylogenetic trees for the simulated HIV and SARS-CoV-2 sequence subsamples which can be found at https://github.com/theLongLab/TransCOVID.

In the pipeline, multiple sequence alignment was performed on all sequence subsamples using Multiple Alignment using Fast Fourier Transform (MAFFT) for nucleotides.

Next, BEAUTi from the BEAST2 software package was used to set-up the parameters used in the phylogenetic analyses. In the analysis the following configurations were used:
- tip dates were activated,
- the Generalized Time Reversible (GTR) site model with a gamma category count of 4 was used,
- the relaxed log normal clock model and the Birth Death Skyline Serial model was used as a prior
- tracelog file name: $(filebase).log
- treelog file name: $(filebase).trees

Parallelized phylogenetic analyses were run with MCMC chain lengths of 100 million for 29 separate runs for each sample with BEAST2 and sequential runs were run for MCMC chains of around 3 billion. The BEAST2 configuration files were created for the parallel run by copying the original 100 million iteration run into 29 separate files. This was performed on Unix:
> for i in {1..30}; do; cp file.xml file_$i.xml; done

A sample xml file for the parallel run and sequential run are included:
1. Sample xml file from parallel run: *parallel.xml*
2. Sample xml file from sequential run: *long.xml*

The independent MCMC chains in the parallelized MCMC runs were then combined afterwards via LogCombiner. All corresponding tree and log output files were then resampled with LogCombiner from BEAST2 with a resample frequency of 5000. Finally, maximum clade likelihood phylogenetic trees were extracted with TreeAnnotator from BEAST2 using common ancestor node heights and a 10% burn in. Trace file outputs from MCMC phylogenetic analyses were summarized using LogAnalyser from BEAST2. 

Sample scripts used to run BEAST2, logcombiner and treeannotator in the analysis are included. 

## Data analysis 
NEXUS trees obtained from TreeAnnotator were converted into the Newick tree file format using the software Figtree with “save all trees” selected. Distance metrics for the phylogenetic trees were calculated by using the software TreeCMP with the following argument: 
> -d qt pd rf ms um rfw gdu

The following comparisons were performed: 
1. Simulated HIV samples: comparison between parallel/sequential phylogenetic trees with FAVITES simulation tree as the reference trees, 
2. Simulated HIV samples: comparison between parallel phylogenetic trees with long phylogenetic trees as the reference trees, and
3. SARS-CoV-2 samples: comparison between the parallel phylogenetic trees with long phylogenetic trees as the reference trees. 
To test for statistical significance, the Mann-Whitney U-test was also performed on the distance metrics and MCMC parameter estimates.

The U-test was used to compare the following: 
1. Parameter estimates obtained from MCMC ran in parallel vs MCMC ran sequentially,
2. Distance metrics obtained from the comparison of sequential vs “true” MCC trees, and parallel vs “true” MCC trees in the analyses involving simulated data, and
3. Distance metrics obtained from the comparison of sequential vs parallel MCC trees in all analyses.

The two tailed student’s t-test was also performed to compare the parameters from MCMC with “true” values in the analyses involving simulated data. 

All boxplots and violin plots shown in the figures were prepared in R with the package “ggplot2” and modified using Inkscape. R scripts used to perform the U-test, t-test and create the violin plots are included.
