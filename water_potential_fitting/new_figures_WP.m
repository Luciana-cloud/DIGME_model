%% 

Data          = load("water_pontential_conversion.txt");
Data_t        = load("water_pontential_trt_level.txt");
Data_wo       = load("water_pontential_conversion_obs.txt");

%%
% SAND %

% Rio Mayo Ambient 
load('rio_mayo_WP_ambient.mat')
WP_obs      = (Data(1:6,3));  
WC_obs      = Data(1:6,1);
WC_sd       = Data(1:6,2);
WP_sim      = (linspace(1,3300,3300));
WC_sim      = van_genuchten(WP_sim,p);

fig = figure;
subplot(3,4,1);
plot(WC_sim,log10(WP_sim))
hold on
plot(WC_obs,log10(WP_obs),"*")
% title('Rio Mayo - Ambient (C)')
title('Rio Mayo - Ambient')
xlabel('Soil moisture [g/g]')
ylabel('Log10(Water Potential) [kPa]')
xlim([0.01 0.85])

% Rio Mayo Drought 
load('rio_mayo_WP_drought.mat')
WP_obs      = (Data(7:12,3));  
WC_obs      = Data(7:12,1);
WC_sd       = Data(7:12,2);
WP_sim      = (linspace(1,3300,3300));
WC_sim      = van_genuchten(WP_sim,p);

subplot(3,4,2);
plot(WC_sim,log10(WP_sim))
hold on
plot(WC_obs,log10(WP_obs),"*")
% title('Rio Mayo - Drought (V)')
title('Rio Mayo - Drought')
xlabel('Soil moisture [g/g]')
ylabel('Log10(Water Potential) [kPa]')
xlim([0.01 0.85])

% Hoide Ambient 
load('Hoide_WP_ambient.mat')
WP_obs      = (Data(97:102,3));  
WC_obs      = Data(97:102,1);
WC_sd       = Data(97:102,2);
WP_sim      = (linspace(1,3300,3300));
WC_sim      = van_genuchten(WP_sim,p);

subplot(3,4,3);
plot(WC_sim,log10(WP_sim))
hold on
plot(WC_obs,log10(WP_obs),"*")
% title('Hoide - Ambient (C)')
title('Hoide - Ambient')
xlabel('Soil moisture [g/g]')
ylabel('Log10(Water Potential) [kPa]')
xlim([0.01 0.85])

% Hoide Drought 
load('Hoide_WP_drought.mat')
WP_obs      = (Data(103:108,3));  
WC_obs      = Data(103:108,1);
WC_sd       = Data(103:108,2);
WP_sim      = (linspace(1,3300,3300));
WC_sim      = van_genuchten(WP_sim,p);

subplot(3,4,4);
plot(WC_sim,log10(WP_sim))
hold on
plot(WC_obs,log10(WP_obs),"*")
% title('Hoide - Drought (V)')
title('Hoide - Drought')
xlabel('Soil moisture [g/g]')
ylabel('Log10(Water Potential) [kPa]')
xlim([0.01 0.85])

% Horacg Costa Rica Ambient 
load('Horacg_WP_ambient.mat')
WP_obs      = Data_t(61:66,2);  
WC_obs      = Data_t(61:66,1);
WP_sim      = (linspace(1,3300,3300));
WC_sim      = van_genuchten(WP_sim,p);

subplot(3,4,5);
plot(WC_sim,log10(WP_sim))
hold on
plot(WC_obs,log10(WP_obs),"*")
% title('Horacg Costa Rica - Ambient (C)')
title('Horacg Costa Rica - Ambient')
xlabel('Soil moisture [g/g]')
ylabel('Log10(Water Potential) [kPa]')
xlim([0.01 0.85])

% Horacg Costa Rica Drought 
load('Horacg_WP_drought.mat')
WP_obs      = Data_t(67:72,2);  
WC_obs      = Data_t(67:72,1);
WP_sim      = (linspace(1,3300,3300));
WC_sim      = van_genuchten(WP_sim,p);

subplot(3,4,6);
plot(WC_sim,log10(WP_sim))
hold on
plot(WC_obs,log10(WP_obs),"*")
% title('Horacg Costa Rica - Drought (V)')
title('Horacg Costa Rica - Drought')
xlabel('Soil moisture [g/g]')
ylabel('Log10(Water Potential) [kPa]')
xlim([0.01 0.85])

% Savann Ambient 
load('Savann_WP_ambient.mat')
WP_obs      = (Data(61:66,3));  
WC_obs      = Data(61:66,1);
WC_sd       = Data(61:66,2);
WP_sim      = (linspace(1,3300,3300));
WC_sim      = van_genuchten(WP_sim,p);

