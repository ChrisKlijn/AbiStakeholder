# abiS_clustering.R
# -------------------------------------------------------------------
# Copyright 2011 Christiaan Klijn <c.klijn@gmail.com>
# Project: Stakeholder data analysis Abi
# Description: do clustering analysis on the results
# -------------------------------------------------------------------

# Medoid settings
dataDir <- '~/data/smallproj/AbiAnalysis'
codeDit <- '~/gitCodeChris/AbiStakeholder'

# Libraries and code
library(foreign) # For read.spss
library(gplots) # for heatmap.2

# WD
setwd(dataDir)

