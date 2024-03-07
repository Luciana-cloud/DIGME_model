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
library("nlme")
library("car")
library("MuMIn")
library("cAIC4")
library("buildmer")
library("lmerTest")
library("lme4")

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

# Matlab database ---- 

write.csv(DIGME_mean, file="DIGME_mean.csv",col.names = F, row.names = F)
write.table(DIGME_mean.2, file="DIGME_mean.2.txt",col.names = F, row.names = F)

#  Statistical model ----

DIGME_clean.2 = DIGME_data[-c(7,14,21,28,35,42,49,56,63,70,77,84,91,98,105,112,
                            119,126),]
DIGME_clean.2 = DIGME_clean.2[c("SiteCode","RainTrt","FieldRep","CoreNum",
                            "ActualGWC","BD","Moist","DOC","MBC","SOM","Clay",
                            "CO2_eq")]
DIGME_clean.2$Clay = DIGME_clean.2$Clay/100
DIGME_clean.2      = DIGME_clean.2 %>% mutate(SOC = as.numeric(SOM)/1.72)
DIGME_clean.2      = DIGME_clean.2 %>% select(-c(SOM))

DIGME_clean.2$SOC[12]  = mean(DIGME_clean.2$SOC[1:36],na.rm=TRUE)
DIGME_clean.2$SOC[26]  = mean(DIGME_clean.2$SOC[1:36],na.rm=TRUE)
DIGME_clean.2$SOC[93]  = mean(DIGME_clean.2$SOC[73:108],na.rm=TRUE)
DIGME_clean.2$SOC[98]  = mean(DIGME_clean.2$SOC[73:108],na.rm=TRUE)
DIGME_clean.2$SOC[105] = mean(DIGME_clean.2$SOC[73:108],na.rm=TRUE)

SR = lme(log(as.numeric(CO2_eq)) ~ (I(as.numeric(ActualGWC)^2) + 
                                      BD + Clay + Clay:as.numeric(ActualGWC)),
         random = ~1 |SiteCode/RainTrt,data = DIGME_clean.2, method = "REML")
summary(SR)
Anova(SR)
AIC(SR)
r.squaredGLMM(SR)

qqnorm(residuals(SR))
scatter.smooth(residuals(SR) ~ fitted(SR))

# Predictions ----

x = seq(0.01,1,0.01) # simulated moisture levels

# Ayora.ES - Ambient
data_1 = as.data.frame(cbind(rep(c("Ayora.ES"),times=length(x)),
                             rep(c("Ambient"),times=length(x)),x,
                             rep(mean(DIGME_clean.2$BD[1:36]),times=length(x)),
                             rep(mean(as.numeric(DIGME_clean.2$MBC[1:36])),times=length(x)),
                             rep(mean(DIGME_clean.2$Clay[1:36]),times=length(x))))
colnames(data_1) = c("SiteCode","RainTrt","ActualGWC","BD","MBC","Clay")
# Ayora.ES - Drought
data_2 = as.data.frame(cbind(rep(c("Ayora.ES"),times=length(x)),
                             rep(c("Drought"),times=length(x)),x,
                             rep(mean(DIGME_clean.2$BD[1:36]),times=length(x)),
                             rep(mean(as.numeric(DIGME_clean.2$MBC[1:36])),times=length(x)),
                             rep(mean(DIGME_clean.2$Clay[1:36]),times=length(x))))
colnames(data_2) = c("SiteCode","RainTrt","ActualGWC","BD","MBC","Clay")
# brhill.au - Ambient
data_3 = as.data.frame(cbind(rep(c("brhill.au"),times=length(x)),
                             rep(c("Ambient"),times=length(x)),x,
                             rep(mean(DIGME_clean.2$BD[37:72]),times=length(x)),
                             rep(mean(as.numeric(DIGME_clean.2$MBC[37:72])),times=length(x)),
                             rep(mean(DIGME_clean.2$Clay[37:72]),times=length(x))))
colnames(data_3) = c("SiteCode","RainTrt","ActualGWC","BD","MBC","Clay")
# brhill.au - Drought
data_4 = as.data.frame(cbind(rep(c("brhill.au"),times=length(x)),
                             rep(c("Drought"),times=length(x)),x,
                             rep(mean(DIGME_clean.2$BD[37:72]),times=length(x)),
                             rep(mean(as.numeric(DIGME_clean.2$MBC[37:72])),times=length(x)),
                             rep(mean(DIGME_clean.2$Clay[37:72]),times=length(x))))