subplot(3,4,7);
plot(WC_sim,log10(WP_sim))
hold on
plot(WC_obs,log10(WP_obs),"*")
% title('Savann - Ambient (C)')
title('Savann - Ambient')
xlabel('Soil moisture [g/g]')
ylabel('Log10(Water Potential) [kPa]')
xlim([0.01 0.85])

% Savann Drought 
load('Savann_WP_drought.mat')
WP_obs      = Data(67:72,3);  
WC_obs      = Data(67:72,1);
WC_sd       = Data(67:72,2);
WP_sim      = (linspace(1,3300,3300));
WC_sim      = van_genuchten(WP_sim,p);

subplot(3,4,8);
plot(WC_sim,log10(WP_sim))
hold on
plot(WC_obs,log10(WP_obs),"*")
% title('Savann - Drought (V)')
title('Savann - Drought')
xlabel('Soil moisture [g/g]')
ylabel('Log10(Water Potential) [kPa]')
xlim([0.01 0.85])

% Hyide Ambient 
load('hyide_WP_ambient.mat')
WP_obs      = Data_wo(25:30,3);  
WC_obs      = Data_wo(25:30,1);
WP_sim      = (linspace(1,3300,3300));
WC_sim      = van_genuchten(WP_sim,p);

subplot(3,4,9);
plot(WC_sim,log10(WP_sim))
hold on
plot(WC_obs,log10(WP_obs),"*")
% title('Hyide - Ambient (C)')
title('Hyide - Ambient')
xlabel('Soil moisture [g/g]')
ylabel('Log10(Water Potential) [kPa]')
xlim([0.01 0.85])

% Hyide Drought 
load('hyide_WP_drought.mat')
WP_obs      = Data_wo(31:36,3);  
WC_obs      = Data_wo(31:36,1);
WP_sim      = (linspace(1,3300,3300));
WC_sim      = van_genuchten(WP_sim,p);

subplot(3,4,10);
plot(WC_sim,log10(WP_sim))
hold on
plot(WC_obs,log10(WP_obs),"*")
% title('Hyide - Drought (V)')
title('Hyide - Drought')
xlabel('Soil moisture [g/g]')
ylabel('Log10(Water Potential) [kPa]')
xlim([0.01 0.85])

sgtitle('SAND SOILS') 

%%

% LOAMY SAND %

fig = figure;

% Dona Ana Ambient 
load('Dona_Ana_WP_ambient.mat')
WP_obs      = (Data_t(13:18,2));  
WC_obs      = Data_t(13:18,1);
WP_sim      = (linspace(1,3300,3300));
WC_sim      = van_genuchten(WP_sim,p);

subplot(2,2,1);
plot(WC_sim,log10(WP_sim))
hold on
plot(WC_obs,log10(WP_obs),"*")
% title('Dona Ana - Ambient (C)')
title('Dona Ana - Ambient')
xlabel('Soil moisture [g/g]')
ylabel('Log10(Water Potential) [kPa]')
xlim([0.01 0.85])

% Dona Ana Drought 
load('Dona_Ana_WP_drought.mat')
WP_obs      = (Data_t(19:24,2));  
WC_obs      = Data_t(19:24,1);
WP_sim      = (linspace(1,3300,3300));
WC_sim      = van_genuchten(WP_sim,p);

subplot(2,2,2);
plot(WC_sim,log10(WP_sim))
hold on
plot(WC_obs,log10(WP_obs),"*")
% title('Dona Ana - Drought (V)')
title('Dona Ana - Drought')
xlabel('Soil moisture [g/g]')
ylabel('Log10(Water Potential) [kPa]')
xlim([0.01 0.85])

% Sev.Mix Ambient 
load('Sev_Mix_WP_ambient.mat')
WP_obs      = (Data_t(49:54,2));  
WC_obs      = Data_t(49:54,1);
WP_sim      = (linspace(1,3300,3300));
WC_sim      = van_genuchten(WP_sim,p);

subplot(2,2,3);
plot(WC_sim,log10(WP_sim))
hold on
plot(WC_obs,log10(WP_obs),"*")
% title('Sev.Mix - Ambient (C)')
title('Sev.Mix - Ambient')
xlabel('Soil moisture [g/g]')
ylabel('Log10(Water Potential) [kPa]')
xlim([0.01 0.85])

% Sev.Mix Drought 
load('Sev_Mix_WP_drought.mat')
WP_obs      = Data_t(55:60,2);  
WC_obs      = Data_t(55:60,1);
WP_sim      = (linspace(1,3300,3300));
WC_sim      = van_genuchten(WP_sim,p);

