%% Plotting water potential without observations %%

%% Calling Data

Data    = load("WP_matlab.txt");
p_final = zeros(26,4);

%% Full parameter values

load('Ayora.mat')
p(3)   = Data(1,5); % Ayora Saturated soil moisture content [-]
p(4)   = 0; % Residual soil water content [-]*
p_final(1,:) = p;
WP_obs      = (Data(1:6,4));  
WC_obs      = Data(1:6,2);
WC_sd       = Data(1:6,3);
WP_sim      = (linspace(0.1,15,3300));
WC_sim      = van_genuchten(WP_sim,p);
fig = figure;
subplot(3,4,1);
plot(WC_sim,log10(WP_sim*1000))
hold on
plot(WC_obs,log10(WP_obs*1000),"*")
title('Ayora')
xlabel('Soil moisture [-]')
ylabel('Water Potential [pF]')
xlim([0.01 0.85])

load('GIG.mat')
p(3)   = Data(7,5); % GIG Saturated soil moisture content [-]*
p(4)   = 0; % Residual soil water content [-]*
p_final(2,:) = p;
WP_obs      = (Data(7:12,4));  
WC_obs      = Data(7:12,2);
WC_sd       = Data(7:12,3);
WP_sim      = (linspace(0.1,15,3300));
WC_sim      = van_genuchten(WP_sim,p);
% fig = figure;
subplot(3,4,2);
plot(WC_sim,log10(WP_sim*1000))
hold on
plot(WC_obs,log10(WP_obs*1000),"*")
title('GIG')
xlabel('Soil moisture [-]')
ylabel('Water Potential [pF]')
xlim([0.01 0.85])

load('P12.mat')
p(3)   = Data(13,5); % P12 Saturated soil moisture content [-]*
p(4)   = 0; % Residual soil water content [-]*
p_final(3,:) = p;
WP_obs      = (Data(13:18,4));  
WC_obs      = Data(13:18,2);
WC_sd       = Data(13:18,3);
WP_sim      = (linspace(0.1,15,3300));
WC_sim      = van_genuchten(WP_sim,p);
% fig = figure;
subplot(3,4,3);
plot(WC_sim,log10(WP_sim*1000))
hold on
plot(WC_obs,log10(WP_obs*1000),"*")
title('P12')
xlabel('Soil moisture [-]')
ylabel('Water Potential [pF]')
xlim([0.01 0.85])

load('P13.mat')
p(3)   = Data(19,5); % P13 Saturated soil moisture content [-]*
p(4)   = 0; % Residual soil water content [-]*
p_final(4,:) = p;
WP_obs      = (Data(19:24,4));  
WC_obs      = Data(19:24,2);
WC_sd       = Data(19:24,3);
WP_sim      = (linspace(0.1,15,3300));
WC_sim      = van_genuchten(WP_sim,p);
% fig = figure;
subplot(3,4,4);
plot(WC_sim,log10(WP_sim*1000))
hold on
plot(WC_obs,log10(WP_obs*1000),"*")
title('P13')
xlabel('Soil moisture [-]')
ylabel('Water Potential [pF]')
xlim([0.01 0.85])

load('PNE_unburned.mat')
p(3)   = Data(25,5); % PNE_unburned Saturated soil moisture content [-]*
p(4)   = 0; % Residual soil water content [-]*
p_final(5,:) = p;
WP_obs      = (Data(25:30,4));  
WC_obs      = Data(25:30,2);
WC_sd       = Data(25:30,3);
WP_sim      = (linspace(0.1,15,3300));
WC_sim      = van_genuchten(WP_sim,p);
% fig = figure;
subplot(3,4,5);
plot(WC_sim,log10(WP_sim*1000))
hold on
plot(WC_obs,log10(WP_obs*1000),"*")
title('PNE_unburned')
xlabel('Soil moisture [-]')
ylabel('Water Potential [pF]')
xlim([0.01 0.85])

