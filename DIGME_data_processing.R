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

# Input data----
# Physicochemical description
data = read_sheet("https://docs.google.com/spreadsheets/d/1TtHcLwdtphcwGAROzgd4F_-L7l6KsohjCAENciR2OrY/edit?gid=863709267#gid=863709267")
# Water potential
WP_trt  = read_sheet("https://docs.google.com/spreadsheets/d/1yTzFDjjWzWhIGT6WMFmrT-u8JUYbfQjWOO6RqzMhSCA/edit?gid=1294384012#gid=1294384012","Sheet1")
WP_plot = read_sheet("https://docs.google.com/spreadsheets/d/1yTzFDjjWzWhIGT6WMFmrT-u8JUYbfQjWOO6RqzMhSCA/edit?gid=732363706#gid=732363706","Sheet2")

# Bulk density ----
# Test for outliers

# Determine number of outliers per site 
# Create a dataset with the mean and std for bulk density per site
data_BD   = data %>% select("SiteCode","RainTrt","BD") %>% group_by(SiteCode) %>% 
  summarise(mean = mean(as.numeric(unlist(BD)),na.rm = TRUE),sd = sd(as.numeric(unlist(BD)),na.rm = TRUE))
# Calculate the Z score to determine the outliers. Lower than -3 and higher than 3 are outliers
a         = unique(data_BD$SiteCode)
data_BD.1 = c()
for(i in a){
  b = data_BD %>% filter(SiteCode == i)
  temp = data %>% select("SiteCode","RainTrt","BD") %>% 
    filter(SiteCode == i) %>% 
    mutate(z = (as.numeric(unlist(BD))-as.numeric(b$mean))/as.numeric(b$sd))
  data_BD.1 = rbind(data_BD.1, temp) 
}
# Select values with a large or small z score
data_BD.2 = data_BD.1 %>%filter(z > -3 & z < 3)
# Determine new bulk density means without outliers
data_BD.final   = data_BD.2 %>% select("SiteCode","RainTrt","BD") %>% group_by(SiteCode) %>% 
  summarise(mean = mean(as.numeric(unlist(BD)),na.rm = TRUE),sd = sd(as.numeric(unlist(BD)),na.rm = TRUE))
# Save final file 
write.csv(data_BD.final, file = "C:/luciana_datos/UCI/Project_13 (DIGME)/DIGME_model/General_data/DIGME_BD_clean.csv")

# Particle Density----
# Test for outliers

# Determine number of outliers per site 
# Two sites do not have information of particle density. 
# I will equal the missing PD as the mean value of other sites with the same texture type
data_PD.t = data %>% group_by(USDA_class) %>% 
  summarise(mean = mean(as.numeric(unlist(PD)),na.rm = TRUE),sd = sd(as.numeric(unlist(PD)),na.rm = TRUE))
# Replace missing values with PD from sites with similar texture type - riomayo.ar = sand
data$PD[data$SiteCode == "riomayo.ar"] <- data_PD.t$mean[data_PD.t$USDA_class== "sand"]
# Replace missing values with PD from sites with similar texture type - skotsvar.no = organic
data$PD[data$SiteCode == "skotsvar.no"] <- data_PD.t$mean[data_PD.t$USDA_class== "organic"]
# Create a dataset with the mean and std for particle density per site
data_PD   = data %>% select("SiteCode","RainTrt","PD") %>% group_by(SiteCode) %>% 
  summarise(mean = mean(as.numeric(unlist(PD)),na.rm = TRUE),sd = sd(as.numeric(unlist(PD)),na.rm = TRUE))
# Calculate the Z score to determine the outliers. Lower than -3 and higher than 3 are outliers
a         = unique(data_PD$SiteCode)
data_PD.1 = c()
for(i in a){
  b = data_PD %>% filter(SiteCode == i)
  temp = data %>% select("SiteCode","RainTrt","PD") %>% 
    filter(SiteCode == i) %>% 
    mutate(z = (as.numeric(unlist(PD))-as.numeric(b$mean))/as.numeric(b$sd))
  data_PD.1 = rbind(data_PD.1, temp) 
}
data_PD.1$z[data_PD.1$z == "NaN"] <- 0
# Select values with a large or small z score
data_PD.2 = data_PD.1 %>%filter(z > -3 & z < 3)
# Determine new particle density means without outliers
data_PD.final   = data_PD.2 %>% select("SiteCode","RainTrt","PD") %>% group_by(SiteCode) %>% 
  summarise(mean = mean(as.numeric(unlist(PD)),na.rm = TRUE),sd = sd(as.numeric(unlist(PD)),na.rm = TRUE))