subplot(2,2,4);
plot(WC_sim,log10(WP_sim))
hold on
plot(WC_obs,log10(WP_obs),"*")
% title('Sev.Mix - Drought (V)')
title('Sev.Mix - Drought')
xlabel('Soil moisture [g/g]')
ylabel('Log10(Water Potential) [kPa]')
xlim([0.01 0.85])

sgtitle('LOAMY SAND SOILS') 

%%

% SANDY LOAM %

fig = figure;

% Brhill Ambient 
load('Brhill_WP_ambient.mat')
WP_obs      = (Data(25:30,3));  
WC_obs      = Data(25:30,1);
WC_sd       = Data(25:30,2);
WP_sim      = (linspace(1,3300,3300));
WC_sim      = van_genuchten(WP_sim,p);

subplot(3,4,1);
plot(WC_sim,log10(WP_sim))
hold on
plot(WC_obs,log10(WP_obs),"*")
% title('Brhill - Ambient (C)')
title('Brhill - Ambient')
xlabel('Soil moisture [g/g]')
ylabel('Log10(Water Potential) [kPa]')
xlim([0.01 0.85])

% Brhill Drought 
load('Brhill_WP_drought.mat')
WP_obs      = (Data(31:36,3));  
WC_obs      = Data(31:36,1);
WC_sd       = Data(31:36,2);
WP_sim      = (linspace(1,3300,3300));
WC_sim      = van_genuchten(WP_sim,p);

subplot(3,4,2);
plot(WC_sim,log10(WP_sim))
hold on
plot(WC_obs,log10(WP_obs),"*")
% title('Brhill - Drought (V)')
title('Brhill - Drought')
xlabel('Soil moisture [g/g]')
ylabel('Log10(Water Potential) [kPa]')
xlim([0.01 0.85])

% Passogavia Ambient 
load('Passogavia_WP_ambient.mat')
WP_obs      = (Data_t(1:6,2));  
WC_obs      = Data_t(1:6,1);
WP_sim      = (linspace(1,3300,3300));
WC_sim      = van_genuchten(WP_sim,p);

subplot(3,4,3);
plot(WC_sim,log10(WP_sim))
hold on
plot(WC_obs,log10(WP_obs),"*")
% title('Passogavia - Ambient (C)')
title('Passogavia - Ambient')
xlabel('Soil moisture [g/g]')
ylabel('Log10(Water Potential) [kPa]')
xlim([0.01 0.85])

% Passogavia Drought 
load('Passogavia_WP_drought.mat')
WP_obs      = (Data_t(7:12,2));  
WC_obs      = Data_t(7:12,1);
WP_sim      = (linspace(1,3300,3300));
WC_sim      = van_genuchten(WP_sim,p);

subplot(3,4,4);
plot(WC_sim,log10(WP_sim))
hold on
plot(WC_obs,log10(WP_obs),"*")
% title('Passogavia - Drought (V)')
title('Passogavia - Drought')
xlabel('Soil moisture [g/g]')
ylabel('Log10(Water Potential) [kPa]')
xlim([0.01 0.85])

% Nyngan Ambient 
load('nyngan_WP_ambient.mat')
WP_obs      = (Data_wo(1:6,3));  
WC_obs      = Data_wo(1:6,1);
WP_sim      = (linspace(1,3300,3300));
WC_sim      = van_genuchten(WP_sim,p);

subplot(3,4,5);
plot(WC_sim,log10(WP_sim))
hold on
plot(WC_obs,log10(WP_obs),"*")
% title('Nyngan - Ambient (C)')
title('Nyngan - Ambient')
xlabel('Soil moisture [g/g]')
ylabel('Log10(Water Potential) [kPa]')
xlim([0.01 0.85])

% Nyngan Drought 
load('nyngan_WP_drought.mat')
WP_obs      = (Data_wo(7:12,3));  
WC_obs      = Data_wo(7:12,1);
WP_sim      = (linspace(1,3300,3300));
WC_sim      = van_genuchten(WP_sim,p);

subplot(3,4,6);
plot(WC_sim,log10(WP_sim))
hold on
plot(WC_obs,log10(WP_obs),"*")
% title('Nyngan - Drought (V)')
title('Nyngan - Drought')
xlabel('Soil moisture [g/g]')
ylabel('Log10(Water Potential) [kPa]')
xlim([0.01 0.85])

% Cowidrt Ambient 
load('cowidrt_WP_ambient.mat')
WP_obs      = (Data_wo(13:18,3));  
WC_obs      = Data_wo(13:18,1);
WP_sim      = (linspace(1,3300,3300));
WC_sim      = van_genuchten(WP_sim,p);

