# abiS_dataLoad.R
# -------------------------------------------------------------------
# Copyright 2011 Christiaan Klijn <c.klijn@gmail.com>
# Project: Stakeholder data analysis Abi
# Description: Load data from SPSS and preprocess
# -------------------------------------------------------------------

# Medoid settings
dataDir <- '~/data/smallproj/AbiAnalysis/'
codeDir <- '~/gitCodeChris/AbiStakeholder/'

# Libraries and code
library(foreign) # For read.spss

# WD
setwd(dataDir)

# ------------------------
# Start code

# Read data as a list
dataTable <- read.spss('SPSS Results 17 Oct 2011_original version.sav')
# Remove all explanation columns and the filter column 
# and convert to data.frame
dataTable <- as.data.frame(
  dataTable[!grepl('EXPL|Expl|filter', names(dataTable))],
  stringsAsFactors=F)
row.names(dataTable) <- paste('R', dataTable$Respondent_ID)

# Split respondant info and survey data
respondentColumns <- grepl(
  'Respondent_ID|Type_of_organisation|Affiliation|Stakeholder', 
  colnames(dataTable))
respondentData <- dataTable[,respondentColumns]
dataTable <- dataTable[,!respondentColumns]

# Save the data and the respondent info

save(file='abi_Stake_data.Rda', list=c('dataTable', 'respondentData'))
