#Import data
sim_1 = read.table("simulation_set_one.txt", sep='\t', header=TRUE)
sim_1_point = read.table("simulation_set_one_o.txt", sep='\t', header=TRUE)
sim_2 = read.table("simulation_set_two.txt", sep='\t', header=TRUE)
sim_2_point = read.table("simulation_set_two_o.txt", sep='\t', header=TRUE)

#sim_1$sample = as.factor(sim_1$sample)
head(sim_1)

#violin plot
library(ggplot2)

#rateAC
p <- ggplot(sim_1, aes(x=sample, y=rateAC)) + 
  geom_violin(trim=FALSE) +
  geom_point(aes(x='parallel', y=sim_1_point$rateAC[sim_1_point$sample == 'sequential'], color='sequential'), size = 2, show.legend = TRUE) +
  geom_point(aes(x='parallel', y=sim_1_point$rateAC[sim_1_point$sample == 'combined'], color = 'Combined'), size = 2, show.legend = TRUE) +
  geom_hline(aes(yintercept = sim_1_point$rateAC[sim_1_point$sample == "standard"], color = 'Standard'), linetype=2, show.legend = TRUE) +
  scale_color_manual(name='sample group',
                     labels=c('Sequential', 'Combined', 'Standard'),
                     breaks=c('sequential', 'Combined', 'Standard'),
                     values=c('sequential'='red', 'Combined'='blue', 'Standard'='black')) +
  scale_linetype_manual('sample group', 
                        breaks=c('sequential', 'Combined', 'Standard'), 
                        values=c('sequential' = 0, 'Combined' = 0, 'Standard'=2)) + 
  scale_shape_manual('sample group', 
                     breaks=c('sequential', 'Combined', 'Standard'), 
                     values=c('sequential' = 16, 'Combined' = 16, 'Standard'= NA)) +
  guides(color = guide_legend(override.aes = list(shape = c(16,16,NA)))) + 
  theme_bw() 

ggsave("simulation_one_rateAC.pdf", plot = p, device = "pdf")

p2 <- ggplot(sim_2, aes(x=sample, y=rateAC)) + 
  geom_violin(trim=FALSE) +
  geom_point(aes(x='parallel', y=sim_2_point$rateAC[sim_2_point$sample == 'sequential'], color='sequential'), size = 2, show.legend = TRUE) +
  geom_point(aes(x='parallel', y=sim_2_point$rateAC[sim_2_point$sample == 'combined'], color = 'Combined'), size = 2, show.legend = TRUE) +
  geom_hline(aes(yintercept = sim_2_point$rateAC[sim_2_point$sample == "standard"], color = 'Standard'), linetype=2, show.legend = TRUE) +
  scale_color_manual(name='sample group',
                     labels=c('Sequential', 'Combined', 'Standard'),
                     breaks=c('sequential', 'Combined', 'Standard'),
                     values=c('sequential'='red', 'Combined'='blue', 'Standard'='black')) +
  scale_linetype_manual('sample group', 
                        breaks=c('sequential', 'Combined', 'Standard'), 
                        values=c('sequential' = 0, 'Combined' = 0, 'Standard'=2)) + 
  scale_shape_manual('sample group', 
                     breaks=c('sequential', 'Combined', 'Standard'), 
                     values=c('sequential' = 16, 'Combined' = 16, 'Standard'= NA)) +
  guides(color = guide_legend(override.aes = list(shape = c(16,16,NA)))) + 
  theme_bw() 

ggsave("simulation_two_rateAC.pdf", plot = p2, device = "pdf")


#rateAG
p <- ggplot(sim_1, aes(x=sample, y=rateAG)) + 
  geom_violin(trim=FALSE) +
  geom_point(aes(x='parallel', y=sim_1_point$rateAG[sim_1_point$sample == 'sequential'], color='sequential'), size = 2, show.legend = TRUE) +
  geom_point(aes(x='parallel', y=sim_1_point$rateAG[sim_1_point$sample == 'combined'], color = 'Combined'), size = 2, show.legend = TRUE) +
  geom_hline(aes(yintercept = sim_1_point$rateAG[sim_1_point$sample == "standard"], color = 'Standard'), linetype=2, show.legend = TRUE) +
  scale_color_manual(name='sample group',
                     labels=c('Sequential', 'Combined', 'Standard'),
                     breaks=c('sequential', 'Combined', 'Standard'),
                     values=c('sequential'='red', 'Combined'='blue', 'Standard'='black')) +
  scale_linetype_manual('sample group', 
                        breaks=c('sequential', 'Combined', 'Standard'), 
                        values=c('sequential' = 0, 'Combined' = 0, 'Standard'=2)) + 
  scale_shape_manual('sample group', 
                     breaks=c('sequential', 'Combined', 'Standard'), 
                     values=c('sequential' = 16, 'Combined' = 16, 'Standard'= NA)) +
  guides(color = guide_legend(override.aes = list(shape = c(16,16,NA)))) + 
  theme_bw() 

