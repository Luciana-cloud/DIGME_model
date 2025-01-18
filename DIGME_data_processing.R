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
# Data preparation for modeling fitting of the Mazoni model in Matlab
# Merge with ANPP
DIGME_data_global.1 = read_sheet("https://docs.google.com/spreadsheets/d/1e67_fmEOtL2OhKC_aG6YGDMNpybHA_We3uRYxZSGq_A/edit?gid=0#gid=0")
updated_databse     = read_sheet("https://docs.google.com/spreadsheets/d/1BgfeqJV9OGIczWRoWzy5BkdFc2ieV2wr_OBerlMUoxY/edit?gid=789471970#gid=789471970")
updated_databse.baddrt =  updated_databse %>% filter(SiteCode == "baddrt.de")
updated_databse.baddrt =  updated_databse.baddrt[-24,]
updated_databse.baddrt =  updated_databse.baddrt[,c(2,19:23)]
updated_databse.Cedar  =  updated_databse %>% filter(SiteCode == "cedarsav.us")
updated_databse.Cedar  =  updated_databse.Cedar[,c(2,19:23)]
updated_databse        = as.data.frame(rbind(updated_databse.baddrt,updated_databse.Cedar))
DIGME_data_global.1    = transform(DIGME_data_global.1, CO2_w1a = as.numeric(CO2_w1a),
                                   CO2_w1b = as.numeric(CO2_w1b),
                                   CO2_w2a = as.numeric(CO2_w2a),
                                   CO2_w2b = as.numeric(CO2_w2b),
                                   CO2_eq  = as.numeric(CO2_eq))
DIGME_data_global.1[325:383,c(19:23)] = as.numeric(unlist(updated_databse.baddrt[,2:6]))
DIGME_data_global.1[456:515,c(19:23)] = as.numeric(unlist(updated_databse.Cedar[,2:6])) 

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

# SOM data analysis
# Complete SOM with the mean value in case the data is missing
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
# (final units CO2 ug g (C)-1 h-1)
data_manzoni.2 = data_manzoni.2 %>% mutate(SOC = SOM/1.72)
# Normalize CO2 flux by SOC
data_manzoni.2 = data_manzoni.2 %>% mutate(CO2_eq_norm = CO2_eq/SOC) %>% 
  mutate(CO2_w1a_norm = as.numeric(unlist(CO2_w1a))/SOC) %>%
  mutate(CO2_w1b_norm = as.numeric(unlist(CO2_w1b))/SOC) %>% 
  mutate(CO2_w2a_norm = as.numeric(unlist(CO2_w2a))/SOC) %>%
  mutate(CO2_w2b_norm = as.numeric(unlist(CO2_w2b))/SOC)

# Change negative values to NA so we do not consider them for the mean value
# Keep in mind that we are not discarting the first observation, assuming there is
# no birch effect
data_manzoni.2 = data_manzoni.2 %>% mutate(CO2_w1a_norm = replace(CO2_w1a_norm, CO2_w1a_norm < 0, NA))
data_manzoni.2 = data_manzoni.2 %>% mutate(CO2_w1b_norm = replace(CO2_w1b_norm, CO2_w1b_norm < 0, NA))
data_manzoni.2 = data_manzoni.2 %>% mutate(CO2_w2a_norm = replace(CO2_w2a_norm, CO2_w2a_norm < 0, NA))
data_manzoni.2 = data_manzoni.2 %>% mutate(CO2_w2b_norm = replace(CO2_w2b_norm, CO2_w2b_norm < 0, NA))

# Obtain standard deviation of CO2 fluxes
data_manzoni.2 = data_manzoni.2 %>% mutate(CO2_eq_norm = rowMeans(as.matrix(data_manzoni.2[,c(47,48,49)]),
                                                           na.rm = TRUE))
data_manzoni.2 = data_manzoni.2 %>% mutate(CO2_sd = rowSds(as.matrix(data_manzoni.2[,c(47,48,49)]),
                                                       na.rm = TRUE))