subplot(3,4,7);
plot(WC_sim,log10(WP_sim))
hold on
plot(WC_obs,log10(WP_obs),"*")
% title('Cowidrt - Ambient (C)')
title('Cowidrt - Ambient')
xlabel('Soil moisture [g/g]')
ylabel('Log10(Water Potential) [kPa]')
xlim([0.01 0.85])

% Cowidrt Drought 
load('cowidrt_WP_drought.mat')
WP_obs      = (Data_wo(19:24,3));  
WC_obs      = Data_wo(19:24,1);
WP_sim      = (linspace(1,3300,3300));
WC_sim      = van_genuchten(WP_sim,p);

subplot(3,4,8);
plot(WC_sim,log10(WP_sim))
hold on
plot(WC_obs,log10(WP_obs),"*")
% title('Cowidrt - Drought (V)')
title('Cowidrt - Drought')
xlabel('Soil moisture [g/g]')
ylabel('Log10(Water Potential) [kPa]')
xlim([0.01 0.85])

% Scruzl Ambient 
load('Scruzl_WP_ambient.mat')
WP_obs      = (Data(13:18,3));  
WC_obs      = Data(13:18,1);
WC_sd       = Data(13:18,2);
WP_sim      = (linspace(1,3300,3300));
WC_sim      = van_genuchten(WP_sim,p);

subplot(3,4,9);
plot(WC_sim,log10(WP_sim))
hold on
plot(WC_obs,log10(WP_obs),"*")
% title('Scruzl - Ambient (C)')
title('Scruzl - Ambient')
xlabel('Soil moisture [g/g]')
ylabel('Log10(Water Potential) [kPa]')
xlim([0.01 0.85])

% Scruzl Drought 
load('Scruzl_WP_drought.mat')
WP_obs      = (Data(19:24,3));  
WC_obs      = Data(19:24,1);
WC_sd       = Data(19:24,2);
WP_sim      = (linspace(1,3300,3300));
WC_sim      = van_genuchten(WP_sim,p);

subplot(3,4,10);
plot(WC_sim,log10(WP_sim))
hold on
plot(WC_obs,log10(WP_obs),"*")
% title('Scruzl - Drought (V)')
title('Scruzl - Drought')
xlabel('Soil moisture [g/g]')
ylabel('Log10(Water Potential) [kPa]')
xlim([0.01 0.85])

% Lygra Ambient 
load('Lygra_WP_ambient.mat')
WP_obs      = (Data(109:114,3));  
WC_obs      = Data(109:114,1);
WC_sd       = Data(109:114,2);
WP_sim      = (linspace(1,3300,3300));
WC_sim      = van_genuchten(WP_sim,p);

subplot(3,4,11);
plot(WC_sim,log10(WP_sim))
hold on
plot(WC_obs,log10(WP_obs),"*")
% title('Lygra - Ambient (C)')
title('Lygra - Ambient')
xlabel('Soil moisture [g/g]')
ylabel('Log10(Water Potential) [kPa]')
xlim([0.01 0.85])

% Lygra Drought 
load('Lygra_WP_drought.mat')
WP_obs      = Data(115:120,3);  
WC_obs      = Data(115:120,1);
WC_sd       = Data(115:120,2);
WP_sim      = (linspace(1,3300,3300));
WC_sim      = van_genuchten(WP_sim,p);

subplot(3,4,12);
plot(WC_sim,log10(WP_sim))
hold on
plot(WC_obs,log10(WP_obs),"*")
% title('Lygra - Drought (V)')
title('Lygra - Drought')
xlabel('Soil moisture [g/g]')
ylabel('Log10(Water Potential) [kPa]')
xlim([0.01 0.85])

sgtitle('SANDY LOAM SOILS') 

%%
% SANDY CLAY LOAM %

fig = figure;

% Cobar Ambient 
load('Cobar_WP_ambient.mat')
WP_obs      = (Data(37:42,3));  
WC_obs      = Data(37:42,1);
WC_sd       = Data(37:42,2);
WP_sim      = (linspace(1,3300,3300));
WC_sim      = van_genuchten(WP_sim,p);

subplot(2,2,1);
plot(WC_sim,log10(WP_sim))
hold on
plot(WC_obs,log10(WP_obs),"*")
% title('Cobar - Ambient (C)')
title('Cobar - Ambient')
xlabel('Soil moisture [g/g]')
ylabel('Log10(Water Potential) [kPa]')
xlim([0.01 0.85])

