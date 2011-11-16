# abiS_clustering.R
# -------------------------------------------------------------------
# Copyright 2011 Christiaan Klijn <c.klijn@gmail.com>
# Project: Stakeholder data analysis Abi
# Description: do clustering analysis on the results
# -------------------------------------------------------------------

# Medoid settings
dataDir <- '~/data/smallproj/AbiAnalysis/'
codeDir <- '~/gitCodeChris/AbiStakeholder/'

# Libraries and code
library(gplots) # for heatmap.2
source(paste(codeDir, 'abiS_function.R', sep=''))

# WD
setwd(dataDir)
load(file='abi_Stake_data.Rda')

# Make numbers out of data
dataTableNum <- sapply(dataTable, as.numeric)

# remove people that answered less than 5 questions
enoughAnswers <- rowSums(!is.na(dataTableNum)) > 5
dataTableNum <- dataTableNum[enoughAnswers,]
respondentData <- respondentData[enoughAnswers,]

# Calculate dendrograms
dataDends <- calcDists(dataTableNum)

answerCols <- colorpanel(5, low='blue', mid='black', high='yellow')
st_8_cols <- rich.colors(8)

png(file="Figures/allgroupsCluster.png" , width=1000, height=1000)
  plotClusterMap(dataTableNum, dataDends, 
    rowFact=respondentData$Stakeholder)
dev.off()

png(file="Figures/smallgroupsCluster.png" , width=1000, height=1000)
  plotClusterMap(dataTableNum, dataDends, 
    rowFact=respondentData$Stakeholder_perspectives)
dev.off()