load('Purdue.us.mat')
p(3)    = Data(31,5); % Purdue.us Saturated soil moisture content [-]*
p(4)   = 0; % Residual soil water content [-]*
p_final(6,:) = p;
WP_obs      = (Data(31:36,4));  
WC_obs      = Data(31:36,2);
WC_sd       = Data(31:36,3);
WP_sim      = (linspace(0.1,15,3300));
WC_sim      = van_genuchten(WP_sim,p);
% fig = figure;
subplot(3,4,6);
plot(WC_sim,log10(WP_sim*1000))
hold on
plot(WC_obs,log10(WP_obs*1000),"*")
title('Purdue.us')
xlabel('Soil moisture [-]')
ylabel('Water Potential [pF]')
xlim([0.01 0.85])

load('Sev.mix.mat')
p(3)   = Data(37,5); % Sev.mix Saturated soil moisture content [-]
p(4)   = 0; % Residual soil water content [-]*
p_final(7,:) = p;
WP_obs      = (Data(37:42,4));  
WC_obs      = Data(37:42,2);
WC_sd       = Data(37:42,3);
WP_sim      = (linspace(0.1,15,3300));
WC_sim      = van_genuchten(WP_sim,p);
% fig = figure;
subplot(3,4,7);
plot(WC_sim,log10(WP_sim*1000))
hold on
plot(WC_obs,log10(WP_obs*1000),"*")
title('Sev.mix')
xlabel('Soil moisture [-]')
ylabel('Water Potential [pF]')
xlim([0.01 0.85])

load('baddrt.de.mat')
p(3)   = Data(43,5); % baddrt.de Saturated soil moisture content [-]
p(4)   = 0; % Residual soil water content [-]*
p_final(8,:) = p;
WP_obs      = (Data(43:48,4));  
WC_obs      = Data(43:48,2);
WC_sd       = Data(43:48,3);
WP_sim      = (linspace(0.1,15,3300));
WC_sim      = van_genuchten(WP_sim,p);
% fig = figure;
subplot(3,4,8);
plot(WC_sim,log10(WP_sim*1000))
hold on
plot(WC_obs,log10(WP_obs*1000),"*")
title('baddrt.de')
xlabel('Soil moisture [-]')
ylabel('Water Potential [pF]')
xlim([0.01 0.85])

load('brhill.au.mat')
p(3)   = Data(49,5); % brhill.au Saturated soil moisture content [-]*
p(4)   = 0; % Residual soil water content [-]*
p_final(9,:) = p;
WP_obs      = (Data(49:53,4));  
WC_obs      = Data(49:53,2);
WC_sd       = Data(49:53,3);
WP_sim      = (linspace(0.1,15,3300));
WC_sim      = van_genuchten(WP_sim,p);
% fig = figure;
subplot(3,4,9);
plot(WC_sim,log10(WP_sim*1000))
hold on
plot(WC_obs,log10(WP_obs*1000),"*")
title('brhill.au')
xlabel('Soil moisture [-]')
ylabel('Water Potential [pF]')
xlim([0.01 0.85])

load('brookdale.ca.mat')
p(3)   = Data(55,5); % brookdale.ca Saturated soil moisture content [-]*
p(4)   = 0; % Residual soil water content [-]*
p_final(10,:) = p;
WP_obs      = (Data(55:60,4));  
WC_obs      = Data(55:60,2);
WC_sd       = Data(55:60,3);
WP_sim      = (linspace(0.1,15,3300));
WC_sim      = van_genuchten(WP_sim,p);
% fig = figure;
subplot(3,4,10);
plot(WC_sim,log10(WP_sim*1000))
hold on
plot(WC_obs,log10(WP_obs*1000),"*")
title('brookdale.ca')
xlabel('Soil moisture [-]')
ylabel('Water Potential [pF]')
xlim([0.01 0.85])