colnames(data_4) = c("SiteCode","RainTrt","ActualGWC","BD","MBC","Clay")
# brookdale.ca - Ambient
data_5 = as.data.frame(cbind(rep(c("brookdale.ca"),times=length(x)),
                             rep(c("Ambient"),times=length(x)),x,
                             rep(mean(DIGME_clean.2$BD[73:108]),times=length(x)),
                             rep(mean(as.numeric(DIGME_clean.2$MBC[73:108])),times=length(x)),
                             rep(mean(DIGME_clean.2$Clay[73:108]),times=length(x))))
colnames(data_5) = c("SiteCode","RainTrt","ActualGWC","BD","MBC","Clay")
# brookdale.ca - Drought
data_6 = as.data.frame(cbind(rep(c("brookdale.ca"),times=length(x)),
                             rep(c("Drought"),times=length(x)),x,
                             rep(mean(DIGME_clean.2$BD[73:108]),times=length(x)),
                             rep((mean(as.numeric(DIGME_clean.2$MBC[73:108]))),times=length(x)),
                             rep(mean(DIGME_clean.2$Clay[73:108]),times=length(x))))
colnames(data_6) = c("SiteCode","RainTrt","ActualGWC","BD","MBC","Clay")

data_pred.1 = as.data.frame(rbind(data_1,data_2,data_3,data_4,data_5,data_6))
coef(SR)

Ayora.A = exp(1.537484 + -24.25097*as.numeric(data_pred.1$ActualGWC[1:100])^2-1.31970*as.numeric(data_pred.1$BD[1:100])+
                -5.60175*as.numeric(data_pred.1$Clay[1:100])+51.43260*as.numeric(data_pred.1$ActualGWC[1:100])*as.numeric(data_pred.1$Clay[1:100])-0.5004749+
                -1.875535e-10)
Ayora.D = exp(1.537484 + -24.25097*as.numeric(data_pred.1$ActualGWC[101:200])^2-1.31970*as.numeric(data_pred.1$BD[101:200])+
                -5.60175*as.numeric(data_pred.1$Clay[101:200])+51.43260*as.numeric(data_pred.1$ActualGWC[101:200])*as.numeric(data_pred.1$Clay[101:200])-0.5004749+
                5.935189e-11)

brhill.A = exp(2.186923 + -24.25097*as.numeric(data_pred.1$ActualGWC[201:300])^2-1.31970*as.numeric(data_pred.1$BD[201:300])+
                 -5.60175*as.numeric(data_pred.1$Clay[201:300])+51.43260*as.numeric(data_pred.1$ActualGWC[201:300])*as.numeric(data_pred.1$Clay[201:300])+0.1489636+
                 6.281406e-10)
brhill.D = exp(2.186923 + -24.25097*as.numeric(data_pred.1$ActualGWC[301:400])^2-1.31970*as.numeric(data_pred.1$BD[301:400])+
                 -5.60175*as.numeric(data_pred.1$Clay[301:400])+51.43260*as.numeric(data_pred.1$ActualGWC[301:400])*as.numeric(data_pred.1$Clay[301:400])+0.1489636+
                 -5.899821e-10)

brookdale.A = exp(2.389470 + -24.25097*as.numeric(data_pred.1$ActualGWC[401:500])^2-1.31970*as.numeric(data_pred.1$BD[401:500])+
                    -5.60175*as.numeric(data_pred.1$Clay[401:500])+51.43260*as.numeric(data_pred.1$ActualGWC[401:500])*as.numeric(data_pred.1$Clay[401:500])+0.3515113+
                    -1.164293e-10)
brookdale.D = exp(2.389470 + -24.25097*as.numeric(data_pred.1$ActualGWC[501:600])^2-1.31970*as.numeric(data_pred.1$BD[501:600])+
                    -5.60175*as.numeric(data_pred.1$Clay[501:600])+51.43260*as.numeric(data_pred.1$ActualGWC[501:600])*as.numeric(data_pred.1$Clay[501:600])+0.3515113+
                    2.064724e-10)

# Plot total ----