ggsave("simulation_one_rateAG.pdf", plot = p, device = "pdf")

p2 <- ggplot(sim_2, aes(x=sample, y=rateAG)) + 
  geom_violin(trim=FALSE) +
  geom_point(aes(x='parallel', y=sim_2_point$rateAG[sim_2_point$sample == 'sequential'], color='sequential'), size = 2, show.legend = TRUE) +
  geom_point(aes(x='parallel', y=sim_2_point$rateAG[sim_2_point$sample == 'combined'], color = 'Combined'), size = 2, show.legend = TRUE) +
  geom_hline(aes(yintercept = sim_2_point$rateAG[sim_2_point$sample == "standard"], color = 'Standard'), linetype=2, show.legend = TRUE) +
  scale_color_manual(name='sample group',
                     labels=c('Sequential', 'Combined', 'Standard'),
                     breaks=c('sequential', 'Combined', 'Standard'),
                     values=c('sequential'='red', 'Combined'='blue', 'Standard'='black')) +
  scale_linetype_manual('sample group', 
                        breaks=c('sequential', 'Combined', 'Standard'), 
                        values=c('sequential' = 0, 'Combined' = 0, 'Standard'=2)) + 
  scale_shape_manual('sample group', 
                     breaks=c('sequential', 'Combined', 'Standard'), 
                     values=c('sequential' = 16, 'Combined' = 16, 'Standard'= NA)) +
  guides(color = guide_legend(override.aes = list(shape = c(16,16,NA)))) + 
  theme_bw()

ggsave("simulation_two_rateAG.pdf", plot = p2, device = "pdf")


#rateAT
p <- ggplot(sim_1, aes(x=sample, y=rateAT)) + 
  geom_violin(trim=FALSE) +
  geom_point(aes(x='parallel', y=sim_1_point$rateAT[sim_1_point$sample == 'sequential'], color='sequential'), size = 2, show.legend = TRUE) +
  geom_point(aes(x='parallel', y=sim_1_point$rateAT[sim_1_point$sample == 'combined'], color = 'Combined'), size = 2, show.legend = TRUE) +
  geom_hline(aes(yintercept = sim_1_point$rateAT[sim_1_point$sample == "standard"], color = 'Standard'), linetype=2, show.legend = TRUE) +
  scale_color_manual(name='sample group',
                     labels=c('Sequential', 'Combined', 'Standard'),
                     breaks=c('sequential', 'Combined', 'Standard'),
                     values=c('sequential'='red', 'Combined'='blue', 'Standard'='black')) +
  scale_linetype_manual('sample group', 
                        breaks=c('sequential', 'Combined', 'Standard'), 
                        values=c('sequential' = 0, 'Combined' = 0, 'Standard'=2)) + 
  scale_shape_manual('sample group', 
                     breaks=c('sequential', 'Combined', 'Standard'), 
                     values=c('sequential' = 16, 'Combined' = 16, 'Standard'= NA)) +
  guides(color = guide_legend(override.aes = list(shape = c(16,16,NA)))) + 
  theme_bw() 

ggsave("simulation_one_rateAT.pdf", plot = p, device = "pdf")

p2 <- ggplot(sim_2, aes(x=sample, y=rateAT)) + 
  geom_violin(trim=FALSE) +
  geom_point(aes(x='parallel', y=sim_2_point$rateAT[sim_2_point$sample == 'sequential'], color='sequential'), size = 2, show.legend = TRUE) +
  geom_point(aes(x='parallel', y=sim_2_point$rateAT[sim_2_point$sample == 'combined'], color = 'Combined'), size = 2, show.legend = TRUE) +
  geom_hline(aes(yintercept = sim_2_point$rateAT[sim_2_point$sample == "standard"], color = 'Standard'), linetype=2, show.legend = TRUE) +
  scale_color_manual(name='sample group',
                     labels=c('Sequential', 'Combined', 'Standard'),
                     breaks=c('sequential', 'Combined', 'Standard'),
                     values=c('sequential'='red', 'Combined'='blue', 'Standard'='black')) +
  scale_linetype_manual('sample group', 
                        breaks=c('sequential', 'Combined', 'Standard'), 
                        values=c('sequential' = 0, 'Combined' = 0, 'Standard'=2)) + 
  scale_shape_manual('sample group', 
                     breaks=c('sequential', 'Combined', 'Standard'), 
                     values=c('sequential' = 16, 'Combined' = 16, 'Standard'= NA)) +
  guides(color = guide_legend(override.aes = list(shape = c(16,16,NA)))) + 
  theme_bw()