# Save final file 
write.csv(data_PD.final, file = "C:/luciana_datos/UCI/Project_13 (DIGME)/DIGME_model/General_data/DIGME_PD_clean.csv")

# Porosity----
# Calculation of porosity. In case, particle density is missing or is too low compared to 
# bulk density, specific gravity is used. 

# Soil Porosity = (1-(Bulk Density ÷ Particle Density))  
new_data = as.data.frame(cbind(data_BD.final$SiteCode,data_BD.final$mean,data_PD.final$mean))
colnames(new_data) = c("Site","BD","PD")
new_data = new_data %>% mutate(Porosity = 1 - (as.numeric(unlist(BD))/as.numeric(unlist(PD))))   
write.csv(new_data, file = "C:/luciana_datos/UCI/Project_13 (DIGME)/DIGME_model/General_data/DIGME_physicochemical_clean.csv")
# For three sites, we did not have good estimations of soil porosity, so 
# we will use the specific gravity of the soil as a proxy for particle density
DIGME_physicochemical_clean   = read.csv("C:/luciana_datos/UCI/Project_13 (DIGME)/DIGME_model/General_data/DIGME_physicochemical_clean.csv",dec=".")
specific_gravity              = 2.65
DIGME_physicochemical_clean$PD[DIGME_physicochemical_clean$Site == "passogavia.it"] = specific_gravity
DIGME_physicochemical_clean$PD[DIGME_physicochemical_clean$Site == "hyide.de"]      = specific_gravity
DIGME_physicochemical_clean$PD[DIGME_physicochemical_clean$Site == "skotsvar.no"]   = specific_gravity
DIGME_physicochemical_clean$PD[DIGME_physicochemical_clean$Site == "lygra.no"]   = specific_gravity
DIGME_physicochemical_clean = DIGME_physicochemical_clean %>% mutate(Porosity = 1 - (as.numeric(unlist(BD))/as.numeric(unlist(PD))))   
write.csv(DIGME_physicochemical_clean, file = "C:/luciana_datos/UCI/Project_13 (DIGME)/DIGME_model/General_data/DIGME_physicochemical_clean.csv")

# Writing in google drive
sheet_write(DIGME_physicochemical_clean,
            ss = "https://docs.google.com/spreadsheets/d/11DytAR1jPBdgWUM1dio7QVX23OAK_BfH63e4ssTqOa8/edit?gid=0#gid=0",
            sheet = "DIGME_physicochemical")

# Convert GWC to VWC----
# Conversion from gravimetric to volumetric water content
# VWC = GWC * BD
a           = unique(data_PD$SiteCode)
data_global = c()
for(i in a){
  b.1  = data %>% filter(SiteCode == i)
  b.2  = new_data %>% filter(Site == i)
  temp = b.1 %>% mutate(ActualVWC = as.numeric(unlist(b.1$ActualGWC))*as.numeric(unlist(b.2$BD))) %>% 
    mutate(TargetVWC = as.numeric(unlist(b.1$TargetGWC))*as.numeric(unlist(b.2$BD)))
  data_global = rbind(data_global, temp) 
}
data_global <- apply(data_global,2,as.character)
write.csv(data_global, file = "C:/luciana_datos/UCI/Project_13 (DIGME)/DIGME_model/General_data/DIGME_data_intermediate.csv")

# Water Potential Curves - Data preparation----
# Data preparation for fitting data to Van Genuchten model in Matlab

# Homogenize column names
WP_plot           = subset(WP_plot, select = -c(FullCode))
colnames(WP_trt)  = c("Treatment","Site","Sample","b0.1","b0.33","b1","b5","b10","b15")
colnames(WP_plot) = c("Treatment","Site","Sample","b0.1","b0.33","b1","b5","b10","b15")
WP_global = as.data.frame(rbind(WP_trt,WP_plot))

