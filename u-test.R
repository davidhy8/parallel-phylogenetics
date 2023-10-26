library(dplyr)
library(data.table)

lvp_mean = read.table("simulation_one.txt", header=T, sep='\t')

# compare mean of beast runs and standard
lvp_mean_pval = lvp_mean %>% 
  summarise(quartet_pval = wilcox.test(Quartet~group, data=lvp_mean)$p.value,
            pathdifference_pval = wilcox.test(PathDiffernce~group, data=lvp_mean)$p.value,
            RF_pval = wilcox.test(RF~group, data=lvp_mean)$p.value,
            matchingsplit_pval = wilcox.test(MatchingSplit~group, data=lvp_mean)$p.value,
            UMAST_pval = wilcox.test(UMAST~group, data=lvp_mean)$p.value,
            RFweighted_pval = wilcox.test(RFWeighted~group, data=lvp_mean)$p.value,
            geounrooted_pval = wilcox.test(GeoUnrooted~group, data=lvp_mean)$p.value)

write.table(lvp_mean_pval, file="simulation_pval_one.txt", sep='\t', row.names = F)