% Cobar Drought 
load('Cobar_WP_drought.mat')
WP_obs      = (Data(43:48,3));  
WC_obs      = Data(43:48,1);
WC_sd       = Data(43:48,2);
WP_sim      = (linspace(1,3300,3300));
WC_sim      = van_genuchten(WP_sim,p);

subplot(2,2,2);
plot(WC_sim,log10(WP_sim))
hold on
plot(WC_obs,log10(WP_obs),"*")
% title('Cobar - Drought (V)')
title('Cobar - Drought')
xlabel('Soil moisture [g/g]')
ylabel('Log10(Water Potential) [kPa]')
xlim([0.01 0.85])

% SGS US Ambient 
load('SGS_US_WP_ambient.mat')
WP_obs      = (Data_t(37:42,2));  
WC_obs      = Data_t(37:42,1);
WP_sim      = (linspace(1,3300,3300));
WC_sim      = van_genuchten(WP_sim,p);

subplot(2,2,3);
plot(WC_sim,log10(WP_sim))
hold on
plot(WC_obs,log10(WP_obs),"*")
% title('SGS US - Ambient (C)')
title('SGS US - Ambient')
xlabel('Soil moisture [g/g]')
ylabel('Log10(Water Potential) [kPa]')
xlim([0.01 0.85])

% SGS US Drought 
load('SGS_US_WP_drought.mat')
WP_obs      = (Data_t(43:48,2));  
WC_obs      = Data_t(43:48,1);
WP_sim      = (linspace(1,3300,3300));
WC_sim      = van_genuchten(WP_sim,p);

subplot(2,2,4);
plot(WC_sim,log10(WP_sim))
hold on
plot(WC_obs,log10(WP_obs),"*")
% title('SGS US - Drought (V)')
title('SGS US - Drought')
xlabel('Soil moisture [g/g]')
ylabel('Log10(Water Potential) [kPa]')
xlim([0.01 0.85])

sgtitle('SANDY CLAY LOAM SOILS') 

%%

% LOAM %

fig = figure;

% Badlauch Ambient 
load('Badlauch_WP_ambient.mat')
WP_obs      = (Data(49:54,3));  
WC_obs      = Data(49:54,1);
WC_sd       = Data(49:54,2);
WP_sim      = (linspace(1,3300,3300));
WC_sim      = van_genuchten(WP_sim,p);

subplot(2,2,1);
plot(WC_sim,log10(WP_sim))
hold on
plot(WC_obs,log10(WP_obs),"*")
% title('Badlauch - Ambient (C)')
title('Badlauch - Ambient')
xlabel('Soil moisture [g/g]')
ylabel('Log10(Water Potential) [kPa]')
xlim([0.01 0.85])

% Badlauch Drought 
load('Badlauch_WP_drought.mat')
WP_obs      = Data(55:60,3);  
WC_obs      = Data(55:60,1);
WC_sd       = Data(55:60,2);
WP_sim      = (linspace(1,3300,3300));
WC_sim      = van_genuchten(WP_sim,p);

subplot(2,2,2);
plot(WC_sim,log10(WP_sim))
hold on
plot(WC_obs,log10(WP_obs),"*")
% title('Badlauch - Drought (V)')
title('Badlauch - Drought')
xlabel('Soil moisture [g/g]')
ylabel('Log10(Water Potential) [kPa]')
xlim([0.01 0.85])

% Las chilcas Ambient 
load('laschilcas_WP_ambient.mat')
WP_obs      = (Data_wo(69:74,3));  
WC_obs      = Data_wo(69:74,1);
WP_sim      = (linspace(1,3300,3300));
WC_sim      = van_genuchten(WP_sim,p);

subplot(2,2,3);
plot(WC_sim,log10(WP_sim))
hold on
plot(WC_obs,log10(WP_obs),"*")
% title('Las chilcas - Ambient (C)')
title('Las chilcas - Ambient')
xlabel('Soil moisture [g/g]')
ylabel('Log10(Water Potential) [kPa]')
xlim([0.01 0.85])

% Las chilcas Drought 
load('laschilcas_WP_drought.mat')
WP_obs      = (Data_wo(75:80,3));  
WC_obs      = Data_wo(75:80,1);
WP_sim      = (linspace(1,3300,3300));
WC_sim      = van_genuchten(WP_sim,p);

subplot(2,2,4);
plot(WC_sim,log10(WP_sim))
hold on
plot(WC_obs,log10(WP_obs),"*")
% title('Las chilcas - Drought (V)')
title('Las chilcas - Drought')
xlabel('Soil moisture [g/g]')
ylabel('Log10(Water Potential) [kPa]')
xlim([0.01 0.85])

sgtitle('LOAM SOILS') 

%%

% SILT LOAM %

