# Load packages----

library(googledrive)
library(googlesheets4)
library(readxl)
library(tidyverse)
library(outliers)
library(ggpubr)
library("stringr") 

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

# Convert GWC to VWC----
# VWC = GWC * BD

data_global = c()
for(i in a){
  b.1  = data %>% filter(SiteCode == i)
  b.2  = new_data %>% filter(Site == i)
  temp = b.1 %>% mutate(ActualVWC = as.numeric(unlist(b.1$ActualGWC))*as.numeric(unlist(b.2$BD))) %>% 
    mutate(TargetVWC = as.numeric(unlist(b.1$TargetGWC))*as.numeric(unlist(b.2$BD)))
  data_global = rbind(data_global, temp) 
}
data_global <- apply(data_global,2,as.character)
write.csv(data_global, file = "C:/luciana_datos/UCI/Project_13 (DIGME)/DIGME_model/General_data/DIGME_data_global.csv")

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

# Water Potential Curves - Ploting and conversion ----

# Data preparation
Site             = unique(data_BD$SiteCode)
parameters_VG    = read.csv("C:/luciana_datos/UCI/Project_13 (DIGME)/DIGME_model/water_potential_fitting/calibrated_parameters/parameters_VG.csv",dec=".")
parameters_VG    = as.data.frame(cbind(Site,parameters_VG))
write.csv(parameters_VG, file = "C:/luciana_datos/UCI/Project_13 (DIGME)/DIGME_model/output_files/DIGME_parameters_VG.csv")
# Writing in google drive
sheet_write(parameters_VG,
            ss = "https://docs.google.com/spreadsheets/d/1OJcBfY9yMwQdk1TSoiQ7dzffZxdhucWY6p0QqFClAIo/edit?gid=0#gid=0",
            sheet = "parameters_VG")

# Data merge with global dataset

DIGME_data_global   = read.csv("C:/luciana_datos/UCI/Project_13 (DIGME)/DIGME_model/General_data/DIGME_data_global.csv",dec=".")

DIGME_data_global.1 = c()
for(i in a){
  d.1    = DIGME_data_global %>% filter(SiteCode == i)
  d.2    = parameters_VG %>% filter(Site == i)
  temp.1 = d.1 %>% mutate(theta = (as.numeric(unlist(d.1$ActualVWC)) - d.2$theta_r)/(d.2$theta_s - d.2$theta_r)) %>%
    mutate(m = rep(1 - 1/d.2$n,each=nrow(d.1)))
  temp.2 = temp.1 %>% mutate(m_1 = 1/temp.1$m) %>% 
    mutate(n_1 = rep(1/d.2$n,each=nrow(d.1))) %>%
    mutate(alpha_1 = rep(1/d.2$alpha,each=nrow(d.1)))
  temp.3 = temp.2 %>% mutate(ActualWP = temp.2$alpha_1*((1/(temp.2$theta)^temp.2$m_1)-1)^temp.2$n_1) 
  DIGME_data_global.1 = rbind(DIGME_data_global.1, temp.3) 
}

write.csv(DIGME_data_global.1, file = "C:/luciana_datos/UCI/Project_13 (DIGME)/DIGME_model/output_files/DIGME_data_global.csv")
# Writing in google drive
sheet_write(DIGME_data_global.1,
            ss = "https://docs.google.com/spreadsheets/d/1e67_fmEOtL2OhKC_aG6YGDMNpybHA_We3uRYxZSGq_A/edit?gid=0#gid=0",
            sheet = "DIGME_data_global")