load('cedarsav.us.mat')
p(3)   = Data(61,5); % cedarsav.us Saturated soil moisture content [-]
p(4)   = 0; % Residual soil water content [-]*
p_final(11,:) = p;
WP_obs      = (Data(61:66,4));  
WC_obs      = Data(61:66,2);
WC_sd       = Data(61:66,3);
WP_sim      = (linspace(0.1,15,3300));
WC_sim      = van_genuchten(WP_sim,p);
% fig = figure;
subplot(3,4,11);
plot(WC_sim,log10(WP_sim*1000))
hold on
plot(WC_obs,log10(WP_obs*1000),"*")
title('cedarsav.us')
xlabel('Soil moisture [-]')
ylabel('Water Potential [pF]')
xlim([0.01 0.85])

load('cobar.au.mat')
p(3)   = Data(67,5); % cobar.au Saturated soil moisture content [-]
p(4)   = 0; % Residual soil water content [-]*
p_final(12,:) = p;
WP_obs      = (Data(67:72,4));  
WC_obs      = Data(67:72,2);
WC_sd       = Data(67:72,3);
WP_sim      = (linspace(0.1,15,3300));
WC_sim      = van_genuchten(WP_sim,p);
% fig = figure;
subplot(3,4,12);
plot(WC_sim,log10(WP_sim*1000))
hold on
plot(WC_obs,log10(WP_obs*1000),"*")
title('cobar.au')
xlabel('Soil moisture [-]')
ylabel('Water Potential [pF]')
xlim([0.01 0.85])

load('cowidrt.ca.mat')
p(3)   = Data(73,5); % cowidrt.ca Saturated soil moisture content [-]*
p(4)   = 0; % Residual soil water content [-]*
p_final(13,:) = p;
WP_obs      = (Data(73:78,4));  
WC_obs      = Data(73:78,2);
WC_sd       = Data(73:78,3);
WP_sim      = (linspace(0.1,15,3300));
WC_sim      = van_genuchten(WP_sim,p);
fig = figure;
subplot(3,4,1);
plot(WC_sim,log10(WP_sim*1000))
hold on
plot(WC_obs,log10(WP_obs*1000),"*")
title('cowidrt.ca')
xlabel('Soil moisture [-]')
ylabel('Water Potential [pF]')
xlim([0.01 0.85])

load('dona.ana.mat')
p(3)   = Data(79,5); % dona.ana Saturated soil moisture content [-]*
p(4)   = 0; % Residual soil water content [-]*
p_final(14,:) = p;
WP_obs      = (Data(79:84,4));  
WC_obs      = Data(79:84,2);
WC_sd       = Data(79:84,3);
WP_sim      = (linspace(0.1,15,3300));
WC_sim      = van_genuchten(WP_sim,p);
% fig = figure;
subplot(3,4,2);
plot(WC_sim,log10(WP_sim*1000))
hold on
plot(WC_obs,log10(WP_obs*1000),"*")
title('dona.ana')
xlabel('Soil moisture [-]')
ylabel('Water Potential [pF]')
xlim([0.01 0.85])

load('hoide.de.mat')
p(3)   = Data(85,5); % hoide.de Saturated soil moisture content [-]*
p(4)   = 0; % Residual soil water content [-]*
p_final(15,:) = p;
WP_obs      = (Data(85:90,4));  
WC_obs      = Data(85:90,2);
WC_sd       = Data(85:90,3);
WP_sim      = (linspace(0.1,15,3300));
WC_sim      = van_genuchten(WP_sim,p);
% fig = figure;
subplot(3,4,3);
plot(WC_sim,log10(WP_sim*1000))
hold on
plot(WC_obs,log10(WP_obs*1000),"*")
title('hoide.de')
xlabel('Soil moisture [-]')
ylabel('Water Potential [pF]')
xlim([0.01 0.85])