fig = figure;

% Purdue Ambient 
load('Purdue_WP_ambient.mat')
WP_obs      = (Data_t(25:30,2));  
WC_obs      = Data_t(25:30,1);
WP_sim      = (linspace(1,3300,3300));
WC_sim      = van_genuchten(WP_sim,p);

subplot(1,2,1);
plot(WC_sim,log10(WP_sim))
hold on
plot(WC_obs,log10(WP_obs),"*")
% title('Purdue - Ambient (C)')
title('Purdue - Ambient')
xlabel('Soil moisture [g/g]')
ylabel('Log10(Water Potential) [kPa]')
xlim([0.01 0.85])

% Purdue Drought
load('Purdue_WP_drought.mat')
WP_obs      = (Data_t(31:36,2));  
WC_obs      = Data_t(31:36,1);
WP_sim      = (linspace(1,3300,3300));
WC_sim      = van_genuchten(WP_sim,p);

subplot(1,2,2);
plot(WC_sim,log10(WP_sim))
hold on
plot(WC_obs,log10(WP_obs),"*")
% title('Purdue - Drought (V)')
title('Purdue - Drought')
xlabel('Soil moisture [g/g]')
ylabel('Log10(Water Potential) [kPa]')
xlim([0.01 0.85])

sgtitle('SILT LOAM SOILS') 

%%

% SILTY CLAY LOAM %

fig = figure;

% Ayora Ambient 
load('Ayora_WP_ambient.mat')
WP_obs      = (Data(73:78,3));  
WC_obs      = Data(73:78,1);
WC_sd       = Data(73:78,2);
WP_sim      = (linspace(1,3300,3300));
WC_sim      = van_genuchten(WP_sim,p);

subplot(1,2,1);
plot(WC_sim,log10(WP_sim))
hold on
plot(WC_obs,log10(WP_obs),"*")
% title('Ayora - Ambient (C)')
title('Ayora - Ambient')
xlabel('Soil moisture [g/g]')
ylabel('Log10(Water Potential) [kPa]')
xlim([0.01 0.85])

% Ayora Drought 
load('Ayora_WP_drought.mat')
WP_obs      = (Data(79:84,3));  
WC_obs      = Data(79:84,1);
WC_sd       = Data(79:84,2);
WP_sim      = (linspace(1,3300,3300));
WC_sim      = van_genuchten(WP_sim,p);

subplot(1,2,2);
plot(WC_sim,log10(WP_sim))
hold on
plot(WC_obs,log10(WP_obs),"*")
% title('Ayora - Drought (V)')
title('Ayora - Drought')
xlabel('Soil moisture [g/g]')
ylabel('Log10(Water Potential) [kPa]')
xlim([0.01 0.85])

sgtitle('SILTY CLAY LOAM SOILS') 

%%

% CLAY %

fig = figure;

% P12_A_1C Ambient 
load('P12_A_1C_WP_ambient.mat')
WP_obs      = (Data(121:126,3));  
WC_obs      = Data(121:126,1);
WC_sd       = Data(121:126,2);
WP_sim      = (linspace(1,3300,3300));
WC_sim      = van_genuchten(WP_sim,p);

subplot(3,4,1);
plot(WC_sim,log10(WP_sim))
hold on
plot(WC_obs,log10(WP_obs),"*")
% title('P12_A_1C - Ambient (C)')
title('P12_A_1C - Ambient')
xlabel('Soil moisture [g/g]')
ylabel('Log10(Water Potential) [kPa]')
xlim([0.01 0.85])

% P12_A_1C Drought 
load('P12_A_1C_WP_drought.mat')
WP_obs      = Data(127:132,3);  
WC_obs      = Data(127:132,1);
WC_sd       = Data(127:132,2);
WP_sim      = (linspace(1,3300,3300));
WC_sim      = van_genuchten(WP_sim,p);

subplot(3,4,2);
plot(WC_sim,log10(WP_sim))
hold on
plot(WC_obs,log10(WP_obs),"*")
% title('P12_A_1C - Drought (V)')
title('P12_A_1C - Drought')
xlabel('Soil moisture [g/g]')
ylabel('Log10(Water Potential) [kPa]')
xlim([0.01 0.85])

% Ukulinga Ambient 
load('Ukulinga_WP_ambient.mat')
WP_obs      = (Data_t(85:90,2));  
WC_obs      = Data_t(85:90,1);
WP_sim      = (linspace(1,3300,3300));
WC_sim      = van_genuchten(WP_sim,p);

