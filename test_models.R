rm(list = ls())

# Load library ----
library("ggplot2")
library("scales")
library("tidyr")
library("dplyr")
library("ggpmisc")
library("ggpubr")
library("plotly")
library("readxl")

# Called data ----

DIGME_data  = read_excel("DIGME_summary_esa2024_2024_02_06.xlsx")

DIGME_clean = DIGME_data[-c(7,14,21,28,35,42,49,56,63,70,77,84,91,98,105,112,
                            119,126),] 
DIGME_clean = DIGME_clean[c("SiteCode","RainTrt","FieldRep","CoreNum",
                            "ActualGWC","BD","Moist","DOC","MBC","SOM",
                            "CO2_eq")]
DIGME_mean  = DIGME_clean %>% group_by(SiteCode,RainTrt,CoreNum) %>% 
  summarise(ActualGWC_m = mean(as.numeric(ActualGWC)),
            ActualGWC_sd = sd(as.numeric(ActualGWC)),
            BD_m = mean(as.numeric(BD)),BD_sd = sd(as.numeric(BD)),
            DOC_m = mean(as.numeric(DOC)),DOC_sd = sd(as.numeric(DOC)),
            CO2_eq_m = mean(as.numeric(CO2_eq)),
            CO2_eq_sd = sd(as.numeric(CO2_eq)),
            MBC_m = mean(as.numeric(MBC)),MBC_sd = sd(as.numeric(MBC)),
            SOM_m = mean(as.numeric(SOM),na.rm = TRUE),
            SOM_sd = sd(as.numeric(SOM),na.rm = TRUE))

DIGME_mean$SiteCode[DIGME_mean$SiteCode == "Ayora.ES"] = "Ayora" 
DIGME_mean$SiteCode[DIGME_mean$SiteCode == "brhill.au"] = "brhill" 
DIGME_mean$SiteCode[DIGME_mean$SiteCode == "brookdale.ca"] = "brookdale" 

DIGME_mean.2 = DIGME_mean[,3:15]

# Matlab database

write.csv(DIGME_mean, file="DIGME_mean.csv",col.names = F, row.names = F)
write.table(DIGME_mean.2, file="DIGME_mean.2.txt",col.names = F, row.names = F)