# I am adding the intial repetition as there might not be evidence for birch effect
data_manzoni.2 = data_manzoni.2 %>% mutate(CO2_sd.all = rowSds(as.matrix(data_manzoni.2[,c(46,47,48,49)]),
                                                           na.rm = TRUE))
data_manzoni.2 = data_manzoni.2 %>% mutate(CO2_mean   = rowMeans(as.matrix(data_manzoni.2[,c(46,47,48,49)]),
                                                           na.rm = TRUE))
# Omit NAs
data_manzoni.2 = data_manzoni.2 %>% drop_na(CO2_w2a_norm)

# 3Sigma rule to check for outliers for the CO2 repetitions----
# https://www.jstor.org/stable/2684253?seq=1
#data_manzoni.2 = data_manzoni.2 %>% mutate(sigma_rule = CO2_eq_norm + 3*CO2_sd)
data_manzoni.2 = data_manzoni.2 %>% mutate(sigma_rule = CO2_mean + 3*CO2_sd.all)
data_manzoni.3 = data_manzoni.2 %>% mutate(sigma_result.1 = case_when(CO2_w1b_norm >= sigma_rule ~ 0,
                                                                    CO2_w1b_norm <  sigma_rule ~ 1,
                                                                    CO2_w1b_norm <  0 ~ 0))
data_manzoni.3 = data_manzoni.3 %>% mutate(sigma_result.2 = case_when(CO2_w2a_norm >= sigma_rule ~ 0,
                                                                      CO2_w2a_norm <  sigma_rule ~ 1,
                                                                      CO2_w2a_norm <  0 ~ 0))
data_manzoni.3 = data_manzoni.3 %>% mutate(sigma_result.3 = case_when(CO2_w2b_norm >= sigma_rule ~ 0,
                                                                      CO2_w2b_norm <  sigma_rule ~ 1,
                                                                      CO2_w2b_norm <  0 ~ 0))
data_manzoni.3 = data_manzoni.3 %>% mutate(sigma_result.4 = case_when(CO2_w1a_norm >= sigma_rule ~ 0,
                                                                      CO2_w1a_norm <  sigma_rule ~ 1,
                                                                      CO2_w1a_norm <  0 ~ 0))
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
write.csv(data_manzoni.5, file = "C:/luciana_datos/UCI/Project_13 (DIGME)/DIGME_model/General_data/data_manzoni_complete.csv")

# Save for matlab processing
data_manzoni.5 = data_manzoni.5 %>% select(c("ActualVWC","ActualWP","CO2_mean","CO2_sd.all"))
write.table(data_manzoni.5, file = "C:/luciana_datos/UCI/Project_13 (DIGME)/DIGME_model/General_data/data_manzoni_matlab.txt", sep = "\t",
            row.names = TRUE, col.names = FALSE,quote = FALSE)
rm(d.1,d.2,data_manzoni,a,i,temp.1,data_manzoni.1,sigma_rule,sigma_val.d1,sigma_val.d2,b,
   meam_am,meam_dr,temp1,temp2)

# Manzoni Model Results - Data integration into final dataset----

# Data preparation
DIGME_data_global.1   = read_sheet("https://docs.google.com/spreadsheets/d/1KVKi0YfLUPnEynhfzTwUc6dVt16tdEDgIAfDa4R07lA/edit?gid=0#gid=0")
Site                  = unique(DIGME_data_global.1$SiteCode)
Site                  = rep(Site,each = 2)
RainTrt               = rep(c("Ambient","Drought"),times = length(unique(Site)))
parameters_manzoni    = read.csv("C:/luciana_datos/UCI/Project_13 (DIGME)/DIGME_model/General_data/parameters_manzoni.csv",dec=".")
parameters_manzoni    = as.data.frame(cbind(Site,RainTrt,parameters_manzoni))
write.csv(parameters_manzoni, file = "C:/luciana_datos/UCI/Project_13 (DIGME)/DIGME_model/output_files/DIGME_parameters_manzoni.csv")
# Writing in google drive
sheet_write(parameters_manzoni,
            ss = "https://docs.google.com/spreadsheets/d/1a77xdxHZ6yH4D0j0ATR1gzKu2CNQoq5-5W0PJkTnjUs/edit?gid=0#gid=0",
            sheet = "parameters_manzoni")