load('horacg.cr.mat')
p(3)   = Data(91,5); % horacg.cr Saturated soil moisture content [-]*
p(4)   = 0; % Residual soil water content [-]*
p_final(16,:) = p;
WP_obs      = (Data(91:96,4));  
WC_obs      = Data(91:96,2);
WC_sd       = Data(91:96,3);
WP_sim      = (linspace(0.1,15,3300));
WC_sim      = van_genuchten(WP_sim,p);
% fig = figure;
subplot(3,4,4);
plot(WC_sim,log10(WP_sim*1000))
hold on
plot(WC_obs,log10(WP_obs*1000),"*")
title('horacg.cr')
xlabel('Soil moisture [-]')
ylabel('Water Potential [pF]')
xlim([0.01 0.85])

load('hyide.de.mat')
p(4)   = 0; % Residual soil water content [-]*
p_final(17,:) = p;
WP_obs      = (Data(97:102,4));  
WC_obs      = Data(97:102,2);
WC_sd       = Data(97:102,3);
WP_sim      = (linspace(0.1,15,3300));
WC_sim      = van_genuchten(WP_sim,p);
% fig = figure;
subplot(3,4,5);
plot(WC_sim,log10(WP_sim*1000))
hold on
plot(WC_obs,log10(WP_obs*1000),"*")
title('hyide.de')
xlabel('Soil moisture [-]')
ylabel('Water Potential [pF]')
xlim([0.01 0.85])

load('lygra.no.mat')
p(4)   = 0; % Residual soil water content [-]*
p_final(18,:) = p;
WP_obs      = (Data(103:108,4));  
WC_obs      = Data(103:108,2);
WC_sd       = Data(103:108,3);
WP_sim      = (linspace(0.1,15,3300));
WC_sim      = van_genuchten(WP_sim,p);
% fig = figure;
subplot(3,4,6);
plot(WC_sim,log10(WP_sim*1000))
hold on
plot(WC_obs,log10(WP_obs*1000),"*")
title('lygra.no')
xlabel('Soil moisture [-]')
ylabel('Water Potential [pF]')
xlim([0.01 0.85])

load('nyngan.au.mat')
p(3)   = Data(109,5); % nyngan.au Saturated soil moisture content [-]
p(4)   = 0; % Residual soil water content [-]*
p_final(19,:) = p;
WP_obs      = (Data(109:114,4));  
WC_obs      = Data(109:114,2);
WC_sd       = Data(109:114,3);
WP_sim      = (linspace(0.1,15,3300));
WC_sim      = van_genuchten(WP_sim,p);
% fig = figure;
subplot(3,4,7);
plot(WC_sim,log10(WP_sim*1000))
hold on
plot(WC_obs,log10(WP_obs*1000),"*")
title('nyngan.au')
xlabel('Soil moisture [-]')
ylabel('Water Potential [pF]')
xlim([0.01 0.85])

load('passogavia.it.mat')
p(4)   = 0; % Residual soil water content [-]*
p_final(20,:) = p;
WP_obs      = (Data(115:120,4));  
WC_obs      = Data(115:120,2);
WC_sd       = Data(115:120,3);
WP_sim      = (linspace(0.1,15,3300));
WC_sim      = van_genuchten(WP_sim,p);
% fig = figure;
subplot(3,4,8);
plot(WC_sim,log10(WP_sim*1000))
hold on
plot(WC_obs,log10(WP_obs*1000),"*")
title('passogavia.it')
xlabel('Soil moisture [-]')
ylabel('Water Potential [pF]')
xlim([0.01 0.85])

load('riomayo.ar.mat')
p(4)   = 0; % Residual soil water content [-]*
p_final(21,:) = p;
WP_obs      = (Data(121:126,4));  
WC_obs      = Data(121:126,2);
WC_sd       = Data(121:126,3);
WP_sim      = (linspace(0.1,15,3300));
WC_sim      = van_genuchten(WP_sim,p);
% fig = figure;
subplot(3,4,9);
plot(WC_sim,log10(WP_sim*1000))
hold on
plot(WC_obs,log10(WP_obs*1000),"*")
title('riomayo.ar')
xlabel('Soil moisture [-]')
ylabel('Water Potential [pF]')
xlim([0.01 0.85])

