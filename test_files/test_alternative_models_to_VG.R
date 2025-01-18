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

# Additional tests

# Data preparation - BC (Brook-Corey model instead of Van Genuchten model)
parameters_BC    = read.csv("C:/luciana_datos/UCI/Project_13 (DIGME)/DIGME_model/General_data/parameters_BC.csv",dec=".")
parameters_BC    = as.data.frame(cbind(Site,parameters_BC))
write.csv(parameters_BC, file = "C:/luciana_datos/UCI/Project_13 (DIGME)/DIGME_model/output_files/DIGME_parameters_BC.csv")
# Writing in google drive
sheet_write(parameters_BC,
            ss = "https://docs.google.com/spreadsheets/d/1FnmhOU7qg6aYkZsfNXv8XDXCDqTctqDetmCr73fGOd4/edit?gid=0#gid=0",
            sheet = "parameters_BC")

# Conversion using BC parameters----

DIGME_data          = read.csv("C:/luciana_datos/UCI/Project_13 (DIGME)/DIGME_model/General_data/DIGME_data_intermediate.csv",dec=".")
parameters_BC       = read_sheet("https://docs.google.com/spreadsheets/d/1FnmhOU7qg6aYkZsfNXv8XDXCDqTctqDetmCr73fGOd4/edit?gid=0#gid=0")
Site                = unique(parameters_BC$Site)

DIGME_data_global.1 = c()
for(i in Site){
  d.1    = DIGME_data %>% filter(SiteCode == i)
  d.2    = parameters_BC %>% filter(Site == i)
  temp.1 = d.1 %>% mutate(theta = (d.2$theta_s - d.2$theta_r)/(as.numeric(unlist(d.1$ActualVWC)) - d.2$theta_r)) 
  temp.2 = temp.1 %>% mutate(n_1 = rep(1/d.2$n,each=nrow(d.1))) %>%
    mutate(alpha_1 = rep(1/d.2$alpha,each=nrow(d.1)))
  temp.3 = temp.2 %>% mutate(ActualWP = temp.2$alpha_1*(temp.1$theta)^temp.2$n_1) 
  DIGME_data_global.1 = rbind(DIGME_data_global.1, temp.3) 
}
# Omit NAs
DIGME_data_global.1 = DIGME_data_global.1 %>% drop_na(ActualWP)
DIGME_data_global.1 = DIGME_data_global.1 %>% drop_na(CO2_eq)

write.csv(DIGME_data_global.1, file = "C:/luciana_datos/UCI/Project_13 (DIGME)/DIGME_model/output_files/DIGME_data_global_BC.csv")
# Writing in google drive
sheet_write(DIGME_data_global.1,
            ss = "https://docs.google.com/spreadsheets/d/1KVKi0YfLUPnEynhfzTwUc6dVt16tdEDgIAfDa4R07lA/edit?gid=0#gid=0",
            sheet = "DIGME_data_global.BC")

# Manzoni Model - Data preparation----
DIGME_data_global.1 = read_sheet("https://docs.google.com/spreadsheets/d/1KVKi0YfLUPnEynhfzTwUc6dVt16tdEDgIAfDa4R07lA/edit?gid=0#gid=0")

# Replace all higher WP values by the threshold of 1000 Bars, assuming that we should
# not have microbial activity below 1000 bars
DIGME_data_global.1$ActualWP[DIGME_data_global.1$ActualWP > 1000] = 1000

# Reorganize treatments
a              = unique(DIGME_data_global.1$SiteCode)
data_manzoni.1 = c()
for(i in a){
  d.1    = DIGME_data_global.1 %>% filter(SiteCode == i&RainTrt=="Ambient")
  d.2    = DIGME_data_global.1 %>% filter(SiteCode == i&RainTrt=="Drought")
  temp.1 = rbind(d.1,d.2)
  data_manzoni.1 = rbind(data_manzoni.1, temp.1) 
}