# Test Modeling for Alpha parameter from the Manzoni model----
# manzoni.data = read_sheet("https://docs.google.com/spreadsheets/d/1a77xdxHZ6yH4D0j0ATR1gzKu2CNQoq5-5W0PJkTnjUs/edit?gid=0#gid=0") # old data excluding first observations
manzoni.data = read_sheet("https://docs.google.com/spreadsheets/d/1QcVMBo3HzNwND0A_6tHp09MGVJGq8k1LWY5BOaSHlBM/edit?gid=0#gid=0")
DIGME.global = read_sheet("https://docs.google.com/spreadsheets/d/1e67_fmEOtL2OhKC_aG6YGDMNpybHA_We3uRYxZSGq_A/edit?gid=0#gid=0")

# Remove sites with a small sample size
manzoni.data = manzoni.data %>% filter(sample.size > 11)
manzoni.data = manzoni.data %>%  mutate(performance = case_when(p.value >= 0.1 ~ 0,
                                                                p.value <  0.1 ~ 1))
# Soil characteristics
DIGME.global.soil = DIGME.global %>% select(c("SiteCode","RainTrt","pH","DOC",
                                              "MBC","SOM","MAP","MAP_CV","MAT",
                                              "Sand","Clay","ANPP")) 
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
            ss = "https://docs.google.com/spreadsheets/d/1gOfam8WkT2pxAorPq5oG4nz1CM4bYLxIMYargXVzTNc/edit?gid=0#gid=0",
            sheet = "manzoni.data.soil.2")
# Adding ANPP data
data                = read_sheet("https://docs.google.com/spreadsheets/d/1TtHcLwdtphcwGAROzgd4F_-L7l6KsohjCAENciR2OrY/edit?gid=863709267#gid=863709267")
data                = data %>% select(c("SiteCode","RainTrt","ANPP"))
manzoni.data.soil   = read_sheet("https://docs.google.com/spreadsheets/d/11UcwPIUcppmXzKzgOYo5hxTk9k0C8-fFI90dpxdOQ9w/edit?gid=0#gid=0")
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
            ss = "https://docs.google.com/spreadsheets/d/1gOfam8WkT2pxAorPq5oG4nz1CM4bYLxIMYargXVzTNc/edit?gid=0#gid=0",
            sheet = "manzoni.data.soil.2")

# Data Analysis for China sites ----
combine_data_china         = read_sheet("https://docs.google.com/spreadsheets/d/1rgRuManmc2Hj-XQXlxYgBhtdeTLDAMbgW42z9g8-zDU/edit?gid=2014011289#gid=2014011289")

# Convert WP units from MPa to bars
combine_data_china = combine_data_china %>% mutate(ActualWP = ActualWP*-10)

# Omit NAs
combine_data_china = combine_data_china %>% drop_na(ActualWP)

# Manzoni Model - Data preparation
# Replace all higher WP values by the threshold of 1000 Bars, assuming that we should
# not have microbial activity below 1000 bars
combine_data_china$ActualWP[combine_data_china$ActualWP > 1000] = 1000

# Normalization of respiration rates by SOC (final units CO2 ug g (C)-1 h-1)
combine_data_china    = combine_data_china %>% mutate(CO2_w1a_norm = as.numeric(unlist(CO2_w1a))/`SOC%`) %>%
  mutate(CO2_w1b_norm = as.numeric(unlist(CO2_w1b))/`SOC%`) %>% 
  mutate(CO2_w2a_norm = as.numeric(unlist(CO2_w2a))/`SOC%`) %>%
  mutate(CO2_w2b_norm = as.numeric(unlist(CO2_w2b))/`SOC%`)

