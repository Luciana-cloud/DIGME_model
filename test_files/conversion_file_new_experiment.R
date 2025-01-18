# Load packages----

library(googledrive)
library(googlesheets4)
library(readxl)
library(tidyverse)
library(outliers)
library(ggpubr)
library("stringr") 
library(domir)
library(car)
library(matrixStats)
library(stats)
library(factoextra)

# Water Potential conversion for new experiment ----

# Calling data
data_GWC  = read_sheet("https://docs.google.com/spreadsheets/d/1212MkVTNet69tJDC7qWTifV18ZEOPMtyxpRoD3kENKs/edit?gid=0#gid=0")
data_BD   = read.csv("C:/luciana_datos/UCI/Project_13 (DIGME)/DIGME_model/General_data/DIGME_BD_clean.csv")
colnames(data_GWC) = c("Site","SiteCode","Treatment","Target_GWC")
VG_param  = read.csv("C:/luciana_datos/UCI/Project_13 (DIGME)/DIGME_model/output_files/DIGME_parameters_VG.csv")

# Define the conditions and replacement values
old_sites_n   = c("passogavia.it","P12","P13","GIG","Purdue.us","sgsdrt.us",
                  "Sev.mix","PNE_unburned","horacg,cr","ukulingadrt.za")

# Use replace() to replace the names in the 'Names' column
data_BD_n       = data_BD[data_BD$SiteCode %in% old_sites_n, ]
VG_param_n      = VG_param[VG_param$Site %in% old_sites_n, ]
colnames(VG_param_n)[2] = "SiteCode"

# Convert GWC to WVC
data_GWC_new = c()
for(i in old_sites_n){
  b.1  = data_GWC %>% filter(SiteCode == i)
  b.2  = data_BD_n %>% filter(SiteCode == i)
  temp = b.1 %>% mutate(BD = as.numeric(unlist(b.2$mean))) %>%
    mutate(Actual_VWC = as.numeric(unlist(b.1$Target_GWC))*as.numeric(unlist(b.2$mean))) 
  data_GWC_new = rbind(data_GWC_new, temp) 
}

# Convert WVC to WP
data_GWC_new.1 = c()
for(i in old_sites_n){
  d.1    = data_GWC_new %>% filter(SiteCode == i)
  d.2    = VG_param_n %>% filter(SiteCode == i)
  temp.1 = d.1 %>% mutate(theta = (as.numeric(unlist(d.1$Actual_VWC)) - d.2$theta_r)/(d.2$theta_s - d.2$theta_r)) %>%
    mutate(m = rep(1 - 1/d.2$n,each=nrow(d.1)))
  temp.2 = temp.1 %>% mutate(m_1 = 1/temp.1$m) %>% 
    mutate(n_1 = rep(1/d.2$n,each=nrow(d.1))) %>%
    mutate(alpha_1 = rep(1/d.2$alpha,each=nrow(d.1)))
  temp.3 = temp.2 %>% mutate(ActualWP = temp.2$alpha_1*((1/(temp.2$theta)^temp.2$m_1)-1)^temp.2$n_1) 
  data_GWC_new.1 = rbind(data_GWC_new.1, temp.3) 
}

write.csv(data_GWC_new.1, file = "C:/luciana_datos/UCI/Project_13 (DIGME)/DIGME_model/output_files/DIGME_new_experiment.csv")
# Writing in google drive
sheet_write(data_GWC_new.1,
            ss = "https://docs.google.com/spreadsheets/d/146XwlpQTggwD8AgS84J9aOEX-72sx52TrVt9yoNKnYQ/edit?gid=0#gid=0",
            sheet = "DIGME_new_experiment")