ggsave("simulation_two_rateAT.pdf", plot = p2, device = "pdf")


#RATECG
p <- ggplot(sim_1, aes(x=sample, y=rateCG)) + 
  geom_violin(trim=FALSE) +
  geom_point(aes(x='parallel', y=sim_1_point$rateCG[sim_1_point$sample == 'sequential'], color='sequential'), size = 2, show.legend = TRUE) +
  geom_point(aes(x='parallel', y=sim_1_point$rateCG[sim_1_point$sample == 'combined'], color = 'Combined'), size = 2, show.legend = TRUE) +
  geom_hline(aes(yintercept = sim_1_point$rateCG[sim_1_point$sample == "standard"], color = 'Standard'), linetype=2, show.legend = TRUE) +
  scale_color_manual(name='sample group',
                     labels=c('Sequential', 'Combined', 'Standard'),
                     breaks=c('sequential', 'Combined', 'Standard'),
                     values=c('sequential'='red', 'Combined'='blue', 'Standard'='black')) +
  scale_linetype_manual('sample group', 
                        breaks=c('sequential', 'Combined', 'Standard'), 
                        values=c('sequential' = 0, 'Combined' = 0, 'Standard'=2)) + 
  scale_shape_manual('sample group', 
                     breaks=c('sequential', 'Combined', 'Standard'), 
                     values=c('sequential' = 16, 'Combined' = 16, 'Standard'= NA)) +
  guides(color = guide_legend(override.aes = list(shape = c(16,16,NA)))) + 
  theme_bw() 

ggsave("simulation_one_rateCG.pdf", plot = p, device = "pdf")

p2 <- ggplot(sim_2, aes(x=sample, y=rateCG)) + 
  geom_violin(trim=FALSE) +
  geom_point(aes(x='parallel', y=sim_2_point$rateCG[sim_2_point$sample == 'sequential'], color='sequential'), size = 2, show.legend = TRUE) +
  geom_point(aes(x='parallel', y=sim_2_point$rateCG[sim_2_point$sample == 'combined'], color = 'Combined'), size = 2, show.legend = TRUE) +
  geom_hline(aes(yintercept = sim_2_point$rateCG[sim_2_point$sample == "standard"], color = 'Standard'), linetype=2, show.legend = TRUE) +
  scale_color_manual(name='sample group',
                     labels=c('Sequential', 'Combined', 'Standard'),
                     breaks=c('sequential', 'Combined', 'Standard'),
                     values=c('sequential'='red', 'Combined'='blue', 'Standard'='black')) +
  scale_linetype_manual('sample group', 
                        breaks=c('sequential', 'Combined', 'Standard'), 
                        values=c('sequential' = 0, 'Combined' = 0, 'Standard'=2)) + 
  scale_shape_manual('sample group', 
                     breaks=c('sequential', 'Combined', 'Standard'), 
                     values=c('sequential' = 16, 'Combined' = 16, 'Standard'= NA)) +
  guides(color = guide_legend(override.aes = list(shape = c(16,16,NA)))) + 
  theme_bw()

ggsave("simulation_two_rateCG.pdf", plot = p2, device = "pdf")


#rateGT
p <- ggplot(sim_1, aes(x=sample, y=rateGT)) + 
  geom_violin(trim=FALSE) +
  geom_point(aes(x='parallel', y=sim_1_point$rateGT[sim_1_point$sample == 'sequential'], color='sequential'), size = 2, show.legend = TRUE) +
  geom_point(aes(x='parallel', y=sim_1_point$rateGT[sim_1_point$sample == 'combined'], color = 'Combined'), size = 2, show.legend = TRUE) +
  geom_hline(aes(yintercept = sim_1_point$rateGT[sim_1_point$sample == "standard"], color = 'Standard'), linetype=2, show.legend = TRUE) +
  scale_color_manual(name='sample group',
                     labels=c('Sequential', 'Combined', 'Standard'),
                     breaks=c('sequential', 'Combined', 'Standard'),
                     values=c('sequential'='red', 'Combined'='blue', 'Standard'='black')) +
  scale_linetype_manual('sample group', 
                        breaks=c('sequential', 'Combined', 'Standard'), 
                        values=c('sequential' = 0, 'Combined' = 0, 'Standard'=2)) + 
  scale_shape_manual('sample group', 
                     breaks=c('sequential', 'Combined', 'Standard'), 
                     values=c('sequential' = 16, 'Combined' = 16, 'Standard'= NA)) +
  guides(color = guide_legend(override.aes = list(shape = c(16,16,NA)))) + 
  theme_bw() 