# Change negative values to NA so we do not consider them for the mean value
# Keep in mind that we are not discarting the first observation, assuming there is
# no birch effect
combine_data_china = combine_data_china %>% mutate(CO2_w1a_norm = replace(CO2_w1a_norm, CO2_w1a_norm < 0, NA))
combine_data_china = combine_data_china %>% mutate(CO2_w1b_norm = replace(CO2_w1b_norm, CO2_w1b_norm < 0, NA))
combine_data_china = combine_data_china %>% mutate(CO2_w2a_norm = replace(CO2_w2a_norm, CO2_w2a_norm < 0, NA))
combine_data_china = combine_data_china %>% mutate(CO2_w2b_norm = replace(CO2_w2b_norm, CO2_w2b_norm < 0, NA))

# Obtain standard deviation of CO2 fluxes
combine_data_china = combine_data_china %>% mutate(CO2_eq_norm = rowMeans(as.matrix(combine_data_china[,c(40,39,38,37)]),
                                                                  na.rm = TRUE))
combine_data_china = combine_data_china %>% mutate(CO2_sd = rowSds(as.matrix(combine_data_china[,c(40,39,38,37)]),
                                                           na.rm = TRUE))

# Omit NAs
combine_data_china = combine_data_china %>% drop_na(CO2_eq_norm)

# 3Sigma rule to check for outliers for the CO2 repetitions
# https://www.jstor.org/stable/2684253?seq=1
combine_data_china = combine_data_china %>% mutate(sigma_rule = CO2_eq_norm + 3*CO2_sd)
combine_data_china = combine_data_china %>% mutate(sigma_result.1 = case_when(CO2_w1b_norm >= sigma_rule ~ 0,
                                                                      CO2_w1b_norm <  sigma_rule ~ 1,
                                                                      CO2_w1b_norm <  0 ~ 0))
combine_data_china = combine_data_china %>% mutate(sigma_result.2 = case_when(CO2_w2a_norm >= sigma_rule ~ 0,
                                                                      CO2_w2a_norm <  sigma_rule ~ 1,
                                                                      CO2_w2a_norm <  0 ~ 0))
combine_data_china = combine_data_china %>% mutate(sigma_result.3 = case_when(CO2_w2b_norm >= sigma_rule ~ 0,
                                                                      CO2_w2b_norm <  sigma_rule ~ 1,
                                                                      CO2_w2b_norm <  0 ~ 0))
combine_data_china = combine_data_china %>% mutate(sigma_result.4 = case_when(CO2_w1a_norm >= sigma_rule ~ 0,
                                                                      CO2_w1a_norm <  sigma_rule ~ 1,
                                                                      CO2_w1a_norm <  0 ~ 0))

# 3Sigma rule to check for outliers for the SOC
combine_data_china.1 = c()
a                    = unique(combine_data_china$SiteCode)
b                    = c("Ambient","Drought")
for(i in a){
  d.1    = combine_data_china %>% filter(SiteCode == i&RainTrt=="Ambient")
  d.2    = combine_data_china %>% filter(SiteCode == i&RainTrt=="Drought")
  sigma_val.d1 = mean(d.1$`SOC%`) + 3*sd(d.1$`SOC%`)
  sigma_val.d2 = mean(d.2$`SOC%`) + 3*sd(d.2$`SOC%`)
  d.1       = d.1 %>% mutate(sigma_SOM = case_when(`SOC%` >= sigma_val.d1 ~ 0,
                                                   `SOC%` <  sigma_val.d1 ~ 1))
  d.2       = d.2 %>% mutate(sigma_SOM = case_when(`SOC%` >= sigma_val.d2 ~ 0,
                                                   `SOC%` <  sigma_val.d2 ~ 1)) 
  temp.1 = rbind(d.1,d.2)
  combine_data_china.1 = rbind(combine_data_china.1, temp.1) 
}

# Erase zeros
combine_data_china.1 = combine_data_china.1 %>% filter(as.numeric(unlist(sigma_SOM)) > 0)
combine_data_china.1 = apply(combine_data_china.1,2,as.character)
write.csv(combine_data_china.1, file = "C:/luciana_datos/UCI/Project_13 (DIGME)/DIGME_model/General_data/china_sites.csv")

