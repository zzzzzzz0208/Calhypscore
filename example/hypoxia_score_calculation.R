
library(CalHypscore)
setwd(wd)
load('Hypoxia.Sig.Rdata')
load('bulkExpMatrix.Rdata')

#load('scExpMatrix.Rdata')
#scExpMatrix <- as.matrix(scExpMatrix@assays$RNA@counts) #scRNA-seq expression profile

# Calculating the hypoxia activity score in each sample/cell, the result is a list
res <- calhypscore(ExpMatrix,Hypoxia.Sig,class='count',index = 1)
#res <- calhypscore(scExpMatrix,Hypoxia.Sig,class='count',index = 1)
save(res,file = paste0(names(Hypoxia.Sig)[1],'-result.Rdata'))

# Save results respectively
score <- as.matrix(res$ssgsea_score)
write.csv(score,paste0(names(Hypoxia.Sig)[1],'-hypoxia_score.csv'))