load('scruzl.us.mat')
p(3)   = Data(127,5); % scruzl.us Saturated soil moisture content [-]*
p(4)   = 0; % Residual soil water content [-]*
p_final(22,:) = p;
WP_obs      = (Data(127:132,4));  
WC_obs      = Data(127:132,2);
WC_sd       = Data(127:132,3);
WP_sim      = (linspace(0.1,15,3300));
WC_sim      = van_genuchten(WP_sim,p);
% fig = figure;
subplot(3,4,10);
plot(WC_sim,log10(WP_sim*1000))
hold on
plot(WC_obs,log10(WP_obs*1000),"*")
title('scruzl.us')
xlabel('Soil moisture [-]')
ylabel('Water Potential [pF]')
xlim([0.01 0.85])

load('sgsdrt.us.mat')
p(3)   = Data(133,5); % sgsdrt.us Saturated soil moisture content [-]*
p(4)   = 0; % Residual soil water content [-]*
p_final(23,:) = p;
WP_obs      = (Data(133:138,4));  
WC_obs      = Data(133:138,2);
WC_sd       = Data(133:138,3);
WP_sim      = (linspace(0.1,15,3300));
WC_sim      = van_genuchten(WP_sim,p);
% fig = figure;
subplot(3,4,11);
plot(WC_sim,log10(WP_sim*1000))
hold on
plot(WC_obs,log10(WP_obs*1000),"*")
title('sgsdrt.us')
xlabel('Soil moisture [-]')
ylabel('Water Potential [pF]')
xlim([0.01 0.85])

load('skotsvar.no.mat')
p(4)   = 0; % Residual soil water content [-]*
p_final(24,:) = p;
WP_obs      = (Data(139:142,4));  
WC_obs      = Data(139:142,2);
WC_sd       = Data(139:142,3);
WP_sim      = (linspace(0.1,15,3300));
WC_sim      = van_genuchten(WP_sim,p);
% fig = figure;
subplot(3,4,12);
plot(WC_sim,log10(WP_sim*1000))
hold on
plot(WC_obs,log10(WP_obs*1000),"*")
title('skotsvar.no')
xlabel('Soil moisture [-]')
ylabel('Water Potential [pF]')
xlim([0.01 0.85])

load('ukulingadrt.za.mat')
p(3)   = Data(145,5); % ukulingadrt.za Saturated soil moisture content [-]
p(4)   = 0; % Residual soil water content [-]*
p_final(25,:) = p;
WP_obs      = (Data(145:150,4));  
WC_obs      = Data(145:150,2);
WC_sd       = Data(145:150,3);
WP_sim      = (linspace(0.1,15,3300));
WC_sim      = van_genuchten(WP_sim,p);
fig = figure;
subplot(3,4,1);
plot(WC_sim,log10(WP_sim*1000))
hold on
plot(WC_obs,log10(WP_obs*1000),"*")
title('ukulingadrt.za')
xlabel('Soil moisture [-]')
ylabel('Water Potential [pF]')
xlim([0.01 0.85])

load('wayqe.re.mat')
p(3)   = Data(151,5); % wayqe.re Saturated soil moisture content [-]*
p(4)   = 0; % Residual soil water content [-]*
p_final(26,:) = p;

WP_obs      = (Data(151:153,4));  
WC_obs      = Data(151:153,2);
WC_sd       = Data(151:153,3);
WP_sim      = (linspace(0.1,15,3300));
WC_sim      = van_genuchten(WP_sim,p);
% fig = figure;
subplot(3,4,2);
plot(WC_sim,log10(WP_sim*1000))
hold on
plot(WC_obs,log10(WP_obs*1000),"*")
title('wayqe.re')
xlabel('Soil moisture [-]')
ylabel('Water Potential [pF]')
xlim([0.01 0.85])

%%
p      = p_final;
save('p_final.mat','p')
VG_titles = {'n' 'alpha' 'theta_s' 'theta_r'};
C = [VG_titles; num2cell(p)];
writecell(C,'parameters_VG.csv') 

%%