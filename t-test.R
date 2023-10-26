# parallel data missing sim 2
rateAC = c(0.191285,
           0.20091,
           0.195478,
           0.193384,
           0.197285,
           0.200735,
           0.212125,
           0.189392,
           0.207681,
           0.201268)
rateAG = c(1.14102,
           1.190402,
           1.180296,
           1.120493,
           0.961559,
           1.182132,
           1.348053,
           1.050123,
           1.41019,
           1.179504)
rateAT = c(0.077605,
           0.078139,
           0.080277,
           0.080211,
           0.072436,
           0.076427,
           0.082975,
           0.075552,
           0.092237,
           0.076672)
rateCG = c(0.100965,
           0.110801,
           0.095812,
           0.104038,
           0.094982,
           0.11275,
           0.108458,
           0.100004,
           0.1089,
           0.109126)
rateGT = c(0.118341,
           0.108773,
           0.111228,
           0.102009,
           0.088946,
           0.109121,
           0.111034,
           0.10351,
           0.123455,
           0.102475)
gammaShape = c(1.580005,
               2.518466,
               1.492906,
               1.363877,
               1.755635,
               1.959853,
               1.454552,
               2.557024,
               1.335203,
               1.830874)

# Find mean and variance
rateAC_mean = mean(rateAC)
rateAG_mean = mean(rateAG)
rateAT_mean = mean(rateAT)
rateCG_mean = mean(rateCG)
rateGT_mean = mean(rateGT)
gammaShape_mean = mean(gammaShape)

# Find percentage 
rateAC_var = var(rateAC)
rateAG_var = var(rateAG)
rateAT_var = var(rateAT)
rateCG_var = var(rateCG)
rateGT_var = var(rateGT)
gammaShape_var = var(gammaShape)

Z_AC = (0.182381713-rateAC_mean)/sqrt(rateAC_var)
Z_AG = (1-rateAG_mean)/sqrt(rateAG_var)
Z_AT = (0.072316493 - rateAT_mean)/sqrt(rateAT_var)
Z_CG= (0.097792354-rateCG_mean)/sqrt(rateCG_var)
Z_GT = (0.10066327-rateGT_mean)/sqrt(rateGT_var)
Z_gamma = (2-gammaShape_mean)/sqrt(gammaShape_var)

# Zscore test need to make changes
rateAC_pval = pnorm(0.182381713, mean = rateAC_mean, sd = sqrt(rateAC_var))
rateAG_pval = pnorm(1, mean = rateAG_mean, sd = sqrt(rateAG_var))
rateAT_pval = pnorm(0.072316493, mean = rateAT_mean, sd = sqrt(rateAT_var))
rateCG_pval = pnorm(0.097792354, mean = rateCG_mean, sd = sqrt(rateCG_var))
rateGT_pval = pnorm(0.10066327, mean = rateGT_mean, sd = sqrt(rateGT_var))
gammaShape_pval = pnorm(2, mean = gammaShape_mean, sd = sqrt(gammaShape_var))
