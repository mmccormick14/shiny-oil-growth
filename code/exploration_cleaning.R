library(tidyverse)
library(DataExplorer)
library(dataReporter)
library(here)
library(readxl)

#read in data
data <- read_xls(here("data", "all_years_states.xls"))

#data exploration
create_report(data)
makeDataReport(data)


