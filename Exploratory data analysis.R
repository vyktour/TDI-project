# installing packages ----
install.packages("tidyverse")
library(tidyverse)
install.packages("tidyquant")
library("tidyquant")
install.packages("readxl")
library(readxl)
install.packages("writexl")
library(writexl)
install.packages("lubridate")
library(lubridate)
install.packages("stringr")
library(stringr)
install.packages("forcats")
library(forcats)
install.packages("fs")
library(fs)
install.packages("plotly") 
library(plotly)
install.packages("skimr")
library(skimr)


# Creating Folder Structures ----

folder <- c("00_Data", 
            "Scripts",
            "Data Understanding", 
            "Business Understanding",
            "Modeling",
            "Evaluation",
            "Deployment")


dir_create(folder)


# Read data ----

breast_tbl <- read_csv(file = "00_Data/Breast cancer prediction data.csv")
breast_tbl %>% glimpse()
breast_tbl %>% skim()

# Clean data ----

breast_tbl <- breast_tbl %>% 
  select(-id) %>%
  mutate_if(is.character, as.factor) %>% 
  mutate(diagnosis = case_when(
         diagnosis == "M" ~ "Malignant",
         TRUE ~ "Benign"))


# Explore data ----

breast_tbl %>% 
  count(diagnosis) %>% 
  ggplot(aes(diagnosis, n, fill = diagnosis)) + 
  geom_col() + 
  geom_text(aes(label = n)) +
  theme_tq() +
  scale_fill_tq() +
  labs(y = "count",
        title = "Breast Cancer Diagnosis Count")


breast_tbl %>% 
  ggplot(aes(radius_mean, texture_mean, color = diagnosis)) +
  geom_point() +
  theme_tq() +
  scale_fill_tq()

  
 


        






  
  
  
  
  
  
  
  
  













































































































































