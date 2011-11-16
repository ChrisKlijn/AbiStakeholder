# abiS_dataLoad.R
# -------------------------------------------------------------------
# Copyright 2011 Christiaan Klijn <c.klijn@gmail.com>
# Project: Stakeholder data analysis Abi
# Description: Load data from SPSS and preprocess
# -------------------------------------------------------------------

# Medoid settings
dataDir <- '~/data/smallproj/AbiAnalysis'
codeDit <- '~/gitCodeChris/AbiStakeholder'

# Libraries and code
library(foreign) # For read.spss
library(gplots) # for heatmap.2

# WD
setwd(dataDir)

# ------------------------
# Start code

# Read data as a list
dataTable <- read.spss('SPSS Results 17 Oct 2011_original version.sav')
# Remove all explanation columns and convert to data.frame
dataTable <- as.data.frame(
  dataTable[!grepl('EXPL|Expl', names(dataTable))], stringsAsFactors=F)
row.names(dataTable) <- paste('R', dataTable$Respondent_ID)

respondentColumns <- grepl(
  'Respondent_ID|Type_of_organisation|Affiliation', colnames(dataTable))
respondentData <- dataTable[,respondentColumns]
dataTable <- dataTable[,!respondentColumns]


