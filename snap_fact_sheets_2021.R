
### LOAD IN DATA ####
# install.packages("reshape2")
library(reshape2)
library(stringr)
library(dplyr)
library(tidyr)
library(haven)
# 2nd part
library("rmarkdown")
library(knitr)
# install.packages("tufte")
# install.packages("htmltools")
library(htmltools)
# install.packages("htmlwidgets")
library(htmlwidgets)
# install.packages("sparkline")
library(ggplot2)
library(RColorBrewer)


#setwd("/Users/JParr7/Documents/Maestria - Cursos/R Databases/Senior_hunger 2")
#setwd("C:/Users/rrosso/data/frac-reports/seniors/Senior_hunger 2/Senior_hunger 2")
setwd("/Users/randy/Documents/data/frac-reports/snap-matters/output")

# Remove scientific notation
options(scipen=999)

snap <- read_dta("/Users/randy/Documents/data/acs/output/2021/state/state_snap_sums_2021_5yr.dta")

# Produce html markdown files
# in a single for loop
#  1. define subgroup
#  2. render output

# SNAP/ACS
for (id in unique(snap$state)){
  subgroup <- snap[snap$state == id,]
    render("snap_fact_sheet.Rmd", output_file = paste0('Report.', id, '.html'))
}

subgroup <- snap[snap$state == "Alabama",]
render("../code/snap_fact_sheet.Rmd", output_format = "pdf_document", 
       output_file = paste0('Report_Update_Alabama.pdf'))

# SNAP Sheets
for (id in unique(senior_hunger$State)){
  subgroup <- senior_hunger[senior_hunger$State == id,]
  subgroup.1 <- senior_hunger[which(senior_hunger$fns_reg %in% subgroup$fns_reg), ]
  render("Sen_Hunger.Rmd", output_format = "pdf_document", 
         output_file = paste0('Report.', id, '.pdf'))    
}


# SNAP Sheets Modified
for (id in unique(senior_hunger$State)){
  subgroup <- senior_hunger[senior_hunger$State == id,]
  subgroup.1 <- senior_hunger[which(senior_hunger$fns_reg %in% subgroup$fns_reg), ]
  render("Sen_Hunger_Updated.Rmd", output_format = "pdf_document", 
         output_file = paste0('Report_Upd_.', id, '.pdf'))    
}


subgroup <- senior_hunger[senior_hunger$State == "Alabama",]
subgroup.1 <- senior_hunger[which(senior_hunger$fns_reg %in% subgroup$fns_reg), ]
render("Sen_Hunger_Updated.Rmd", output_format = "pdf_document", 
       output_file = paste0('Report_Update_Alabama.pdf'))