# Complete with the mean value
data_manzoni.2 = c()
for(i in a){
  d.1     = data_manzoni.1 %>% filter(SiteCode == i&RainTrt=="Ambient")
  meam_am = mean(d.1$SOM,na.rm = TRUE)
  temp1   = d.1 %>% mutate(SOM = case_when(SOM  = is.na(SOM) ~ meam_am,
                                           SOM !=is.na(SOM)  ~ SOM)) 
  d.2     = data_manzoni.1 %>% filter(SiteCode == i&RainTrt=="Drought")
  meam_dr = mean(d.2$SOM,na.rm = TRUE)
  temp2   = d.2 %>% mutate(SOM = case_when(SOM  = is.na(SOM) ~ meam_dr,
                                           SOM !=is.na(SOM)  ~ SOM))
  temp.1  = rbind(temp1,temp2)
  data_manzoni.2 = rbind(data_manzoni.2, temp.1) 
}

# Determine soil organic carbon = SOM/1.72
data_manzoni.2 = data_manzoni.2 %>% mutate(SOC = SOM/1.72)
# Normalize CO2 flux by SOC
data_manzoni.2 = data_manzoni.2 %>% mutate(CO2_eq_norm = CO2_eq/SOC) %>% 
  mutate(CO2_w1b_norm = as.numeric(unlist(CO2_w1b))/SOC) %>% 
  mutate(CO2_w2a_norm = as.numeric(unlist(CO2_w2a))/SOC) %>%
  mutate(CO2_w2b_norm = as.numeric(unlist(CO2_w2b))/SOC)

# Obtain standard deviation of CO2 fluxes
data_manzoni.2 = data_manzoni.2 %>% mutate(CO2_sd = rowSds(as.matrix(data_manzoni.2[,c(44,45,46)]),
                                                           na.rm = TRUE))
# Omit NAs
data_manzoni.2 = data_manzoni.2 %>% drop_na(CO2_w2a_norm)

# 3Sigma rule to check for outliers for the CO2 repetitions----
# https://www.jstor.org/stable/2684253?seq=1
data_manzoni.2 = data_manzoni.2 %>% mutate(sigma_rule = CO2_eq_norm + 3*CO2_sd)
data_manzoni.3 = data_manzoni.2 %>% mutate(sigma_result.1 = case_when(CO2_w1b_norm >= sigma_rule ~ 0,
                                                                      CO2_w1b_norm <  sigma_rule ~ 1))
data_manzoni.3 = data_manzoni.3 %>% mutate(sigma_result.2 = case_when(CO2_w2a_norm >= sigma_rule ~ 0,
                                                                      CO2_w2a_norm <  sigma_rule ~ 1))
data_manzoni.3 = data_manzoni.3 %>% mutate(sigma_result.3 = case_when(CO2_w2b_norm >= sigma_rule ~ 0,
                                                                      CO2_w2b_norm <  sigma_rule ~ 1))
# 3Sigma rule to check for outliers for the SOM----
data_manzoni.4 = c()
b              = c("Ambient","Drought")
for(i in a){
  d.1    = data_manzoni.3 %>% filter(SiteCode == i&RainTrt=="Ambient")
  d.2    = data_manzoni.3 %>% filter(SiteCode == i&RainTrt=="Drought")
  sigma_val.d1 = mean(d.1$SOM) + 3*sd(d.1$SOM)
  sigma_val.d2 = mean(d.2$SOM) + 3*sd(d.2$SOM)
  d.1       = d.1 %>% mutate(sigma_SOM = case_when(SOM >= sigma_val.d1 ~ 0,
                                                   SOM <  sigma_val.d1 ~ 1))
  d.2       = d.2 %>% mutate(sigma_SOM = case_when(SOM >= sigma_val.d2 ~ 0,
                                                   SOM <  sigma_val.d2 ~ 1)) 
  temp.1 = rbind(d.1,d.2)
  data_manzoni.4 = rbind(data_manzoni.4, temp.1) 
}
# Erase zeros
data_manzoni.5 = data_manzoni.4 %>% filter(as.numeric(unlist(sigma_SOM)) > 0)
write.csv(data_manzoni.5, file = "C:/luciana_datos/UCI/Project_13 (DIGME)/DIGME_model/General_data/data_manzoni_BC.csv")

# Save for matlab processing
data_manzoni.5 = data_manzoni.5 %>% select(c("ActualVWC","ActualWP","CO2_eq_norm","CO2_sd"))
write.table(data_manzoni.5, file = "C:/luciana_datos/UCI/Project_13 (DIGME)/DIGME_model/General_data/data_manzoni_matlab_BC.txt", sep = "\t",
            row.names = TRUE, col.names = FALSE,quote = FALSE)