# Save for matlab processing
combine_data_china.1 = as.data.frame(combine_data_china.1) %>% select(c("Moist","ActualWP","CO2_eq_norm","CO2_sd"))
write.table(combine_data_china.1, file = "C:/luciana_datos/UCI/Project_13 (DIGME)/DIGME_model/General_data/china_matlab.txt", sep = "\t",
            row.names = TRUE, col.names = FALSE,quote = FALSE)

# Merge datasets (globe + china)----

combine_data_china    = read_sheet("https://docs.google.com/spreadsheets/d/1rgRuManmc2Hj-XQXlxYgBhtdeTLDAMbgW42z9g8-zDU/edit?gid=2014011289#gid=2014011289")
Site                  = unique(combine_data_china$SiteCode)
Site                  = rep(Site,each = 2)
RainTrt               = rep(c("Ambient","Drought"),times = length(unique(Site)))
parameters_manzoni    = read.csv("C:/luciana_datos/UCI/Project_13 (DIGME)/DIGME_model/output_files/parameters_manzoni_china.csv",dec=".")
parameters_manzoni    = as.data.frame(cbind(Site,RainTrt,parameters_manzoni))
write.csv(parameters_manzoni, file = "C:/luciana_datos/UCI/Project_13 (DIGME)/DIGME_model/output_files/DIGME_parameters_manzoni_china.csv")

# Add performance score
parameters_manzoni = parameters_manzoni %>% filter(sample.size > 11)
parameters_manzoni = parameters_manzoni %>%  mutate(performance = case_when(p.value >= 0.1 ~ 0,
                                                                            p.value <  0.1 ~ 1))
# Add soil properties data
combine_data_china_soil = combine_data_china %>% mutate(SOM = `SOC%`*1.72)

combine_data_china_soil = combine_data_china_soil %>% select(c("SiteCode","RainTrt","pH","DOC",
                                                               "MBC","SOM","MAP","MAP_CV","MAT",
                                                               "Sand","Clay","ANPP")) 
# Mean values
combine_data_china_soil = combine_data_china_soil %>% group_by(SiteCode,RainTrt) %>% 
  summarise(mean.pH     = mean(as.numeric(unlist(pH)),na.rm = TRUE),
            mean.DOC    = mean(as.numeric(unlist(DOC)),na.rm = TRUE),
            mean.MBC    = mean(as.numeric(unlist(MBC)),na.rm = TRUE),
            mean.SOM    = mean(as.numeric(unlist(SOM)),na.rm = TRUE),
            mean.MAP    = mean(as.numeric(unlist(MAP)),na.rm = TRUE),
            mean.MAP_CV = mean(as.numeric(unlist(MAP_CV)),na.rm = TRUE),
            mean.MAT    = mean(as.numeric(unlist(MAT)),na.rm = TRUE),
            mean_sand   = mean(as.numeric(unlist(Sand)),na.rm = TRUE),
            mean_clay   = mean(as.numeric(unlist(Clay)),na.rm = TRUE),
            ANPP        = mean(as.numeric(unlist(ANPP)),na.rm = TRUE))
# Join both datasets
names(combine_data_china_soil)[names(combine_data_china_soil) == 'SiteCode'] <- 'Site'
manzoni.data.soil.china = left_join(parameters_manzoni,combine_data_china_soil, by=c('Site',"RainTrt"))
manzoni.data.soil.china = replace(manzoni.data.soil.china, 17, NA)

# Merge with non-china sites
manzoni.data.soil.no.china = read_sheet("https://docs.google.com/spreadsheets/d/1gOfam8WkT2pxAorPq5oG4nz1CM4bYLxIMYargXVzTNc/edit?gid=0#gid=0")

manzoni.data.total         = as.data.frame(rbind(manzoni.data.soil.no.china,
                                                 manzoni.data.soil.china))
# Save in google drive
names(manzoni.data.total)[names(manzoni.data.total) == 'SEE'] <- 'SSE'
sheet_write(manzoni.data.total,
            ss = "https://docs.google.com/spreadsheets/d/1JLTtg4IZ3gzOsnEXeCTUgndjLWcC4eFvefWOMsOtXSw/edit?gid=0#gid=0",
            sheet = "manzoni.data.total")



