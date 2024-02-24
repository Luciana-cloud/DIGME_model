%% Plotting DAMM %%

Data    = load("DIGME_mean.2.txt");

%%

load('Ayora_ambient.mat');
x1     = linspace(0.04,0.425,42);
SR_a_a = plotting_DAMM(x1,p);
x_1    = Data(1:6,2)*100;
SR_1o  = Data(1:6,8);
SR_1sd = Data(1:6,9)/sqrt(length(x_1));

load('Ayora_drought.mat');
x2     = linspace(0.04,0.427,42.5);
SR_a_d = plotting_DAMM(x2,p);
x_2    = Data(7:12,2)*100;
SR_2o  = Data(7:12,8);
SR_2sd = Data(7:12,9)/sqrt(length(x_2));

load('brhill_ambient.mat');
x3     = linspace(0.04,0.426,45);
SR_b_a = plotting_DAMM(x3,p);
x_3    = Data(13:18,2)*100;
SR_3o  = Data(13:18,8);
SR_3sd = Data(13:18,9)/sqrt(length(x_3));

load('brhill_drought.mat');
x4     = linspace(0.04,0.425,42);
SR_b_d = plotting_DAMM(x4,p);
x_4    = Data(19:24,2)*100;
SR_4o  = Data(19:24,8);
SR_4sd = Data(19:24,9)/sqrt(length(x_4));

load('brookdale_ambient.mat');
x5      = linspace(0.04,0.427,43);
SR_br_a = plotting_DAMM(x5,p);
x_5     = Data(25:30,2)*100;
SR_5o   = Data(25:30,8);
SR_5sd  = Data(25:30,9)/sqrt(length(x_5));

load('brookdale_drought.mat');
x6      = linspace(0.04,0.427,43);
SR_br_d = plotting_DAMM(x6,p);
x_6     = Data(31:36,2)*100;
SR_6o   = Data(31:36,8);
SR_6sd  = Data(31:36,9)/sqrt(length(x_6));

%%

fig = figure;
subplot(2,3,1);
plot(x1*100,SR_a_a)
hold on
errorbar(x_1,SR_1o,SR_1sd,"*")
ylim([0 7])
title('Ayora Ambient')
xlabel('Soil moisture (%)')
ylabel('Respiration (CO2 ug/g/h)')

subplot(2,3,2);
plot(x2*100,SR_a_d)
hold on
errorbar(x_2,SR_2o,SR_2sd,"*")
ylim([0 7])
title('Ayora Drought')
xlabel('Soil moisture (%)')
ylabel('Respiration (CO2 ug/g/h)')

subplot(2,3,3);
plot(x3*100,SR_b_a)
hold on
errorbar(x_3,SR_3o,SR_3sd,"*")
ylim([0 3])
title('Brhill Ambient')
xlabel('Soil moisture (%)')
ylabel('Respiration (CO2 ug/g/h)')

subplot(2,3,4);
plot(x4*100,SR_b_d)
hold on
errorbar(x_4,SR_4o,SR_4sd,"*")
ylim([0 3])
title('Brhill Drought')
xlabel('Soil moisture (%)')
ylabel('Respiration (CO2 ug/g/h)')

subplot(2,3,5);
plot(x5*100,SR_br_a)
hold on
errorbar(x_5,SR_5o,SR_5sd,"*")
ylim([0 90])
title('Brookdale Ambient')
xlabel('Soil moisture (%)')
ylabel('Respiration (CO2 ug/g/h)')

subplot(2,3,6);
plot(x6*100,SR_br_d)
hold on
errorbar(x_6,SR_6o,SR_6sd,"*")
ylim([0 90])
title('Brookdale Drought')
xlabel('Soil moisture (%)')
ylabel('Respiration (CO2 ug/g/h)')

%%