rm(d.1,d.2,data_manzoni,a,i,temp.1,data_manzoni.1,sigma_rule,sigma_val.d1,sigma_val.d2,b,
   meam_am,meam_dr,temp1,temp2)

# Manzoni Model Results using 1/alpha as field capacity - Plotting and conversion ----

# Data preparation
DIGME_data_global.1   = read_sheet("https://docs.google.com/spreadsheets/d/1KVKi0YfLUPnEynhfzTwUc6dVt16tdEDgIAfDa4R07lA/edit?gid=0#gid=0")
Site                  = unique(DIGME_data_global.1$SiteCode)
Site                  = rep(Site,each = 2)
RainTrt               = rep(c("Ambient","Drought"),times = length(unique(Site)))
parameters_manzoni    = read.csv("C:/luciana_datos/UCI/Project_13 (DIGME)/DIGME_model/General_data/parameters_manzoni_new.csv",dec=".")
parameters_manzoni    = as.data.frame(cbind(Site,RainTrt,parameters_manzoni))
write.csv(parameters_manzoni, file = "C:/luciana_datos/UCI/Project_13 (DIGME)/DIGME_model/output_files/DIGME_parameters_manzoni_new.csv")
# Writing in google drive
sheet_write(parameters_manzoni,
            ss = "https://docs.google.com/spreadsheets/d/1TOcf6h7epS19-OK4vtYY7LimcjH-2kqhGbt0xRy_Dfo/edit?gid=0#gid=0",
            sheet = "parameters_mazoni_alpha_fc")

# Manzoni Model Results - Plotting and conversion using VG and Manzoni model BC-WP----

# Data preparation
DIGME_data_global.1   = read_sheet("https://docs.google.com/spreadsheets/d/1KVKi0YfLUPnEynhfzTwUc6dVt16tdEDgIAfDa4R07lA/edit?gid=0#gid=0")
Site                  = unique(DIGME_data_global.1$SiteCode)
Site                  = rep(Site,each = 2)
RainTrt               = rep(c("Ambient","Drought"),times = length(unique(Site)))
parameters_manzoni    = read.csv("C:/luciana_datos/UCI/Project_13 (DIGME)/DIGME_model/General_data/parameters_manzoni_BC.csv",dec=".")
parameters_manzoni    = as.data.frame(cbind(Site,RainTrt,parameters_manzoni))
write.csv(parameters_manzoni, file = "C:/luciana_datos/UCI/Project_13 (DIGME)/DIGME_model/output_files/DIGME_parameters_manzoni_BC.csv")
# Writing in google drive
sheet_write(parameters_manzoni,
            ss = "https://docs.google.com/spreadsheets/d/1DDwsaQWmRGa-j05NySOPb71zGiyzyAQGMFhUykVCp-0/edit?gid=0#gid=0",
            sheet = "parameters_manzoni_BC")

# Manzoni Model Results - Plotting and conversion using VG and Manzoni model 2----

# Data preparation
DIGME_data_global.1   = read_sheet("https://docs.google.com/spreadsheets/d/1KVKi0YfLUPnEynhfzTwUc6dVt16tdEDgIAfDa4R07lA/edit?gid=0#gid=0")
Site                  = unique(DIGME_data_global.1$SiteCode)
Site                  = rep(Site,each = 2)
RainTrt               = rep(c("Ambient","Drought"),times = length(unique(Site)))
parameters_manzoni    = read.csv("C:/luciana_datos/UCI/Project_13 (DIGME)/DIGME_model/General_data/parameters_manzoni_2.csv",dec=".")
parameters_manzoni    = as.data.frame(cbind(Site,RainTrt,parameters_manzoni))
write.csv(parameters_manzoni, file = "C:/luciana_datos/UCI/Project_13 (DIGME)/DIGME_model/output_files/DIGME_parameters_manzoni_BC.csv")
# Writing in google drive
sheet_write(parameters_manzoni,
            ss = "https://docs.google.com/spreadsheets/d/1QcVMBo3HzNwND0A_6tHp09MGVJGq8k1LWY5BOaSHlBM/edit?gid=0#gid=0",
            sheet = "parameters_manzoni_2")