par(mfrow = c(2, 3))
plot(x,Ayora.A,col="blue",ylim=range(0,6))
points(DIGME_mean$ActualGWC_m[1:6],DIGME_mean$CO2_eq_m[1:6],pch=15)
title(main="Ayora Ambient",xlab = "moisture",ylab = "respiration")
plot(x,Ayora.D,col="red",ylim=range(0,6))
points(DIGME_mean$ActualGWC_m[7:12],DIGME_mean$CO2_eq_m[7:12],pch=15)
title(main="Ayora Drought",xlab = "moisture",ylab = "respiration")
plot(x,brhill.A,col="blue",ylim=range(0,3))
points(DIGME_mean$ActualGWC_m[13:18],DIGME_mean$CO2_eq_m[13:18],pch=15)
title(main="Brhill Ambient",xlab = "moisture",ylab = "respiration")
plot(x,brhill.D,col="red",ylim=range(0,3))
points(DIGME_mean$ActualGWC_m[19:24],DIGME_mean$CO2_eq_m[19:24],pch=15)
title(main="Brhill Drought",xlab = "moisture",ylab = "respiration")
plot(x,brookdale.A,col="blue",ylim=range(0,85))
points(DIGME_mean$ActualGWC_m[25:30],DIGME_mean$CO2_eq_m[25:30],pch=15)
title(main="Brookdale Ambient",xlab = "moisture",ylab = "respiration")
plot(x,brookdale.D,col="red",ylim=range(0,85))
points(DIGME_mean$ActualGWC_m[31:36],DIGME_mean$CO2_eq_m[31:36],pch=15)
title(main="Brookdale Drought",xlab = "moisture",ylab = "respiration")
par(mfrow = c(1, 1))

# Models per site ----

DIGME_ayora     = DIGME_clean.2 %>% filter(SiteCode=="Ayora.ES")
DIGME_brhill    = DIGME_clean.2 %>% filter(SiteCode=="brhill.au")
DIGME_brookdale = DIGME_clean.2 %>% filter(SiteCode=="brookdale.ca")

# Ayora ----

ayora_lmer = lmer(log(as.numeric(CO2_eq)) ~ (I(as.numeric(ActualGWC)) + 
                                  I(as.numeric(ActualGWC)^2) + 
                                  I(as.numeric(ActualGWC)^3) + 
                                  (BD+Clay+SOC)*(as.numeric(ActualGWC)))+(1|RainTrt),
                    data = DIGME_ayora)

summary(ayora_lmer)
Anova(ayora_lmer)
AIC(ayora_lmer)
r.squaredGLMM(ayora_lmer)

qqnorm(residuals(ayora_lmer))
scatter.smooth(residuals(ayora_lmer) ~ fitted(ayora_lmer))

coef(ayora_lmer)

# Ayora - reduced ----

ayora_lmer.1 = lmer(log(as.numeric(CO2_eq)) ~ (as.numeric(BD) + as.numeric(MBC) +
                                                 (as.numeric(ActualGWC)))+(1|RainTrt),
                  data = DIGME_ayora)
summary(ayora_lmer.1)
Anova(ayora_lmer.1)
AIC(ayora_lmer.1)
r.squaredGLMM(ayora_lmer.1)

qqnorm(residuals(ayora_lmer.1))
scatter.smooth(residuals(ayora_lmer.1) ~ fitted(ayora_lmer.1))

coef(ayora_lmer.1)

Ayora.A.1 = exp(0.2159447-0.7024237*as.numeric(data_pred.1$BD[1:100])+
                  0.4780228*as.numeric(data_pred.1$MBC[1:100])+
                  4.219912*as.numeric(data_pred.1$ActualGWC[1:100]))
Ayora.D.1 = exp(0.2159447-0.7024237*as.numeric(data_pred.1$BD[101:200])+
                  0.4780228*as.numeric(data_pred.1$MBC[101:200])+
                  4.219912*as.numeric(data_pred.1$ActualGWC[101:200]))

# Brhill ----

brhill_lmer = lmer(log(as.numeric(CO2_eq)) ~ (I(as.numeric(ActualGWC)) + 
                                               I(as.numeric(ActualGWC)^2) + 
                                               I(as.numeric(ActualGWC)^3) + 
                                               (BD+Clay+SOC+as.numeric(MBC))*(as.numeric(ActualGWC)))+(1|RainTrt),
                  data = DIGME_brhill)

summary(brhill_lmer)
Anova(brhill_lmer)
AIC(brhill_lmer)
r.squaredGLMM(brhill_lmer)

qqnorm(residuals(brhill_lmer))
scatter.smooth(residuals(brhill_lmer) ~ fitted(brhill_lmer))

# Brhill - reduced ----