# Conversion to volumetric water content
WP_global.1 = c()
for(i in a){
  b.1  = WP_global %>% filter(Site == i)
  b.2  = new_data %>% filter(Site == i)
  temp = b.1 %>% mutate(b0.1 = as.numeric(unlist(b.1$b0.1))*as.numeric(unlist(b.2$BD))) %>% 
    mutate(b0.33 = as.numeric(unlist(b.1$b0.33))*as.numeric(unlist(b.2$BD))) %>%
    mutate(b1 = as.numeric(unlist(b.1$b1))*as.numeric(unlist(b.2$BD))) %>%
    mutate(b5 = as.numeric(unlist(b.1$b5))*as.numeric(unlist(b.2$BD))) %>%
    mutate(b10 = as.numeric(unlist(b.1$b10))*as.numeric(unlist(b.2$BD))) %>%
    mutate(b15 = as.numeric(unlist(b.1$b15))*as.numeric(unlist(b.2$BD)))
  WP_global.1 = rbind(WP_global.1, temp) 
}
# Mean and Std values
WP_global.m   = WP_global.1 %>% group_by(Site) %>% 
  summarise(b0.1_mean = mean(as.numeric(unlist(b0.1)),na.rm = TRUE),
            b0.33_mean = mean(as.numeric(unlist(b0.33)),na.rm = TRUE),
            b1_mean = mean(as.numeric(unlist(b1)),na.rm = TRUE),
            b5_mean = mean(as.numeric(unlist(b5)),na.rm = TRUE),
            b10_mean = mean(as.numeric(unlist(b10)),na.rm = TRUE),
            b15_mean = mean(as.numeric(unlist(b15)),na.rm = TRUE))
WP_global.s   = WP_global.1 %>% group_by(Site) %>%
  summarise(b0.1_sd = sd(as.numeric(unlist(b0.1)),na.rm = TRUE),
            b0.33_sd = sd(as.numeric(unlist(b0.33)),na.rm = TRUE),
            b1_sd = sd(as.numeric(unlist(b1)),na.rm = TRUE),
            b5_sd = sd(as.numeric(unlist(b5)),na.rm = TRUE),
            b10_sd = sd(as.numeric(unlist(b10)),na.rm = TRUE),
            b15_sd = sd(as.numeric(unlist(b15)),na.rm = TRUE))
# Merge dataset to obtain PD data
colnames(data_PD.final) = c("Site","PD_mean","PD_sd")
WP_matlab = c()
WP_bar    = c(0.1,0.33,1,5,10,15)
for(i in a){
  c.1  = WP_global.m   %>% filter(Site == i)
  c.2  = WP_global.s   %>% filter(Site == i)
  c.3  = new_data %>% filter(Site == i)
  temp = cbind(t(c.1),t(c.2))
  temp1 = temp[-c(1),]
  temp2 = cbind(temp1,WP_bar,rep(c.3$Porosity,each=length(WP_bar)))
  colnames(temp2) = c("WVC_mean","WVC_sd","WP_bar","Porosity")
  temp2 = temp2 %>% as.data.frame(row.names = 1:nrow(.))
  WP_matlab = rbind(WP_matlab, temp2) 
}
WP_matlab$WVC_mean[is.na(WP_matlab$WVC_mean)] = "NaN"
WP_matlab$WVC_sd[is.na(WP_matlab$WVC_sd)] = "NaN"
write.table(WP_matlab, file = "C:/luciana_datos/UCI/Project_13 (DIGME)/DIGME_model/General_data/WP_matlab.txt", sep = "\t",
            row.names = TRUE, col.names = FALSE,quote = FALSE)

