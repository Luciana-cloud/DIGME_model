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

# Bulk density----

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

# Data preparation - VG
Site             = unique(DIGME_physicochemical_clean$Site)
parameters_VG    = read.csv("C:/luciana_datos/UCI/Project_13 (DIGME)/DIGME_model/General_data/parameters_VG.csv",dec=".")
parameters_VG    = as.data.frame(cbind(Site,parameters_VG))
write.csv(parameters_VG, file = "C:/luciana_datos/UCI/Project_13 (DIGME)/DIGME_model/output_files/DIGME_parameters_VG.csv")
# Writing in google drive
sheet_write(parameters_VG,
            ss = "https://docs.google.com/spreadsheets/d/1OJcBfY9yMwQdk1TSoiQ7dzffZxdhucWY6p0QqFClAIo/edit?gid=0#gid=0",
            sheet = "parameters_VG")

# Data preparation - BC
parameters_BC    = read.csv("C:/luciana_datos/UCI/Project_13 (DIGME)/DIGME_model/General_data/parameters_BC.csv",dec=".")
parameters_BC    = as.data.frame(cbind(Site,parameters_BC))
write.csv(parameters_BC, file = "C:/luciana_datos/UCI/Project_13 (DIGME)/DIGME_model/output_files/DIGME_parameters_BC.csv")
# Writing in google drive
sheet_write(parameters_BC,
            ss = "https://docs.google.com/spreadsheets/d/1FnmhOU7qg6aYkZsfNXv8XDXCDqTctqDetmCr73fGOd4/edit?gid=0#gid=0",
            sheet = "parameters_BC")

# Conversion using VG parameters----

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
# Merge with ANPP
DIGME_data_global.1 = read_sheet("https://docs.google.com/spreadsheets/d/1e67_fmEOtL2OhKC_aG6YGDMNpybHA_We3uRYxZSGq_A/edit?gid=0#gid=0")

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
data_manzoni.2 = data_manzoni.2 %>% mutate(CO2_sd = rowSds(as.matrix(data_manzoni.2[,c(46,47,48)]),
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
write.csv(data_manzoni.5, file = "C:/luciana_datos/UCI/Project_13 (DIGME)/DIGME_model/General_data/data_manzoni.csv")

# Save for matlab processing
data_manzoni.5 = data_manzoni.5 %>% select(c("ActualVWC","ActualWP","CO2_eq_norm","CO2_sd"))
write.table(data_manzoni.5, file = "C:/luciana_datos/UCI/Project_13 (DIGME)/DIGME_model/General_data/data_manzoni_matlab.txt", sep = "\t",
            row.names = TRUE, col.names = FALSE,quote = FALSE)
rm(d.1,d.2,data_manzoni,a,i,temp.1,data_manzoni.1,sigma_rule,sigma_val.d1,sigma_val.d2,b,
   meam_am,meam_dr,temp1,temp2)

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

# Manzoni Model Results - Plotting and conversion using VG and Manzoni model----

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

# Water Potential conversion for new experiment----

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

# Test Modeling for Alpha parameter from the Manzoni model----
manzoni.data = read_sheet("https://docs.google.com/spreadsheets/d/1a77xdxHZ6yH4D0j0ATR1gzKu2CNQoq5-5W0PJkTnjUs/edit?gid=0#gid=0")
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
            ss = "https://docs.google.com/spreadsheets/d/11UcwPIUcppmXzKzgOYo5hxTk9k0C8-fFI90dpxdOQ9w/edit?gid=0#gid=0",
            sheet = "manzoni.data.soil")
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
            ss = "https://docs.google.com/spreadsheets/d/11UcwPIUcppmXzKzgOYo5hxTk9k0C8-fFI90dpxdOQ9w/edit?gid=0#gid=0",
            sheet = "manzoni.data.soil")

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

