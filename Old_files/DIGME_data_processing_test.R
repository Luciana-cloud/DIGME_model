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

# Call data----

# All data
all.data   = read_sheet('https://docs.google.com/spreadsheets/d/19NU8o95zZpJemjIwkg-mOhpsU1-2AmxTopKd7rlro4w/edit?gid=1723848361#gid=1723848361',
                      sheet='ncsu_sites')
# %SOC per gram of soil
all.data.1 = all.data %>% mutate(SOC_prop = as.numeric(`SOM (%)`)/100/1.72)
# gram of SOC
all.data.1 = all.data.1 %>% mutate(SOC_gram = SOC_prop*as.numeric(`Core 2mm dry wt (g)`))
# Normalized CO2 per SOC in umoles SOCg-1 h-1
all.data.1 = all.data.1 %>% mutate(CO2_SOC_moles = as.numeric(`CO2 umoles total`)/
                                     SOC_gram/as.numeric(`Incubation time (h)`))
# Normalized CO2 per SOC in ug SOCg-1 h-1
PM         = 44.0098 # molecular weight of CO2
all.data.1 = all.data.1 %>% mutate(CO2_SOC_g = CO2_SOC_moles*PM)
# Select files
all.data.2 = all.data.1 %>% select("CoreUniqueID","SiteCode","RainTrt","FieldRep","CoreNum",
                                 "Sampling point","ActualWP","ActualGWC","SOC_prop",
                                 "SOC_gram","CO2_SOC_moles","CO2_SOC_g")
# Eliminate negative respiration
all.data.2 = all.data.2 %>% filter(CO2_SOC_g > 0)

# China data
china.data   = read_sheet('https://docs.google.com/spreadsheets/d/19NU8o95zZpJemjIwkg-mOhpsU1-2AmxTopKd7rlro4w/edit?gid=1723848361#gid=1723848361',
                      sheet='china_sites')
# %SOC per gram of soil
china.data.1 = china.data %>% mutate(SOC_prop = as.numeric(`SOC g/kg`)/1000)
# gram of SOC
china.data.1 = china.data.1 %>% mutate(SOC_gram = SOC_prop*as.numeric(`Core 2mm dry wt (g)`))
# Normalized CO2 in ug SOCg-1 h-1
C_PM         = 12.011 
china.data.1 = china.data.1 %>% mutate(CO2_SOC_g = as.numeric(`CO2 (μg C/g dry soil/h)`)*PM/
                                         (C_PM*SOC_prop))
# Normalized CO2 per SOC in umoles SOCg-1 h-1
china.data.1 = china.data.1 %>% mutate(CO2_SOC_moles = CO2_SOC_g/PM)
# Convert to positive WP
china.data.1 = china.data.1 %>% mutate(ActualWP = ActualWP*-1)
# Select files
china.data.2 = china.data.1 %>% select("CoreUniqueID","SiteCode","RainTrt","FieldRep","CoreNum",
                                   "Sampling point","ActualWP","ActualGWC","SOC_prop",
                                   "SOC_gram","CO2_SOC_moles","CO2_SOC_g")
# Eliminate negative respiration
china.data.2 = china.data.2 %>% filter(CO2_SOC_g > 0)

# Merge datasets
total.dataset = as.data.frame(rbind(all.data.2,china.data.2))
# Eliminate negative respiration
total.dataset = total.dataset %>% filter(CO2_SOC_g > 0)
# Eliminate WP equal to NA
total.dataset = total.dataset %>% filter(!is.na(ActualWP))
# Eliminate WP equal to NULL
total.dataset = total.dataset %>% filter(ActualWP != "NULL")

# Data preparation - Manzoni model----