# Test Modeling for Alpha parameter from the Manzoni model with BC WP fits----
manzoni.data = read_sheet("https://docs.google.com/spreadsheets/d/1DDwsaQWmRGa-j05NySOPb71zGiyzyAQGMFhUykVCp-0/edit?gid=0#gid=0")
DIGME.global = read_sheet("https://docs.google.com/spreadsheets/d/1e67_fmEOtL2OhKC_aG6YGDMNpybHA_We3uRYxZSGq_A/edit?gid=0#gid=0")

# Remove sites with a small sample size
manzoni.data = manzoni.data %>% filter(sample.size > 11)
manzoni.data = manzoni.data %>%  mutate(performance = case_when(p.value >= 0.05 ~ 0,
                                                                p.value <  0.05 ~ 1))
# Soil characteristics
DIGME.global.soil = DIGME.global %>% select(c("SiteCode","RainTrt","pH","DOC",
                                              "MBC","SOM","MAP","MAP_CV","MAT",
                                              "Sand","Clay")) 
DIGME.global.soil = DIGME.global.soil %>% group_by(SiteCode,RainTrt) %>% 
  summarise(mean.pH     = mean(as.numeric(unlist(pH)),na.rm = TRUE),
            mean.DOC    = mean(as.numeric(unlist(DOC)),na.rm = TRUE),
            mean.MBC    = mean(as.numeric(unlist(MBC)),na.rm = TRUE),
            mean.SOM    = mean(as.numeric(unlist(SOM)),na.rm = TRUE),
            mean.MAP    = mean(as.numeric(unlist(MAP)),na.rm = TRUE),
            mean.MAP_CV = mean(as.numeric(unlist(MAP_CV)),na.rm = TRUE),
            mean.MAT    = mean(as.numeric(unlist(MAT)),na.rm = TRUE),
            mean_sand   = mean(as.numeric(unlist(Sand)),na.rm = TRUE),
            mean_clay   = mean(as.numeric(unlist(Clay)),na.rm = TRUE))

# Join both datasets
names(DIGME.global.soil)[names(DIGME.global.soil) == 'SiteCode'] <- 'Site'
manzoni.data.soil = left_join(manzoni.data,DIGME.global.soil, by=c('Site',"RainTrt"))

# Writing in google drive
sheet_write(manzoni.data.soil,
            ss = "https://docs.google.com/spreadsheets/d/1-EW40Z7Wudv1qQBa4wZFCBu68xonKDBkqokniVwRZTo/edit?gid=0#gid=0",
            sheet = "manzoni.data.soil_BC")
# Adding ANPP data
data                = read_sheet("https://docs.google.com/spreadsheets/d/1TtHcLwdtphcwGAROzgd4F_-L7l6KsohjCAENciR2OrY/edit?gid=863709267#gid=863709267")
data                = data %>% select(c("SiteCode","RainTrt","ANPP"))
manzoni.data.soil   = read_sheet("https://docs.google.com/spreadsheets/d/1-EW40Z7Wudv1qQBa4wZFCBu68xonKDBkqokniVwRZTo/edit?gid=0#gid=0")
Site                = unique(manzoni.data.soil$Site)
manzoni.data.soil.1 = c()
for(i in Site){
  d.1    = manzoni.data.soil %>% filter(Site == i&RainTrt=="Ambient")
  t.1    = data %>% filter(SiteCode == i&RainTrt=="Ambient")
  d.1    = d.1 %>% mutate(ANPP = mean(t.1$ANPP))
  d.2    = manzoni.data.soil %>% filter(Site == i&RainTrt=="Drought")
  t.2    = data %>% filter(SiteCode == i&RainTrt=="Drought")
  d.2    = d.2 %>% mutate(ANPP = mean(t.2$ANPP))
  temp.1 = rbind(d.1,d.2)
  manzoni.data.soil.1 = rbind(manzoni.data.soil.1, temp.1) 
}
# Writing in google drive
sheet_write(manzoni.data.soil.1,
            ss = "https://docs.google.com/spreadsheets/d/1-EW40Z7Wudv1qQBa4wZFCBu68xonKDBkqokniVwRZTo/edit?gid=0#gid=0",
            sheet = "manzoni.data.soil_BC")