subplot(3,4,3);
plot(WC_sim,log10(WP_sim))
hold on
plot(WC_obs,log10(WP_obs),"*")
% title('Ukulinga - Ambient (C)')
title('Ukulinga - Ambient')
xlabel('Soil moisture [g/g]')
ylabel('Log10(Water Potential) [kPa]')
xlim([0.01 0.85])

% Ukulinga Drought 
load('Ukulinga_WP_drought.mat')
WP_obs      = (Data_t(91:96,2));  
WC_obs      = Data_t(91:96,1);
WP_sim      = (linspace(1,3300,3300));
WC_sim      = van_genuchten(WP_sim,p);

subplot(3,4,4);
plot(WC_sim,log10(WP_sim))
hold on
plot(WC_obs,log10(WP_obs),"*")
% title('Ukulinga - Drought (V)')
title('Ukulinga - Drought')
xlabel('Soil moisture [g/g]')
ylabel('Log10(Water Potential) [kPa]')
xlim([0.01 0.85])

% GIG_A_7C_7 Ambient 
load('GIG_A_7C_7_WP_ambient.mat')
WP_obs      = (Data_wo(45:50,3));  
WC_obs      = Data_wo(45:50,1);
WP_sim      = (linspace(1,3300,3300));
WC_sim      = van_genuchten(WP_sim,p);

subplot(3,4,5);
plot(WC_sim,log10(WP_sim))
hold on
plot(WC_obs,log10(WP_obs),"*")
% title('GIG_A_7C_7 - Ambient (C)')
title('GIG_A_7C_7 - Ambient')
xlabel('Soil moisture [g/g]')
ylabel('Log10(Water Potential) [kPa]')
xlim([0.01 0.85])

% GIG_A_7C_7 Drought 
load('GIG_A_7C_7_WP_drought.mat')
WP_obs      = Data_wo(51:56,3);  
WC_obs      = Data_wo(51:56,1);
WP_sim      = (linspace(1,3300,3300));
WC_sim      = van_genuchten(WP_sim,p);

subplot(3,4,6);
plot(WC_sim,log10(WP_sim))
hold on
plot(WC_obs,log10(WP_obs),"*")
% title('GIG_A_7C_7 - Drought (V)')
title('GIG_A_7C_7 - Drought')
xlabel('Soil moisture [g/g]')
ylabel('Log10(Water Potential) [kPa]')
xlim([0.01 0.85])

% P13_A_7C_7 Ambient 
load('P13_A_7C_7_WP_ambient.mat')
WP_obs      = (Data_wo(57:62,3));  
WC_obs      = Data_wo(57:62,1);
WP_sim      = (linspace(1,3300,3300));
WC_sim      = van_genuchten(WP_sim,p);

subplot(3,4,7);
plot(WC_sim,log10(WP_sim))
hold on
plot(WC_obs,log10(WP_obs),"*")
% title('P13_A_7C_7 - Ambient (C)')
title('P13_A_7C_7 - Ambient')
xlabel('Soil moisture [g/g]')
ylabel('Log10(Water Potential) [kPa]')
xlim([0.01 0.85])

% P13_A_7C_7 Drought 
load('P13_A_7C_7_WP_drought.mat')
WP_obs      = (Data_wo(63:68,3));  
WC_obs      = Data_wo(63:68,1);
WP_sim      = (linspace(1,3300,3300));
WC_sim      = van_genuchten(WP_sim,p);

subplot(3,4,8);
plot(WC_sim,log10(WP_sim))
hold on
plot(WC_obs,log10(WP_obs),"*")
% title('P13_A_7C_7 - Drought (V)')
title('P13_A_7C_7 - Drought')
xlabel('Soil moisture [g/g]')
ylabel('Log10(Water Potential) [kPa]')
xlim([0.01 0.85])

sgtitle('CLAY SOILS')

%%

% CLAY LOAM %

fig = figure;

% Brookdale Ambient 
load('Brookdale_WP_ambient.mat')
WP_obs      = (Data(85:90,3));  
WC_obs      = Data(85:90,1);
WC_sd       = Data(85:90,2);
WP_sim      = (linspace(1,3300,3300));
WC_sim      = van_genuchten(WP_sim,p);

subplot(1,2,1);
plot(WC_sim,log10(WP_sim))
hold on
plot(WC_obs,log10(WP_obs),"*")
% title('Brookdale - Ambient (C)')
title('Brookdale - Ambient')
xlabel('Soil moisture [g/g]')
ylabel('Log10(Water Potential) [kPa]')
xlim([0.01 0.85])

% Brookdale Drought 
load('Brookdale_WP_drought.mat')
WP_obs      = (Data(91:96,3));  
WC_obs      = Data(91:96,1);
WC_sd       = Data(91:96,2);
WP_sim      = (linspace(1,3300,3300));
WC_sim      = van_genuchten(WP_sim,p);

