# abiS_functions.R
# -------------------------------------------------------------------
# Copyright 2011 Christiaan Klijn <c.klijn@gmail.com>
# Project: Stakeholder data analysis Abi
# Description: Functions
# -------------------------------------------------------------------

calcDists <- function(dataMat) {
  
  result <- vector(mode='list', length=2)
  names(result) <- c('dendRow', 'dendCol')

  corDistRow <- as.dist(1-cor(dataTableNum, 
    use='na.or.complete', method='spearman'))
  corDistCol <- as.dist(1-cor(t(dataTableNum), 
    use='na.or.complete', method='spearman'))
  
  # Set max distance for NA pairs (probably wrong to do this!)
  corDistRow[is.na(corDistRow)] <- 1
  corDistCol[is.na(corDistCol)] <- 1
      
  clustRow <- hclust(corDistRow)
  clustCol <- hclust(corDistCol)

  result$dendRow <- as.dendrogram(clustRow)
  result$dendCol <- as.dendrogram(clustCol)

  return(result)

}
