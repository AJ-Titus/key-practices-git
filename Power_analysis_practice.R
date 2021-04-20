install.packages("simr")
install.packages("pwr", dependencies = T)

# Imports
library(tidyverse)
library(pwr)
library(simr)


# Read data
data <-read.csv("SimData_SoPVoc.csv", header = T)

# Project path and set seed for reproducibility
file_path <- here::here()

#----- 1. Power analysis: simulations ------------------------------------------------####
# Setting seed number to ensure reproducibility of the results.
set.seed(1)

# all alpha levels = .05

# Conduct an initial analysis to determine how many participants are needed for a correlation of .3

pwr.r.test(n = NULL,
           r = 0.3,
           power = 0.8,
           sig.level = 0.05,
           alternative = "two.sided")

# Result: n = 84.07, These parameters demand at least 84 participants for .8 power

# Compute Pearson R from dataset
p_corr <- cor(data$meanRT, data$produce, method=("pearson"))

# Result = -.28

# Run power analysis with r = - 0.28
pwr.r.test(n = NULL,
           r = -0.28,
           power = 0.8,
           sig.level = 0.05,
           alternative = "two.sided")

# Result: n=96.97745, meaning 97 participants are need to get sufficient power at 0.8.
# This also means that having tested 100 participants, that there is a large enough smaple size.

# Given what we know about the data, we can have a directional hypothesis in a future study
pwr.r.test(n = NULL,
           r = p_corr,
           power = 0.80,
           sig.level = 0.05,
           alternative = "less")

# Result: n = 76.69, We would need 77 participants to achieve sufficient power at .8 .