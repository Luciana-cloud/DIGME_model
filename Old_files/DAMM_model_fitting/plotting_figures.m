%% Plotting models %%

data        = load("data_manzoni_matlab.txt");

%% DAMM model results

load('Ayora_ambient_DAMM.mat','p')

q(1)   = 1.008598957;           % Bulk density [kg/m3] Ayora
q(2)   = 30.99430/100;                 % Clay content [%] Ayora
q(7)   = 0.0832;  % Concentration of SOC [%] Ayora
q(8)   = 2.0375;                     % Particle density [kg/m3] brookdale
rho_b       = q(1); % Bulk density [kg/m3]
pd          = q(8); % Particle density [kg/m3]
phi         = 1 - (rho_b/pd);
x1     = linspace(0.05,0.45,100);
SR_a_a = plotting_DAMM(x1,p,q);
x_s         = x1/phi;
x_1    = data(1:17,2)/phi; % Ayora.ES - Ambient
max_f       = max(data(1:17,4)); % Ayora.ES - Ambient - maximum respiration
SR_obs      = data(1:17,4)/max_f; % Ayora.ES - Ambient
SR_sd       = data(1:17,5)/max_f; % Ayora.ES - Ambient

load('Ayora_drought_DAMM.mat')
q(1)   = 1.008598957;           % Bulk density [kg/m3] Ayora
q(2)   = 30.99430/100;                 % Clay content [%] Ayora
q(7)   = 0.0832;  % Concentration of SOC [%] Ayora
q(8)   = 2.0375;                     % Particle density [kg/m3] brookdale
rho_b       = q(1); % Bulk density [kg/m3]
pd          = q(8); % Particle density [kg/m3]
phi         = 1 - (rho_b/pd);
x1     = linspace(0.05,0.45,100);
SR_a_a_1 = plotting_DAMM(x1,p,q);
x_s_1         = x1/phi;
x_1_1         = data(18:34,2)/phi; % Ayora.ES - Ambient
max_f         = max(data(18:34,4)); % Ayora.ES - Ambient - maximum respiration
SR_obs_1      = data(18:34,4)/max_f; % Ayora.ES - Ambient
SR_sd_1       = data(18:34,5)/max_f; % Ayora.ES - Ambient

load('brhill_ambient.mat');
x3     = linspace(0.018,0.35,45);
q(1)   = mean(Data(13:24,4));          % Bulk density [kg/m3] brhill
q(2)   = 10.26311/100;                 % Clay content [%] brhill
q(7)   = mean(Data(13:24,12))/1.72/100; % Concentration of SOC [%] brhill
q(8)   = 2.729225;                     % Particle density [kg/m3] brhill
SR_b_a = plotting_DAMM(x3,p,q);
x_3    = Data(13:18,2)*100;
SR_3o  = Data(13:18,8);
SR_3sd = Data(13:18,9)/sqrt(length(x_3));

load('brhill_drought.mat');
x4     = linspace(0.0175,0.35,42);
q(1)   = mean(Data(13:24,4));          % Bulk density [kg/m3] brhill
q(2)   = 10.26311/100;                 % Clay content [%] brhill
q(7)   = mean(Data(13:24,12))/1.72/100; % Concentration of SOC [%] brhill
q(8)   = 2.729225;                     % Particle density [kg/m3] brhill
SR_b_d = plotting_DAMM(x4,p,q);
x_4    = Data(19:24,2)*100;
SR_4o  = Data(19:24,8);
SR_4sd = Data(19:24,9)/sqrt(length(x_4));

load('brookdale_ambient.mat');
x5      = linspace(0.025,0.685,80);
q(1)    = mean(Data(25:36,4));          % Bulk density [kg/m3] brookdale
q(2)    = 39.77977/100;                 % Clay content [%] brookdale
q(7)    = mean(Data(25:36,12))/1.72/100; % Concentration of SOC [%] brookdale
q(8)    = 1.939333;                     % Particle density [kg/m3] brookdale
SR_br_a = plotting_DAMM(x5,p,q);
x_5     = Data(25:30,2)*100;
SR_5o   = Data(25:30,8);
SR_5sd  = Data(25:30,9)/sqrt(length(x_5));

load('brookdale_drought.mat');
x6      = linspace(0.025,0.6859,100);
q(1)    = mean(Data(25:36,4));          % Bulk density [kg/m3] brookdale
q(2)    = 39.77977/100;                 % Clay content [%] brookdale
q(7)    = mean(Data(25:36,12))/1.72/100; % Concentration of SOC [%] brookdale
q(8)    = 1.939333;                     % Particle density [kg/m3] brookdale
SR_br_d = plotting_DAMM(x6,p,q);
x_6     = Data(31:36,2)*100;
SR_6o   = Data(31:36,8);
SR_6sd  = Data(31:36,9)/sqrt(length(x_6));

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

%% Niche model results

x1       = linspace(0.01,1.0,100);

load('Ayora_ambient_NICHE.mat')
Res_a_a  = NICHE_model(x1,p);

load('Ayora_drought_NICHE.mat')
Res_a_d  = NICHE_model(x1,p);

load('brhill_ambient_NICHE.mat')
Res_b_a  = NICHE_model(x1,p);

load('brhill_drought_NICHE.mat')
Res_b_d  = NICHE_model(x1,p);

load('brookdale_ambient_NICHE.mat')
Res_br_a = NICHE_model(x1,p);

load('brookdale_drought_NICHE.mat')
Res_br_d = NICHE_model(x1,p);

fig = figure;
subplot(2,3,1);
plot(x1*100,Res_a_a)
hold on
errorbar(x_1,SR_1o,SR_1sd,"*")
ylim([0 7])
title('Ayora Ambient')
xlabel('Soil moisture (%)')
ylabel('Respiration (CO2 ug/g/h)')

subplot(2,3,2);
plot(x1*100,Res_a_d)
hold on
errorbar(x_2,SR_2o,SR_2sd,"*")
ylim([0 7])
title('Ayora Drought')
xlabel('Soil moisture (%)')
ylabel('Respiration (CO2 ug/g/h)')

subplot(2,3,3);
plot(x1*100,Res_b_a)
hold on
errorbar(x_3,SR_3o,SR_3sd,"*")
ylim([0 3])
title('Brhill Ambient')
xlabel('Soil moisture (%)')
ylabel('Respiration (CO2 ug/g/h)')

subplot(2,3,4);
plot(x1*100,Res_b_d)
hold on
errorbar(x_4,SR_4o,SR_4sd,"*")
ylim([0 3])
title('Brhill Drought')
xlabel('Soil moisture (%)')
ylabel('Respiration (CO2 ug/g/h)')

subplot(2,3,5);
plot(x1*100,Res_br_a)
hold on
errorbar(x_5,SR_5o,SR_5sd,"*")
ylim([0 90])
title('Brookdale Ambient')
xlabel('Soil moisture (%)')
ylabel('Respiration (CO2 ug/g/h)')

subplot(2,3,6);
plot(x1*100,Res_br_d)
hold on
errorbar(x_6,SR_6o,SR_6sd,"*")
ylim([0 90])
title('Brookdale Drought')
xlabel('Soil moisture (%)')
ylabel('Respiration (CO2 ug/g/h)')
