library(tidyverse)
library(DataExplorer)
library(dataReporter)
library(here)
library(readxl)

#data source: https://www.eia.gov/naturalgas/archive/petrosystem/petrosysog.html
#data downloaded: 20211216

#read in data
data <- read_xls(here("data", "all_years_states.xls"))

#data exploration
create_report(data)
makeDataReport(data)

#visualization of #operating oil wells in Alaska over time
wells_per_state <- data %>% 
  select(state, prod_year, num_oil_wells) %>% 
  group_by(state, prod_year) %>% 
  summarise(total_wells_operating = sum(num_oil_wells))

  ggplot(data = alaska, mapping = aes(x = prod_year, y = total_wells_operating)) +
  geom_line()