# PCR and VG model fit----
manzoni.data.soil.t = read_sheet("https://docs.google.com/spreadsheets/d/11UcwPIUcppmXzKzgOYo5hxTk9k0C8-fFI90dpxdOQ9w/edit?gid=0#gid=0")
manzoni.data.soil   = manzoni.data.soil.t %>% filter(performance == 1)
pca_model = prcomp(manzoni.data.soil[c("mean.DOC","mean.pH","mean.MBC","mean.MAP","mean.MAT","ANPP")],
                center = TRUE,
                scale. = TRUE)
print(pca_model)
summary(pca_model)

biplot_1 = fviz_pca_biplot(pca_model,label="none",habillage=manzoni.data.soil$RainTrt) + 
  theme_minimal()
biplot_1
png("C:/luciana_datos/UCI/Project_13 (DIGME)/DIGME_model/Figures/exploratory_figures/biplot_1.png",
    width=3500*1.35,height=1969*1.35,res=300)
print(biplot_1)
dev.off()

biplot_2 = fviz_pca_biplot(pca_model, label ="var") + theme_minimal()
biplot_2
png("C:/luciana_datos/UCI/Project_13 (DIGME)/DIGME_model/Figures/exploratory_figures/biplot_2.png",
    width=3500*1.35,height=1969*1.35,res=300)
print(biplot_2)
dev.off()

# Alpha Model ----

# Get Delta Alpha
del_alpha = c()
site_n    = unique(manzoni.data.soil.t$Site)
for(i in site_n){
  b.1  = manzoni.data.soil.t %>% filter(Site == i & RainTrt == "Ambient")
  b.2  = manzoni.data.soil.t %>% filter(Site == i & RainTrt == "Drought")
  temp = b.1$alpha - b.2$alpha 
  del_alpha = as.data.frame(rbind(del_alpha,cbind(temp,b.1$mean.MAP,b.1$mean.MAT,
                                                  mean(b.1$mean.pH,b.2$mean.pH),
                                                  (b.1$ANPP - b.2$ANPP)))) 
}
colnames(del_alpha) = c("delta_alpha","MAP","MAT","pH","delta_ANPP")

# Models with the whole data set

model.1 = lm(delta_alpha ~ (MAP+MAT+pH+delta_ANPP)^2,data = del_alpha)
summary(model.1)

# select best model according to AIC using mixed selection
best_model      = step(model.1, direction = "both", # both = mixed selection
                                  trace     = TRUE) # do not display intermediate steps
summary(best_model)
# delta_alpha ~ MAP + pH + delta_ANPP + MAP:pH + MAP:delta_ANPP

# Models with the best performance sites

# Get Delta Alpha
del_alpha.2 = c()
manzoni.data.soil_red = manzoni.data.soil[-c(7,8,11,12,15,16,21,22,29),]
site_n      = unique(manzoni.data.soil_red$Site)
for(i in site_n){
  b.1  = manzoni.data.soil_red %>% filter(Site == i & RainTrt == "Ambient")
  b.2  = manzoni.data.soil_red %>% filter(Site == i & RainTrt == "Drought")
  temp = b.1$alpha - b.2$alpha 
  del_alpha.2 = as.data.frame(rbind(del_alpha.2,cbind(temp,b.1$mean.MAP,b.1$mean.MAT,
                                                  mean(b.1$mean.pH,b.2$mean.pH),
                                                  (b.1$ANPP - b.2$ANPP)))) 
}
colnames(del_alpha.2) = c("delta_alpha","MAP","MAT","pH","delta_ANPP")

model.1.1 = lm(delta_alpha ~ (MAP+MAT+pH+delta_ANPP)^2,data = del_alpha)
summary(model.1.1)

# select best model according to AIC using mixed selection
best_model.1      = step(model.1.1, direction = "both", # both = mixed selection
                       trace     = TRUE) # do not display intermediate steps
summary(best_model.1)
# delta_alpha ~ MAP + pH + delta_ANPP + MAP:pH + MAP:delta_ANPP