subplot(1,2,2);
plot(WC_sim,log10(WP_sim))
hold on
plot(WC_obs,log10(WP_obs),"*")
% title('Brookdale - Drought (V)')
title('Brookdale - Drought')
xlabel('Soil moisture [g/g]')
ylabel('Log10(Water Potential) [kPa]')
xlim([0.01 0.85])

sgtitle('CLAY LOAM SOILS')

%%

% SANDY CLAY %

fig = figure;

% PNE Brazil Ambient 
load('PNE_Brazil_WP_ambient.mat')
WP_obs      = (Data_t(73:78,2));  
WC_obs      = Data_t(73:78,1);
WP_sim      = (linspace(1,3300,3300));
WC_sim      = van_genuchten(WP_sim,p);

subplot(1,2,1);
plot(WC_sim,log10(WP_sim))
hold on
plot(WC_obs,log10(WP_obs),"*")
% title('PNE Brazil - Ambient (C)')
title('PNE Brazil - Ambient')
xlabel('Soil moisture [g/g]')
ylabel('Log10(Water Potential) [kPa]')
xlim([0.01 0.85])

% PNE Brazil Drought 
load('PNE_Brazil_WP_drought.mat')
WP_obs      = (Data_t(79:84,2));  
WC_obs      = Data_t(79:84,1);
WP_sim      = (linspace(1,3300,3300));
WC_sim      = van_genuchten(WP_sim,p);

subplot(1,2,2);
plot(WC_sim,log10(WP_sim))
hold on
plot(WC_obs,log10(WP_obs),"*")
% title('PNE Brazil - Drought (V)')
title('PNE Brazil - Drought')
xlabel('Soil moisture [g/g]')
ylabel('Log10(Water Potential) [kPa]')
xlim([0.01 0.85])

sgtitle('SANDY CLAY SOILS')

%%

% ORGANIC %

fig = figure;

% Waqecha Ambient 
load('Waqecha_WP_ambient.mat')
WP_obs      = (Data_t(97:99,2));  
WC_obs      = Data_t(97:99,1);
WP_sim      = (linspace(1,3300,3300));
WC_sim      = van_genuchten(WP_sim,p);

subplot(2,2,1);
plot(WC_sim,log10(WP_sim))
hold on
plot(WC_obs,log10(WP_obs),"*")
% title('Waqecha - Ambient (C)')
title('Waqecha - Ambient')
xlabel('Soil moisture [g/g]')
ylabel('Log10(Water Potential) [kPa]')
xlim([0.01 1.25])

% Waqecha Drought
load('Waqecha_WP_drought.mat')
WP_obs      = (Data_t(100:102,2));  
WC_obs      = Data_t(100:102,1);
WP_sim      = (linspace(1,3300,3300));
WC_sim      = van_genuchten(WP_sim,p);

subplot(2,2,2);
plot(WC_sim,log10(WP_sim))
hold on
plot(WC_obs,log10(WP_obs),"*")
% title('Waqecha - Drought (V)')
title('Waqecha - Drought')
xlabel('Soil moisture [g/g]')
ylabel('Log10(Water Potential) [kPa]')
xlim([0.01 1.25])

% Skotsvar Ambient 
load('skotsvar_WP_ambient.mat')
WP_obs      = (Data_wo(37:40,3));  
WC_obs      = Data_wo(37:40,1);
WP_sim      = (linspace(1,3300,3300));
WC_sim      = van_genuchten(WP_sim,p);

subplot(2,2,3);
plot(WC_sim,log10(WP_sim))
hold on
plot(WC_obs,log10(WP_obs),"*")
% title('Skotsvar - Ambient (C)')
title('Skotsvar - Ambient')
xlabel('Soil moisture [g/g]')
ylabel('Log10(Water Potential) [kPa]')
xlim([0.01 1.25])

% Skotsvar Drought 
load('skotsvar_WP_drought.mat')
WP_obs      = (Data_wo(41:44,3));  
WC_obs      = Data_wo(41:44,1);
WP_sim      = (linspace(1,3300,3300));
WC_sim      = van_genuchten(WP_sim,p);

subplot(2,2,4);
plot(WC_sim,log10(WP_sim))
hold on
plot(WC_obs,log10(WP_obs),"*")
% title('Skotsvar - Drought (V)')
title('Skotsvar - Drought')
xlabel('Soil moisture [g/g]')
ylabel('Log10(Water Potential) [kPa]')
xlim([0.01 1.25])

sgtitle('ORGANIC SOILS')