# Define columns as numeric
total.dataset[7] = as.numeric(unlist(total.dataset[7]))
total.dataset[8] = as.numeric(unlist(total.dataset[8]))
# Replace all higher WP values by the threshold of 1000 Bars, assuming that we should
# not have microbial activity below 1000 bars
total.dataset$ActualWP[total.dataset$ActualWP > 1000] = 1000
# Reorganize treatments
a              = unique(total.dataset$SiteCode)
total.dataset.1 = c()
for(i in a){
  d.1    = total.dataset %>% filter(SiteCode == i&RainTrt=="Ambient")
  d.2    = total.dataset %>% filter(SiteCode == i&RainTrt=="Drought")
  temp.1 = rbind(d.1,d.2)
  total.dataset.1 = rbind(total.dataset.1, temp.1) 
}
# Get mean values
mean.dataset = total.dataset.1 %>% group_by(CoreUniqueID,SiteCode,RainTrt) %>%
  summarise(ActualWP_mean = mean(ActualWP), ActualWP_sd = sd(ActualWP),
            CO2_SOC_mean = mean(CO2_SOC_g), CO2_SOC_sd = sd(CO2_SOC_g),
            SOC_gram_mean = mean(SOC_gram), SOC_gram_sd = sd(SOC_gram))

# Reorganize treatments
a              = unique(total.dataset$SiteCode)
mean.dataset.1 = c()
for(i in a){
  d.1    = mean.dataset %>% filter(SiteCode == i&RainTrt=="Ambient")
  d.2    = mean.dataset %>% filter(SiteCode == i&RainTrt=="Drought")
  temp.1 = rbind(d.1,d.2)
  mean.dataset.1 = rbind(mean.dataset.1, temp.1) 
}
# Replacing NA CO2 values by the CV of the site and treatment
mean.dataset.1  = mean.dataset.1 %>% mutate(cv = CO2_SOC_sd/CO2_SOC_mean)
CV.total        = mean.dataset.1 %>% group_by(SiteCode,RainTrt) %>% summarise(mean.cv = mean(cv,na.rm=TRUE))  

mean.dataset.1a = c()
for(i in a){
  d.1    = mean.dataset %>% filter(SiteCode == i&RainTrt=="Ambient")
  d.2    = CV.total %>% filter(SiteCode == i&RainTrt=="Ambient")
  temp.1 = d.1 %>% mutate(CO2_SOC_sd.1 = case_when(CO2_SOC_sd = is.na(CO2_SOC_sd) ~ CO2_SOC_mean*d.2$mean.cv,
                                                     CO2_SOC_sd != is.na(CO2_SOC_sd) ~ CO2_SOC_sd))
  d.3    = mean.dataset %>% filter(SiteCode == i&RainTrt=="Drought")
  d.4    = CV.total %>% filter(SiteCode == i&RainTrt=="Drought")
  temp.2 = d.3 %>% mutate(CO2_SOC_sd.1 = case_when(CO2_SOC_sd = is.na(CO2_SOC_sd) ~ CO2_SOC_mean*d.4$mean.cv,
                                                   CO2_SOC_sd != is.na(CO2_SOC_sd) ~ CO2_SOC_sd))
  mean.dataset.1a = rbind(mean.dataset.1a, temp.1,temp.2) 
}
write.csv(apply(mean.dataset.1a,2,as.character), file = "C:/luciana_datos/UCI/Project_13 (DIGME)/DIGME_model/General_data/temp_1.csv")

# Save for matlab processing
mean.dataset.2 = mean.dataset.1a %>% ungroup() %>% select("CoreUniqueID","ActualWP_mean","CO2_SOC_mean","CO2_SOC_sd.1")
# Replace NA by NaN for Matlab
mean.dataset.2$ActualWP_mean[is.na(mean.dataset.2$ActualWP_mean)] = "NaN"
mean.dataset.2$CO2_SOC_mean[is.na(mean.dataset.2$CO2_SOC_mean)] = "NaN"
mean.dataset.2$CO2_SOC_sd.1[is.na(mean.dataset.2$CO2_SOC_sd.1)] = "NaN"

write.table(apply(mean.dataset.2,2,as.character), file = "C:/luciana_datos/UCI/Project_13 (DIGME)/DIGME_model/General_data/manzoni_new_matlab.txt", sep = "\t",
            row.names = TRUE, col.names = FALSE,quote = FALSE)

# Manzoni Model Results - Data integration into final dataset----

# Data preparation
Site                  = unique(total.dataset$SiteCode)
Site                  = rep(Site,each = 2)
RainTrt               = rep(c("Ambient","Drought"),times = length(unique(Site)))
parameters_manzoni    = read.csv("C:/luciana_datos/UCI/Project_13 (DIGME)/DIGME_model/parameters_manzoni_2.csv",dec=".")
parameters_manzoni    = as.data.frame(cbind(Site,RainTrt,parameters_manzoni))
# Remove sites with a small sample size
manzoni.data = parameters_manzoni %>% filter(sample.size > 11)
manzoni.data = manzoni.data %>%  mutate(performance = case_when(p.value >= 0.1 ~ 0,
                                                                p.value <  0.1 ~ 1))