brhill_lmer.1 = lmer(log(as.numeric(CO2_eq)) ~ (I(as.numeric(ActualGWC)^2) + 
                                                I(as.numeric(ActualGWC)))+(1|RainTrt),
                   data = DIGME_brhill)

summary(brhill_lmer.1)
Anova(brhill_lmer.1)
AIC(brhill_lmer.1)
r.squaredGLMM(brhill_lmer.1)

qqnorm(residuals(brhill_lmer.1))
scatter.smooth(residuals(brhill_lmer.1) ~ fitted(brhill_lmer.1))
coef(brhill_lmer.1)

brhill.A.1 = exp(-1.636333-176.5436*(as.numeric(data_pred.1$ActualGWC[201:300])^2)
                 +34.67014*(as.numeric(data_pred.1$ActualGWC[201:300])))
brhill.D.1 = exp(-1.704150-176.5436*(as.numeric(data_pred.1$ActualGWC[301:400])^2)
                 +34.67014*(as.numeric(data_pred.1$ActualGWC[301:400])))

# Brookdale ----

brookdale_lmer = lmer(log(as.numeric(CO2_eq)) ~ (I(as.numeric(ActualGWC)) + 
                                                I(as.numeric(ActualGWC)^2) + 
                                                I(as.numeric(ActualGWC)^3) + 
                                                (BD+Clay+SOC+as.numeric(MBC))*(as.numeric(ActualGWC)))+(1|RainTrt),
                   data = DIGME_brookdale)

summary(brookdale_lmer)
Anova(brookdale_lmer)
AIC(brookdale_lmer)
r.squaredGLMM(brookdale_lmer)

qqnorm(residuals(brookdale_lmer))
scatter.smooth(residuals(brookdale_lmer) ~ fitted(brookdale_lmer))

# Brookdale - reduced ----

brookdale_lmer.1 = lmer(log(as.numeric(CO2_eq)) ~ I(as.numeric(ActualGWC)) + BD + 
                          (1|RainTrt),
                      data = DIGME_brookdale)

summary(brookdale_lmer.1)
Anova(brookdale_lmer.1)
AIC(brookdale_lmer.1)
r.squaredGLMM(brookdale_lmer.1)

qqnorm(residuals(brookdale_lmer.1))
scatter.smooth(residuals(brookdale_lmer.1) ~ fitted(brookdale_lmer.1))

coef(brookdale_lmer.1)

brookdale.A.1 = exp(4.252245+1.987822*as.numeric(data_pred.1$ActualGWC[401:500])
                    -2.74693*as.numeric(data_pred.1$BD[401:500]))
brookdale.D.1 = exp(4.252245+1.987822*as.numeric(data_pred.1$ActualGWC[501:600])
                    -2.74693*as.numeric(data_pred.1$BD[501:600]))

# Plot single ----

par(mfrow = c(2, 3))
plot(x,Ayora.A.1,col="blue",ylim=range(0,6))
points(DIGME_mean$ActualGWC_m[1:6],DIGME_mean$CO2_eq_m[1:6],pch=15)
title(main="Ayora Ambient",xlab = "moisture",ylab = "respiration")
plot(x,Ayora.D.1,col="red",ylim=range(0,6))
points(DIGME_mean$ActualGWC_m[7:12],DIGME_mean$CO2_eq_m[7:12],pch=15)
title(main="Ayora Drought",xlab = "moisture",ylab = "respiration")
plot(x,brhill.A.1,col="blue",ylim=range(0,3))
points(DIGME_mean$ActualGWC_m[13:18],DIGME_mean$CO2_eq_m[13:18],pch=15)
title(main="Brhill Ambient",xlab = "moisture",ylab = "respiration")
plot(x,brhill.D.1,col="red",ylim=range(0,3))
points(DIGME_mean$ActualGWC_m[19:24],DIGME_mean$CO2_eq_m[19:24],pch=15)
title(main="Brhill Drought",xlab = "moisture",ylab = "respiration")
plot(x,brookdale.A.1,col="blue",ylim=range(0,85))
points(DIGME_mean$ActualGWC_m[25:30],DIGME_mean$CO2_eq_m[25:30],pch=15)
title(main="Brookdale Ambient",xlab = "moisture",ylab = "respiration")
plot(x,brookdale.D.1,col="red",ylim=range(0,85))
points(DIGME_mean$ActualGWC_m[31:36],DIGME_mean$CO2_eq_m[31:36],pch=15)
title(main="Brookdale Drought",xlab = "moisture",ylab = "respiration")
par(mfrow = c(1, 1))
