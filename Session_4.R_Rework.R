# 1. Set up your project by loading your packages, e.g.:
library(package)

# 2. Set the working directory and load the data, e.g.:
# Project path reproducibility
file_path <- here::here() # I used the path suggestion here to help with functionality
data <- read.delim("data.csv", header = TRUE, sep = ",")

# 3. Make variables ready to work on, e.g.:
data <- data %>%
  select(ppID, condition, trial, RT) %>%
  mutate(condition = as.factor(condition), target = as.factor(target))
data <- na.omit(data)

# 4. Explore data, e.g.:
summary(data)

# 5. Analysis (can be a simple analysis), e.g. a one-way ANOVA, within-subjects:
anovaRTbycategory <- aov(RT ~category+error(ppID/category), data = analysis_anova)
summary(anovaRTbycategory)