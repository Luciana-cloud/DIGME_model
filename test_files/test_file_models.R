# Testing Linear models----
manzoni.data.soil   = read_sheet("https://docs.google.com/spreadsheets/d/11UcwPIUcppmXzKzgOYo5hxTk9k0C8-fFI90dpxdOQ9w/edit?gid=0#gid=0")
manzoni.data.soil.1 = manzoni.data.soil %>% select("Site","RainTrt","alpha",
                                                   "sample.size","performance",
                                                   "mean.pH","mean.DOC","mean.MBC",
                                                   "mean.SOM","mean.MAP","mean.MAP_CV",
                                                   "mean.MAT","USDA_class")
# Normalize data
manzoni.data.soil.1[,c(4,6:12)] = scale(manzoni.data.soil.1[,c(4,6:12)])

# Model Performance----
# https://statsandr.com/blog/binary-logistic-regression-in-r/
model_performance   = glm(performance ~ (RainTrt + sample.size + mean.MAP +
                                           mean.MAT + mean.DOC + mean.SOM)^2, 
                          data = manzoni.data.soil.1, family = binomial)
summary(model_performance)

# select best model according to AIC using mixed selection
model_performance.red      = step(model_performance,
                                  direction = "both", # both = mixed selection
                                  trace     = FALSE) # do not display intermediate steps
summary(model_performance.red)

# Parameter ranking
dominance_performance.red  = domin(performance ~ 1, 
                                   glm, 
                                   list(function(x) list(aic = extractAIC(x)[[2]]), "aic"), 
                                   data = manzoni.data.soil.1, 
                                   sets = list("RainTrt","sample.size","mean.MAP",
                                               "mean.MAT","mean.DOC","mean.SOM",
                                               "RainTrt:sample.size","RainTrt:mean.DOC ",
                                               "RainTrt:mean.SOM", "sample.size:mean.MAP",
                                               "sample.size:mean.MAT", "mean.MAP:mean.MAT",
                                               "mean.MAP:mean.DOC", "mean.MAP:mean.SOM")) 
dominance_performance.red

# Model for alpha parameter (Other factors) Filter for only good performance fits----
manzoni.data.soil.2 = manzoni.data.soil.1 %>% filter(performance == 1)
model_alpha         = lm(alpha ~ (RainTrt + mean.MAP + mean.MAT + 
                                    mean.DOC + mean.SOM + mean.pH)^2, 
                         data = manzoni.data.soil.2)
summary(model_alpha)
plot(model_alpha, which = 1:6)

model_alpha.red         = step(model_alpha,
                               direction = "both", # both = mixed selection
                               trace     = FALSE) # do not display intermediate steps
summary(model_alpha.red)
plot(model_alpha.red, which = 1:6)

# Parameter Ranking
dominance_alpha.red  = domin(alpha ~  1 ,
                             lm,
                             list("summary", "r.squared"),
                             data = manzoni.data.soil.2,
                             sets = list("RainTrt","mean.MAP","mean.pH",
                                         "mean.MAT","mean.DOC","mean.SOM","RainTrt:mean.MAP",
                                         "RainTrt:mean.DOC","RainTrt:mean.SOM","mean.MAP:mean.MAT",
                                         "mean.MAP:mean.SOM","mean.MAT:mean.DOC","mean.MAT:mean.SOM",
                                         "mean.MAT:mean.pH","mean.DOC:mean.pH"))
dominance_alpha.red

# Model for alpha parameter (site+treatment)----
test_alpha = lm((alpha) ~ (RainTrt + Site),data = manzoni.data.soil.1)

# QQ-Plot
par(mfrow = c(1, 2)) # combine plots
# 1. Homogeneity of variances
plot(test_alpha, which = 3)
# 2. Normality
plot(test_alpha, which = 2)
par(mfrow = c(1, 1))

summary(test_alpha)

# Plots
ggplot(manzoni.data.soil.1) +
  aes(x = RainTrt, y = alpha, color = as.factor(performance)) +
  geom_point(size = 3) + facet_wrap(vars(Site)) + labs(color = "Performance") + 
  scale_x_discrete(name ="Rain Treatment") + theme(text = element_text(size=20))

ggplot(manzoni.data.soil.1) +
  aes(x = RainTrt, y = alpha, color = as.factor(performance)) +
  geom_point(size = 3) + facet_wrap(vars(sort(unlist(USDA_class)))) + labs(color = "Performance") + 
  scale_x_discrete(name ="Rain Treatment") + theme(text = element_text(size=20))

# Exploration plots

# Plots
ph_figure = ggplot(manzoni.data.soil) +
  aes(x = mean.pH, y = alpha, color = as.factor(performance)) +
  geom_point(size = 3) + labs(color = "Performance") + 
  scale_x_discrete(name ="pH") + theme(text = element_text(size=20))

png("C:/luciana_datos/UCI/Project_13 (DIGME)/DIGME_model/Figures/exploratory_figures/ph_figure.png",
    width=3500*1.35,height=1969*1.35,res=300)
print(ph_figure)
dev.off()

MAP_figure = ggplot(manzoni.data.soil) +
  aes(x = mean.MAP, y = alpha, color = as.factor(performance)) +
  geom_point(size = 3) + labs(color = "Performance") + 
  scale_x_discrete(name ="Mean Precipitation") + theme(text = element_text(size=20))

png("C:/luciana_datos/UCI/Project_13 (DIGME)/DIGME_model/Figures/exploratory_figures/MAP_figure.png",
    width=3500*1.35,height=1969*1.35,res=300)
print(MAP_figure)
dev.off()

MAT_figure = ggplot(manzoni.data.soil) +
  aes(x = mean.MAT, y = alpha, color = as.factor(performance)) +
  geom_point(size = 3) + labs(color = "Performance") + 
  scale_x_discrete(name ="Mean Temperature") + theme(text = element_text(size=20))

png("C:/luciana_datos/UCI/Project_13 (DIGME)/DIGME_model/Figures/exploratory_figures/MAT_figure.png",
    width=3500*1.35,height=1969*1.35,res=300)
print(MAT_figure)
dev.off()

sand_figure = ggplot(manzoni.data.soil) +
  aes(x = mean_sand, y = alpha, color = as.factor(performance)) +
  geom_point(size = 3) + labs(color = "Performance") + 
  scale_x_discrete(name ="Sand (%)") + theme(text = element_text(size=20))

png("C:/luciana_datos/UCI/Project_13 (DIGME)/DIGME_model/Figures/exploratory_figures/sand_figure.png",
    width=3500*1.35,height=1969*1.35,res=300)
print(sand_figure)
dev.off()

clay_figure = ggplot(manzoni.data.soil) +
  aes(x = mean_clay, y = alpha, color = as.factor(performance)) +
  geom_point(size = 3) + labs(color = "Performance") + 
  scale_x_discrete(name ="Clay (%)") + theme(text = element_text(size=20))

png("C:/luciana_datos/UCI/Project_13 (DIGME)/DIGME_model/Figures/exploratory_figures/clay_figure.png",
    width=3500*1.35,height=1969*1.35,res=300)
print(clay_figure)
dev.off()

DOC_figure = ggplot(manzoni.data.soil) +
  aes(x = mean.DOC, y = alpha, color = as.factor(performance)) +
  geom_point(size = 3) + labs(color = "Performance") + 
  scale_x_discrete(name ="DOC") + theme(text = element_text(size=20))

png("C:/luciana_datos/UCI/Project_13 (DIGME)/DIGME_model/Figures/exploratory_figures/DOC_figure.png",
    width=3500*1.35,height=1969*1.35,res=300)
print(DOC_figure)
dev.off()