# Writing in google drive
sheet_write(manzoni.data,
            ss = "https://docs.google.com/spreadsheets/d/1TN1pwmu-6R0vcZnhtK4jgHHUzRM2aqupMGe0q38Zmj0/edit?gid=0#gid=0",
            sheet = "parameters_manzoni")

# Test Modeling for Alpha parameter from the Manzoni model
DIGME.global = read_sheet("https://docs.google.com/spreadsheets/d/1-titdIlsnAxbvEBEXigrkR-NxJ7kpzwHltooif1q-N0/edit?gid=1731551625#gid=1731551625")

# Soil characteristics
DIGME.global.soil = DIGME.global %>% select(c("SiteCode","RainTrt","pH","BD","DOC",
                                              "MBC","SOM","SOC","MAP","MAP_CV_intra",
                                              "MAP_CV_inter","Seasonality_index","MAT",
                                              "Target_precip_reduc_%","Actual_precip_reduc_%",
                                              "contemporary_preciptation","Preciptation_class",
                                              "Sand","Clay","ANPP","Vegetation_type")) 

DIGME.global.final = DIGME.global.soil %>% group_by(SiteCode,RainTrt) %>% 
  summarise(mean.pH     = mean(as.numeric(unlist(pH)),na.rm = TRUE),
            mean.BD     = mean(as.numeric(unlist(BD)),na.rm = TRUE),
            mean.DOC    = mean(as.numeric(unlist(DOC)),na.rm = TRUE),
            mean.MBC    = mean(as.numeric(unlist(MBC)),na.rm = TRUE),
            mean.SOC    = mean(as.numeric(unlist(SOC)),na.rm = TRUE),
            mean.MAP    = mean(as.numeric(unlist(MAP)),na.rm = TRUE),
            mean.MAP.CV.inter = mean(as.numeric(unlist(MAP_CV_inter)),na.rm = TRUE),
            mean.MAP.CV.intra = mean(as.numeric(unlist(MAP_CV_intra)),na.rm = TRUE),
            mean.MAT    = mean(as.numeric(unlist(MAT)),na.rm = TRUE),
            mean.Target_precip_reduc    = mean(as.numeric(unlist(`Target_precip_reduc_%`)),na.rm = TRUE),
            mean.Actual_precip_reduc    = mean(as.numeric(unlist(`Actual_precip_reduc_%`)),na.rm = TRUE),
            mean_sand   = mean(as.numeric(unlist(Sand)),na.rm = TRUE),
            mean_clay   = mean(as.numeric(unlist(Clay)),na.rm = TRUE),
            mean_Seasonality_index   = mean(as.numeric(unlist(Seasonality_index)),na.rm = TRUE),
            mean_contemporary_preciptation   = mean(as.numeric(unlist(contemporary_preciptation)),na.rm = TRUE),
            mean_Preciptation_class = unique(Preciptation_class),
            mean_Vegetation_type = unique(Vegetation_type),
            mean.ANPP    = mean(as.numeric(unlist(ANPP)),na.rm = TRUE))
# Change NAN to NAs
DIGME.global.final$mean.BD[is.nan(DIGME.global.final$mean.BD)] = NA
DIGME.global.final$mean.Actual_precip_reduc[is.nan(DIGME.global.final$mean.Actual_precip_reduc)] = NA
DIGME.global.final$mean_contemporary_preciptation[is.nan(DIGME.global.final$mean_contemporary_preciptation)] = NA

# Join both datasets
names(DIGME.global.final)[names(DIGME.global.final) == 'SiteCode'] = 'Site'
manzoni.data.soil = left_join(manzoni.data,DIGME.global.final, by=c('Site',"RainTrt"))

# Writing in google drive
sheet_write(manzoni.data.soil,
            ss = "https://docs.google.com/spreadsheets/d/1xvFF0JhJjJtE9quOWzq6GgF3CbnI5ugAWBQHLLZnk9U/edit?gid=0#gid=0",
            sheet = "manzoni.data.soil")