# Add the new calculated porosities to the WP matlab file
WP_matlab = read.delim("C:/luciana_datos/UCI/Project_13 (DIGME)/DIGME_model/General_data/WP_matlab.txt")
WP_matlab$X0.504982106757517[96:101]  = DIGME_physicochemical_clean$Porosity[DIGME_physicochemical_clean$Site=="hyide.de"]
WP_matlab$X0.504982106757517[114:119] = DIGME_physicochemical_clean$Porosity[DIGME_physicochemical_clean$Site=="passogavia.it"]
WP_matlab$X0.504982106757517[138:143] = DIGME_physicochemical_clean$Porosity[DIGME_physicochemical_clean$Site=="skotsvar.no"]
WP_matlab$X0.504982106757517[102:107] = DIGME_physicochemical_clean$Porosity[DIGME_physicochemical_clean$Site=="lygra.no"]
WP_matlab[WP_matlab=="NaN"] = "NaN"
WP_matlab                   =  WP_matlab[, -1]
write.table(WP_matlab, file = "C:/luciana_datos/UCI/Project_13 (DIGME)/DIGME_model/General_data/WP_matlab_2.txt", sep = "\t",
            row.names = TRUE, col.names = FALSE,quote = FALSE)

# Water Potential Curves - Plotting and conversion ----
# Data conversion using the results from Matlab

# Data preparation - VG
Site             = unique(DIGME_physicochemical_clean$Site)
parameters_VG    = read.csv("C:/luciana_datos/UCI/Project_13 (DIGME)/DIGME_model/General_data/parameters_VG.csv",dec=".")
parameters_VG    = as.data.frame(cbind(Site,parameters_VG))
write.csv(parameters_VG, file = "C:/luciana_datos/UCI/Project_13 (DIGME)/DIGME_model/output_files/DIGME_parameters_VG.csv")
# Writing in google drive
sheet_write(parameters_VG,
            ss = "https://docs.google.com/spreadsheets/d/1OJcBfY9yMwQdk1TSoiQ7dzffZxdhucWY6p0QqFClAIo/edit?gid=0#gid=0",
            sheet = "parameters_VG")

# Conversion using VG parameters

DIGME_data          = read.csv("C:/luciana_datos/UCI/Project_13 (DIGME)/DIGME_model/General_data/DIGME_data_intermediate.csv",dec=".")
parameters_VG       = read_sheet("https://docs.google.com/spreadsheets/d/1OJcBfY9yMwQdk1TSoiQ7dzffZxdhucWY6p0QqFClAIo/edit?gid=1017252855#gid=1017252855")
Site                = unique(parameters_VG$Site)

DIGME_data_global.1 = c()
for(i in Site){
  d.1    = DIGME_data %>% filter(SiteCode == i)
  d.2    = parameters_VG %>% filter(Site == i)
  temp.1 = d.1 %>% mutate(theta = (as.numeric(unlist(d.1$ActualVWC)) - d.2$theta_r)/(d.2$theta_s - d.2$theta_r)) %>%
    mutate(m = rep(1 - 1/d.2$n,each=nrow(d.1)))
  temp.2 = temp.1 %>% mutate(m_1 = 1/temp.1$m) %>% 
    mutate(n_1 = rep(1/d.2$n,each=nrow(d.1))) %>%
    mutate(alpha_1 = rep(1/d.2$alpha,each=nrow(d.1)))
  temp.3 = temp.2 %>% mutate(ActualWP = temp.2$alpha_1*((1/(temp.2$theta)^temp.2$m_1)-1)^temp.2$n_1) 
  DIGME_data_global.1 = rbind(DIGME_data_global.1, temp.3) 
}
# Omit NAs
DIGME_data_global.1 = DIGME_data_global.1 %>% drop_na(ActualWP)
DIGME_data_global.1 = DIGME_data_global.1 %>% drop_na(CO2_eq)

write.csv(DIGME_data_global.1, file = "C:/luciana_datos/UCI/Project_13 (DIGME)/DIGME_model/output_files/DIGME_data_global.csv")
# Writing in google drive
sheet_write(DIGME_data_global.1,
            ss = "https://docs.google.com/spreadsheets/d/1e67_fmEOtL2OhKC_aG6YGDMNpybHA_We3uRYxZSGq_A/edit?gid=0#gid=0",
            sheet = "DIGME_data_global")

# Manzoni Model - Data preparation----

# Call data

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

# Data preparation - Manzoni model

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

# Manzoni Model Results - Data integration into final dataset

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