ggsave("simulation_one_rateGT.pdf", plot = p, device = "pdf")

p2 <- ggplot(sim_2, aes(x=sample, y=rateGT)) + 
  geom_violin(trim=FALSE) +
  geom_point(aes(x='parallel', y=sim_2_point$rateGT[sim_2_point$sample == 'sequential'], color='sequential'), size = 2, show.legend = TRUE) +
  geom_point(aes(x='parallel', y=sim_2_point$rateGT[sim_2_point$sample == 'combined'], color = 'Combined'), size = 2, show.legend = TRUE) +
  geom_hline(aes(yintercept = sim_2_point$rateGT[sim_2_point$sample == "standard"], color = 'Standard'), linetype=2, show.legend = TRUE) +
  scale_color_manual(name='sample group',
                     labels=c('Sequential', 'Combined', 'Standard'),
                     breaks=c('sequential', 'Combined', 'Standard'),
                     values=c('sequential'='red', 'Combined'='blue', 'Standard'='black')) +
  scale_linetype_manual('sample group', 
                        breaks=c('sequential', 'Combined', 'Standard'), 
                        values=c('sequential' = 0, 'Combined' = 0, 'Standard'=2)) + 
  scale_shape_manual('sample group', 
                     breaks=c('sequential', 'Combined', 'Standard'), 
                     values=c('sequential' = 16, 'Combined' = 16, 'Standard'= NA)) +
  guides(color = guide_legend(override.aes = list(shape = c(16,16,NA)))) + 
  theme_bw()

ggsave("simulation_two_rateGT.pdf", plot = p2, device = "pdf")


#GAMMASHAPE
p <- ggplot(sim_1, aes(x=sample, y=gammaShape)) + 
  geom_violin(trim=FALSE) +
  geom_point(aes(x='parallel', y=sim_1_point$gammaShape[sim_1_point$sample == 'sequential'], color='sequential'), size = 2, show.legend = TRUE) +
  geom_point(aes(x='parallel', y=sim_1_point$gammaShape[sim_1_point$sample == 'combined'], color = 'Combined'), size = 2, show.legend = TRUE) +
  geom_hline(aes(yintercept = sim_1_point$gammaShape[sim_1_point$sample == "standard"], color = 'Standard'), linetype=2, show.legend = TRUE) +
  scale_color_manual(name='sample group',
                     labels=c('Sequential', 'Combined', 'Standard'),
                     breaks=c('sequential', 'Combined', 'Standard'),
                     values=c('sequential'='red', 'Combined'='blue', 'Standard'='black')) +
  scale_linetype_manual('sample group', 
                        breaks=c('sequential', 'Combined', 'Standard'), 
                        values=c('sequential' = 0, 'Combined' = 0, 'Standard'=2)) + 
  scale_shape_manual('sample group', 
                     breaks=c('sequential', 'Combined', 'Standard'), 
                     values=c('sequential' = 16, 'Combined' = 16, 'Standard'= NA)) +
  guides(color = guide_legend(override.aes = list(shape = c(16,16,NA)))) + 
  theme_bw() 

ggsave("simulation_one_gamma.pdf", plot = p, device = "pdf")

p2 <- ggplot(sim_2, aes(x=sample, y=gammaShape)) + 
  geom_violin(trim=FALSE) +
  geom_point(aes(x='parallel', y=sim_2_point$gammaShape[sim_2_point$sample == 'sequential'], color='sequential'), size = 2, show.legend = TRUE) +
  geom_point(aes(x='parallel', y=sim_2_point$gammaShape[sim_2_point$sample == 'combined'], color = 'Combined'), size = 2, show.legend = TRUE) +
  geom_hline(aes(yintercept = sim_2_point$gammaShape[sim_2_point$sample == "standard"], color = 'Standard'), linetype=2, show.legend = TRUE) +
  scale_color_manual(name='sample group',
                     labels=c('Sequential', 'Combined', 'Standard'),
                     breaks=c('sequential', 'Combined', 'Standard'),
                     values=c('sequential'='red', 'Combined'='blue', 'Standard'='black')) +
  scale_linetype_manual('sample group', 
                        breaks=c('sequential', 'Combined', 'Standard'), 
                        values=c('sequential' = 0, 'Combined' = 0, 'Standard'=2)) + 
  scale_shape_manual('sample group', 
                     breaks=c('sequential', 'Combined', 'Standard'), 
                     values=c('sequential' = 16, 'Combined' = 16, 'Standard'= NA)) +
  guides(color = guide_legend(override.aes = list(shape = c(16,16,NA)))) + 
  theme_bw()

ggsave("simulation_two_gamma.pdf", plot = p2, device = "pdf")






