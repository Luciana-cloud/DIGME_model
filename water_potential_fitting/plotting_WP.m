%% Plotting water potential without observations %%

%% Calling Data

Data    = load("WP_matlab.txt");
Data_2  = load("WP_matlab_2.txt");
p_final = zeros(26,5);
x       = Data(1:6,4); % WP [bar]

%% Full parameter values

load('Ayora.mat')
p(3)   = Data(1,5); % Ayora Saturated soil moisture content [-]
p(4)   = 0; % Residual soil water content [-]*
WP_obs      = (Data(1:6,4));  
WC_obs      = Data(1:6,2)/0.504982107;
WC_sd       = Data(1:6,3);
WP_sim      = (linspace(0.1,15,3300));
WC_sim      = van_genuchten(WP_sim,p)/0.504982107;
WC_sim1     = van_genuchten(x,p)/0.504982107;
fig = figure;
subplot(3,4,1);
plot(WC_sim,log10(WP_sim*1000))
hold on
plot(WC_obs,log10(WP_obs*1000),"*")
title('Ayora')
xlabel('Relative Saturation [-]')
ylabel('Water Potential [pF]')
xlim([0 1])
mdl  = fitlm(WC_obs,WC_sim1);
p(5) = mdl.Rsquared.Adjusted;
p_final(1,:) = p;

load('GIG.mat')
p(3)   = Data(7,5); % GIG Saturated soil moisture content [-]*
p(4)   = 0; % Residual soil water content [-]*
WP_obs      = (Data(7:12,4));  
WC_obs      = Data(7:12,2)/0.738852493;
WC_sd       = Data(7:12,3);
WP_sim      = (linspace(0.1,15,3300));
WC_sim      = van_genuchten(WP_sim,p)/0.738852493;
WC_sim1     = van_genuchten(x,p)/0.738852493;
% fig = figure;
subplot(3,4,2);
plot(WC_sim,log10(WP_sim*1000))
hold on
plot(WC_obs,log10(WP_obs*1000),"*")
title('GIG')
xlabel('Relative Saturation [-]')
ylabel('Water Potential [pF]')
xlim([0 1])
mdl  = fitlm(WC_obs,WC_sim1);
p(5) = mdl.Rsquared.Adjusted;
p_final(2,:) = p;

load('P12.mat')
p(3)   = Data(13,5); % P12 Saturated soil moisture content [-]*
p(4)   = 0; % Residual soil water content [-]*
WP_obs      = (Data(13:18,4));  
WC_obs      = Data(13:18,2)/0.749285305;
WC_sd       = Data(13:18,3);
WP_sim      = (linspace(0.1,15,3300));
WC_sim      = van_genuchten(WP_sim,p)/0.749285305;
WC_sim1     = van_genuchten(x,p)/0.749285305;
% fig = figure;
subplot(3,4,3);
plot(WC_sim,log10(WP_sim*1000))
hold on
plot(WC_obs,log10(WP_obs*1000),"*")
title('P12')
xlabel('Relative Saturation [-]')
ylabel('Water Potential [pF]')
xlim([0 1])
mdl  = fitlm(WC_obs,WC_sim1);
p(5) = mdl.Rsquared.Adjusted;
p_final(3,:) = p;

load('P13.mat')
p(3)   = Data(19,5); % P13 Saturated soil moisture content [-]*
p(4)   = 0; % Residual soil water content [-]*
WP_obs      = (Data(19:24,4));  
WC_obs      = Data(19:24,2)/0.764487771;
WC_sd       = Data(19:24,3);
WP_sim      = (linspace(0.1,15,3300));
WC_sim      = van_genuchten(WP_sim,p)/0.764487771;
WC_sim1     = van_genuchten(x,p)/0.764487771;
% fig = figure;
subplot(3,4,4);
plot(WC_sim,log10(WP_sim*1000))
hold on
plot(WC_obs,log10(WP_obs*1000),"*")
title('P13')
xlabel('Relative Saturation [-]')
ylabel('Water Potential [pF]')
xlim([0 1])
mdl  = fitlm(WC_obs,WC_sim1);
p(5) = mdl.Rsquared.Adjusted;
p_final(4,:) = p;

load('PNE_unburned.mat')
p(3)   = Data(25,5); % PNE_unburned Saturated soil moisture content [-]*
p(4)   = 0; % Residual soil water content [-]*
WP_obs      = (Data(25:30,4));  
WC_obs      = Data(25:30,2)/0.598566125;
WC_sd       = Data(25:30,3);
WP_sim      = (linspace(0.1,15,3300));
WC_sim      = van_genuchten(WP_sim,p)/0.598566125;
WC_sim1     = van_genuchten(x,p)/0.598566125;
% fig = figure;
subplot(3,4,5);
plot(WC_sim,log10(WP_sim*1000))
hold on
plot(WC_obs,log10(WP_obs*1000),"*")
title('PNE_unburned')
xlabel('Relative Saturation [-]')
ylabel('Water Potential [pF]')
xlim([0 1])
mdl  = fitlm(WC_obs,WC_sim1);
p(5) = mdl.Rsquared.Adjusted;
p_final(5,:) = p;

load('Purdue.us.mat')
p(3)    = Data(31,5); % Purdue.us Saturated soil moisture content [-]*
p(4)   = 0; % Residual soil water content [-]*
WP_obs      = (Data(31:36,4));  
WC_obs      = Data(31:36,2)/0.627858604;
WC_sd       = Data(31:36,3);
WP_sim      = (linspace(0.1,15,3300));
WC_sim      = van_genuchten(WP_sim,p)/0.627858604;
WC_sim1     = van_genuchten(x,p)/0.627858604;
% fig = figure;
subplot(3,4,6);
plot(WC_sim,log10(WP_sim*1000))
hold on
plot(WC_obs,log10(WP_obs*1000),"*")
title('Purdue.us')
xlabel('Relative Saturation [-]')
ylabel('Water Potential [pF]')
xlim([0 1])
mdl  = fitlm(WC_obs,WC_sim1);
p(5) = mdl.Rsquared.Adjusted;
p_final(6,:) = p;

load('Sev.mix.mat')
p(3)   = Data(37,5); % Sev.mix Saturated soil moisture content [-]
p(4)   = 0; % Residual soil water content [-]*
WP_obs      = (Data(37:42,4));  
WC_obs      = Data(37:42,2)/0.375467806;
WC_sd       = Data(37:42,3);
WP_sim      = (linspace(0.1,15,3300));
WC_sim      = van_genuchten(WP_sim,p)/0.375467806;
WC_sim1     = van_genuchten(x,p)/0.375467806;
% fig = figure;
subplot(3,4,7);
plot(WC_sim,log10(WP_sim*1000))
hold on
plot(WC_obs,log10(WP_obs*1000),"*")
title('Sev.mix')
xlabel('Relative Saturation [-]')
ylabel('Water Potential [pF]')
xlim([0 1])
mdl  = fitlm(WC_obs,WC_sim1);
p(5) = mdl.Rsquared.Adjusted;
p_final(7,:) = p;

load('baddrt.de.mat')
p(3)   = Data(43,5); % baddrt.de Saturated soil moisture content [-]
p(4)   = 0; % Residual soil water content [-]*
WP_obs      = (Data(43:48,4));  
WC_obs      = Data(43:48,2)/0.672827878;
WC_sd       = Data(43:48,3);
WP_sim      = (linspace(0.1,15,3300));
WC_sim      = van_genuchten(WP_sim,p)/0.672827878;
WC_sim1     = van_genuchten(x,p)/0.672827878;
% fig = figure;
subplot(3,4,8);
plot(WC_sim,log10(WP_sim*1000))
hold on
plot(WC_obs,log10(WP_obs*1000),"*")
title('baddrt.de')
xlabel('Relative Saturation [-]')
ylabel('Water Potential [pF]')
xlim([0 1])
mdl  = fitlm(WC_obs,WC_sim1);
p(5) = mdl.Rsquared.Adjusted;
p_final(8,:) = p;

load('brhill.au.mat')
p(3)   = Data(49,5); % brhill.au Saturated soil moisture content [-]*
p(4)   = 0; % Residual soil water content [-]*
WP_obs      = (Data(49:53,4));  
WC_obs      = Data(49:53,2)/0.392158463;
WC_sd       = Data(49:53,3);
WP_sim      = (linspace(0.1,15,3300));
WC_sim      = van_genuchten(WP_sim,p)/0.392158463;
x1          = Data(1:5,4); % WP [bar]
WC_sim1     = van_genuchten(x1,p)/0.392158463;
% fig = figure;
subplot(3,4,9);
plot(WC_sim,log10(WP_sim*1000))
hold on
plot(WC_obs,log10(WP_obs*1000),"*")
title('brhill.au')
xlabel('Relative Saturation [-]')
ylabel('Water Potential [pF]')
xlim([0 1])
mdl  = fitlm(WC_obs,WC_sim1);
p(5) = mdl.Rsquared.Adjusted;
p_final(9,:) = p;

load('brookdale.ca.mat')
p(3)   = Data(55,5); % brookdale.ca Saturated soil moisture content [-]*
p(4)   = 0; % Residual soil water content [-]*
WP_obs      = (Data(55:60,4));  
WC_obs      = Data(55:60,2)/0.752341486;
WC_sd       = Data(55:60,3);
WP_sim      = (linspace(0.1,15,3300));
WC_sim      = van_genuchten(WP_sim,p)/0.752341486;
WC_sim1     = van_genuchten(x,p)/0.752341486;
% fig = figure;
subplot(3,4,10);
plot(WC_sim,log10(WP_sim*1000))
hold on
plot(WC_obs,log10(WP_obs*1000),"*")
title('brookdale.ca')
xlabel('Relative Saturation [-]')
ylabel('Water Potential [pF]')
xlim([0 1])
mdl  = fitlm(WC_obs,WC_sim1);
p(5) = mdl.Rsquared.Adjusted;
p_final(10,:) = p;

load('cedarsav.us.mat')
p(3)   = Data(61,5); % cedarsav.us Saturated soil moisture content [-]
p(4)   = 0; % Residual soil water content [-]*
WP_obs      = (Data(61:66,4));  
WC_obs      = Data(61:66,2)/0.573952592;
WC_sd       = Data(61:66,3);
WP_sim      = (linspace(0.1,15,3300));
WC_sim      = van_genuchten(WP_sim,p)/0.573952592;
WC_sim1     = van_genuchten(x,p)/0.573952592;
% fig = figure;
subplot(3,4,11);
plot(WC_sim,log10(WP_sim*1000))
hold on
plot(WC_obs,log10(WP_obs*1000),"*")
title('cedarsav.us')
xlabel('Relative Saturation [-]')
ylabel('Water Potential [pF]')
xlim([0 1])
mdl  = fitlm(WC_obs,WC_sim1);
p(5) = mdl.Rsquared.Adjusted;
p_final(11,:) = p;

load('cobar.au.mat')
p(3)   = Data(67,5); % cobar.au Saturated soil moisture content [-]
p(4)   = 0; % Residual soil water content [-]*
WP_obs      = (Data(67:72,4));  
WC_obs      = Data(67:72,2)/0.380637137;
WC_sd       = Data(67:72,3);
WP_sim      = (linspace(0.1,15,3300));
WC_sim      = van_genuchten(WP_sim,p)/0.380637137;
WC_sim1     = van_genuchten(x,p)/0.380637137;
% fig = figure;
subplot(3,4,12);
plot(WC_sim,log10(WP_sim*1000))
hold on
plot(WC_obs,log10(WP_obs*1000),"*")
title('cobar.au')
xlabel('Relative Saturation [-]')
ylabel('Water Potential [pF]')
xlim([0 1])
mdl  = fitlm(WC_obs,WC_sim1);
p(5) = mdl.Rsquared.Adjusted;
p_final(12,:) = p;

load('cowidrt.ca.mat')
p(3)   = Data(73,5); % cowidrt.ca Saturated soil moisture content [-]*
p(4)   = 0; % Residual soil water content [-]*
WP_obs      = (Data(73:78,4));  
WC_obs      = Data(73:78,2)/0.638466114;
WC_sd       = Data(73:78,3);
WP_sim      = (linspace(0.1,15,3300));
WC_sim      = van_genuchten(WP_sim,p)/0.638466114;
WC_sim1     = van_genuchten(x,p)/0.638466114;
fig = figure;
subplot(3,4,1);
plot(WC_sim,log10(WP_sim*1000))
hold on
plot(WC_obs,log10(WP_obs*1000),"*")
title('cowidrt.ca')
xlabel('Relative Saturation [-]')
ylabel('Water Potential [pF]')
xlim([0 1])
mdl  = fitlm(WC_obs,WC_sim1);
p(5) = mdl.Rsquared.Adjusted;
p_final(13,:) = p;

load('dona.ana.mat')
p(3)   = Data(79,5); % dona.ana Saturated soil moisture content [-]*
p(4)   = 0; % Residual soil water content [-]*
WP_obs      = (Data(79:84,4));  
WC_obs      = Data(79:84,2)/0.408520605;
WC_sd       = Data(79:84,3);
WP_sim      = (linspace(0.1,15,3300));
WC_sim      = van_genuchten(WP_sim,p)/0.408520605;
WC_sim1     = van_genuchten(x,p)/0.408520605;
% fig = figure;
subplot(3,4,2);
plot(WC_sim,log10(WP_sim*1000))
hold on
plot(WC_obs,log10(WP_obs*1000),"*")
title('dona.ana')
xlabel('Relative Saturation [-]')
ylabel('Water Potential [pF]')
xlim([0 1])
mdl  = fitlm(WC_obs,WC_sim1);
p(5) = mdl.Rsquared.Adjusted;
p_final(14,:) = p;

load('hoide.de.mat')
p(3)   = Data(85,5); % hoide.de Saturated soil moisture content [-]*
p(4)   = 0; % Residual soil water content [-]*
WP_obs      = (Data(85:90,4));  
WC_obs      = Data(85:90,2)/0.442552624;
WC_sd       = Data(85:90,3);
WP_sim      = (linspace(0.1,15,3300));
WC_sim      = van_genuchten(WP_sim,p)/0.442552624;
WC_sim1     = van_genuchten(x,p)/0.442552624;
% fig = figure;
subplot(3,4,3);
plot(WC_sim,log10(WP_sim*1000))
hold on
plot(WC_obs,log10(WP_obs*1000),"*")
title('hoide.de')
xlabel('Relative Saturation [-]')
ylabel('Water Potential [pF]')
xlim([0 1])
mdl  = fitlm(WC_obs,WC_sim1);
p(5) = mdl.Rsquared.Adjusted;
p_final(15,:) = p;

load('horacg.cr.mat')
p(3)   = Data(91,5); % horacg.cr Saturated soil moisture content [-]*
p(4)   = 0; % Residual soil water content [-]*
WP_obs      = (Data(91:96,4));  
WC_obs      = Data(91:96,2)/0.584847791;
WC_sd       = Data(91:96,3);
WP_sim      = (linspace(0.1,15,3300));
WC_sim      = van_genuchten(WP_sim,p)/0.584847791;
WC_sim1     = van_genuchten(x,p)/0.584847791;
% fig = figure;
subplot(3,4,4);
plot(WC_sim,log10(WP_sim*1000))
hold on
plot(WC_obs,log10(WP_obs*1000),"*")
title('horacg.cr')
xlabel('Relative Saturation [-]')
ylabel('Water Potential [pF]')
xlim([0 1])
mdl  = fitlm(WC_obs,WC_sim1);
p(5) = mdl.Rsquared.Adjusted;
p_final(16,:) = p;

load('hyide.de.mat')
p(3)   = Data_2(97,5); % hyide.de Saturated soil moisture content [-]*
p(4)   = 0; % Residual soil water content [-]*
WP_obs      = (Data(97:102,4));  
WC_obs      = Data(97:102,2)/0.571734613;
WC_sd       = Data(97:102,3);
WP_sim      = (linspace(0.1,15,3300));
WC_sim      = van_genuchten(WP_sim,p)/0.571734613;
WC_sim1     = van_genuchten(x,p)/0.571734613;
% fig = figure;
subplot(3,4,5);
plot(WC_sim,log10(WP_sim*1000))
hold on
plot(WC_obs,log10(WP_obs*1000),"*")
title('hyide.de**')
xlabel('Relative Saturation [-]')
ylabel('Water Potential [pF]')
xlim([0 1])
mdl  = fitlm(WC_obs,WC_sim1);
p(5) = mdl.Rsquared.Adjusted;
p_final(17,:) = p;

load('lygra.no.mat')
p(4)   = 0; % Residual soil water content [-]*
WP_obs      = (Data(103:108,4));  
WC_obs      = Data(103:108,2)/0.244053379;
WC_sd       = Data(103:108,3);
WP_sim      = (linspace(0.1,15,3300));
WC_sim      = van_genuchten(WP_sim,p)/0.244053379;
WC_sim1     = van_genuchten(x,p)/0.244053379;
% fig = figure;
subplot(3,4,6);
plot(WC_sim,log10(WP_sim*1000))
hold on
plot(WC_obs,log10(WP_obs*1000),"*")
title('lygra.no')
xlabel('Relative Saturation [-]')
ylabel('Water Potential [pF]')
xlim([0 1])
mdl  = fitlm(WC_obs,WC_sim1);
p(5) = mdl.Rsquared.Adjusted;
p_final(18,:) = p;

load('nyngan.au.mat')
p(3)   = Data(109,5); % nyngan.au Saturated soil moisture content [-]
p(4)   = 0; % Residual soil water content [-]*
WP_obs      = (Data(109:114,4));  
WC_obs      = Data(109:114,2)/0.470866035;
WC_sd       = Data(109:114,3);
WP_sim      = (linspace(0.1,15,3300));
WC_sim      = van_genuchten(WP_sim,p)/0.470866035;
WC_sim1     = van_genuchten(x,p)/0.470866035;
% fig = figure;
subplot(3,4,7);
plot(WC_sim,log10(WP_sim*1000))
hold on
plot(WC_obs,log10(WP_obs*1000),"*")
title('nyngan.au')
xlabel('Relative Saturation [-]')
ylabel('Water Potential [pF]')
xlim([0 1])
mdl  = fitlm(WC_obs,WC_sim1);
p(5) = mdl.Rsquared.Adjusted;
p_final(19,:) = p;

load('passogavia.it.mat')
p(3)   = Data_2(115,5); % passogavia Saturated soil moisture content [-]*
p(4)   = 0; % Residual soil water content [-]*
WP_obs      = (Data(115:120,4));  
WC_obs      = Data(115:120,2)/0.781956695;
WC_sd       = Data(115:120,3);
WP_sim      = (linspace(0.1,15,3300));
WC_sim      = van_genuchten(WP_sim,p)/0.781956695;
WC_sim1     = van_genuchten(x,p)/0.781956695;
% fig = figure;
subplot(3,4,8);
plot(WC_sim,log10(WP_sim*1000))
hold on
plot(WC_obs,log10(WP_obs*1000),"*")
title('passogavia.it**')
xlabel('Relative Saturation [-]')
ylabel('Water Potential [pF]')
xlim([0 1])
mdl  = fitlm(WC_obs,WC_sim1);
p(5) = mdl.Rsquared.Adjusted;
p_final(20,:) = p;

load('riomayo.ar.mat')
p(4)   = 0; % Residual soil water content [-]*
WP_obs      = (Data(121:126,4));  
WC_obs      = Data(121:126,2)/0.191113894;
WC_sd       = Data(121:126,3);
WP_sim      = (linspace(0.1,15,3300));
WC_sim      = van_genuchten(WP_sim,p)/0.191113894;
WC_sim1     = van_genuchten(x,p)/0.191113894;
% fig = figure;
subplot(3,4,9);
plot(WC_sim,log10(WP_sim*1000))
hold on
plot(WC_obs,log10(WP_obs*1000),"*")
title('riomayo.ar')
xlabel('Relative Saturation [-]')
ylabel('Water Potential [pF]')
xlim([0 1])
mdl  = fitlm(WC_obs,WC_sim1);
p(5) = mdl.Rsquared.Adjusted;
p_final(21,:) = p;

load('scruzl.us.mat')
p(3)   = Data(127,5); % scruzl.us Saturated soil moisture content [-]*
p(4)   = 0; % Residual soil water content [-]*
WP_obs      = (Data(127:132,4));  
WC_obs      = Data(127:132,2)/0.549847877;
WC_sd       = Data(127:132,3);
WP_sim      = (linspace(0.1,15,3300));
WC_sim      = van_genuchten(WP_sim,p)/0.549847877;
WC_sim1     = van_genuchten(x,p)/0.549847877;
% fig = figure;
subplot(3,4,10);
plot(WC_sim,log10(WP_sim*1000))
hold on
plot(WC_obs,log10(WP_obs*1000),"*")
title('scruzl.us')
xlabel('Relative Saturation [-]')
ylabel('Water Potential [pF]')
xlim([0 1])
mdl  = fitlm(WC_obs,WC_sim1);
p(5) = mdl.Rsquared.Adjusted;
p_final(22,:) = p;

load('sgsdrt.us.mat')
p(3)   = Data(133,5); % sgsdrt.us Saturated soil moisture content [-]*
p(4)   = 0; % Residual soil water content [-]*
WP_obs      = (Data(133:138,4));  
WC_obs      = Data(133:138,2)/0.410624406;
WC_sd       = Data(133:138,3);
WP_sim      = (linspace(0.1,15,3300));
WC_sim      = van_genuchten(WP_sim,p)/0.410624406;
WC_sim1     = van_genuchten(x,p)/0.410624406;
% fig = figure;
subplot(3,4,11);
plot(WC_sim,log10(WP_sim*1000))
hold on
plot(WC_obs,log10(WP_obs*1000),"*")
title('sgsdrt.us')
xlabel('Relative Saturation [-]')
ylabel('Water Potential [pF]')
xlim([0 1])
mdl  = fitlm(WC_obs,WC_sim1);
p(5) = mdl.Rsquared.Adjusted;
p_final(23,:) = p;

load('skotsvar.no.mat')
p(3)   = Data_2(139,5); % skotsvar Saturated soil moisture content [-]*
p(4)   = 0; % Residual soil water content [-]*
WP_obs      = (Data(139:142,4));  
WC_obs      = Data(139:142,2)/0.899042862;
WC_sd       = Data(139:142,3);
WP_sim      = (linspace(0.1,15,3300));
WC_sim      = van_genuchten(WP_sim,p)/0.899042862;
x1          = Data(1:4,4); % WP [bar]
WC_sim1     = van_genuchten(x1,p)/0.899042862;
% fig = figure;
subplot(3,4,12);
plot(WC_sim,log10(WP_sim*1000))
hold on
plot(WC_obs,log10(WP_obs*1000),"*")
title('skotsvar.no**')
xlabel('Relative Saturation [-]')
ylabel('Water Potential [pF]')
xlim([0 1])
mdl  = fitlm(WC_obs,WC_sim1);
p(5) = mdl.Rsquared.Adjusted;
p_final(24,:) = p;

load('ukulingadrt.za.mat')
p(3)   = Data(145,5); % ukulingadrt.za Saturated soil moisture content [-]
p(4)   = 0; % Residual soil water content [-]*
WP_obs      = (Data(145:150,4));  
WC_obs      = Data(145:150,2)/0.59781919;
WC_sd       = Data(145:150,3);
WP_sim      = (linspace(0.1,15,3300));
WC_sim      = van_genuchten(WP_sim,p)/0.59781919;
WC_sim1     = van_genuchten(x,p)/0.59781919;
fig = figure;
subplot(3,4,1);
plot(WC_sim,log10(WP_sim*1000))
hold on
plot(WC_obs,log10(WP_obs*1000),"*")
title('ukulingadrt.za')
xlabel('Relative Saturation [-]')
ylabel('Water Potential [pF]')
xlim([0 1])
mdl  = fitlm(WC_obs,WC_sim1);
p(5) = mdl.Rsquared.Adjusted;
p_final(25,:) = p;

load('wayqe.re.mat')
p(3)   = Data(151,5); % wayqe.re Saturated soil moisture content [-]*
p(4)   = 0; % Residual soil water content [-]*
WP_obs      = (Data(151:153,4));  
WC_obs      = Data(151:153,2)/0.334706198;
WC_sd       = Data(151:153,3);
WP_sim      = (linspace(0.1,15,3300));
WC_sim      = van_genuchten(WP_sim,p)/0.334706198;
x1          = Data(1:3,4); % WP [bar]
WC_sim1     = van_genuchten(x1,p)/0.334706198;
% fig = figure;
subplot(3,4,2);
plot(WC_sim,log10(WP_sim*1000))
hold on
plot(WC_obs,log10(WP_obs*1000),"*")
title('wayqe.re')
xlabel('Relative Saturation [-]')
ylabel('Water Potential [pF]')
xlim([0 1])
mdl  = fitlm(WC_obs,WC_sim1);
p(5) = mdl.Rsquared.Adjusted;
p_final(26,:) = p;

%%
p      = p_final;
save('p_final.mat','p')
VG_titles = {'n' 'alpha' 'theta_s' 'theta_r' 'r^2'};
C = [VG_titles; num2cell(p)];
writecell(C,'parameters_VG.csv') 

%% By texture class

%% Clay

load('GIG.mat')
p(3)   = Data(7,5); % GIG Saturated soil moisture content [-]*
p(4)   = 0; % Residual soil water content [-]*
WP_obs      = (Data(7:12,4));  
WC_obs      = Data(7:12,2)/0.738852493;
WC_sd       = Data(7:12,3);
WP_sim      = (linspace(0.1,15,3300));
WC_sim      = van_genuchten(WP_sim,p)/0.738852493;
WC_sim1     = van_genuchten(x,p)/0.738852493;
% fig = figure;
subplot(2,2,1);
plot(WC_sim,log10(WP_sim*1000))
hold on
plot(WC_obs,log10(WP_obs*1000),"*")
title('GIG')
xlabel('Relative Saturation [-]')
ylabel('Water Potential [pF]')
xlim([0 1])
mdl  = fitlm(WC_obs,WC_sim1);
p(5) = mdl.Rsquared.Adjusted;

load('P12.mat')
p(3)   = Data(13,5); % P12 Saturated soil moisture content [-]*
p(4)   = 0; % Residual soil water content [-]*
WP_obs      = (Data(13:18,4));  
WC_obs      = Data(13:18,2)/0.749285305;
WC_sd       = Data(13:18,3);
WP_sim      = (linspace(0.1,15,3300));
WC_sim      = van_genuchten(WP_sim,p)/0.749285305;
WC_sim1     = van_genuchten(x,p)/0.749285305;
% fig = figure;
subplot(2,2,2);
plot(WC_sim,log10(WP_sim*1000))
hold on
plot(WC_obs,log10(WP_obs*1000),"*")
title('P12')
xlabel('Relative Saturation [-]')
ylabel('Water Potential [pF]')
xlim([0 1])
mdl  = fitlm(WC_obs,WC_sim1);
p(5) = mdl.Rsquared.Adjusted;

load('P13.mat')
p(3)   = Data(19,5); % P13 Saturated soil moisture content [-]*
p(4)   = 0; % Residual soil water content [-]*
WP_obs      = (Data(19:24,4));  
WC_obs      = Data(19:24,2)/0.764487771;
WC_sd       = Data(19:24,3);
WP_sim      = (linspace(0.1,15,3300));
WC_sim      = van_genuchten(WP_sim,p)/0.764487771;
WC_sim1     = van_genuchten(x,p)/0.764487771;
% fig = figure;
subplot(2,2,3);
plot(WC_sim,log10(WP_sim*1000))
hold on
plot(WC_obs,log10(WP_obs*1000),"*")
title('P13')
xlabel('Relative Saturation [-]')
ylabel('Water Potential [pF]')
xlim([0 1])
mdl  = fitlm(WC_obs,WC_sim1);
p(5) = mdl.Rsquared.Adjusted;

load('ukulingadrt.za.mat')
p(3)   = Data(145,5); % ukulingadrt.za Saturated soil moisture content [-]
p(4)   = 0; % Residual soil water content [-]*
WP_obs      = (Data(145:150,4));  
WC_obs      = Data(145:150,2)/0.59781919;
WC_sd       = Data(145:150,3);
WP_sim      = (linspace(0.1,15,3300));
WC_sim      = van_genuchten(WP_sim,p)/0.59781919;
WC_sim1     = van_genuchten(x,p)/0.59781919;
subplot(2,2,4);
plot(WC_sim,log10(WP_sim*1000))
hold on
plot(WC_obs,log10(WP_obs*1000),"*")
title('ukulingadrt.za')
xlabel('Relative Saturation [-]')
ylabel('Water Potential [pF]')
xlim([0 1])
mdl  = fitlm(WC_obs,WC_sim1);
p(5) = mdl.Rsquared.Adjusted;

%% Clay Loam

load('brookdale.ca.mat')
p(3)   = Data(55,5); % brookdale.ca Saturated soil moisture content [-]*
p(4)   = 0; % Residual soil water content [-]*
WP_obs      = (Data(55:60,4));  
WC_obs      = Data(55:60,2)/0.752341486;
WC_sd       = Data(55:60,3);
WP_sim      = (linspace(0.1,15,3300));
WC_sim      = van_genuchten(WP_sim,p)/0.752341486;
WC_sim1     = van_genuchten(x,p)/0.752341486;
% fig = figure;
subplot(1,1,1);
plot(WC_sim,log10(WP_sim*1000))
hold on
plot(WC_obs,log10(WP_obs*1000),"*")
title('brookdale.ca')
xlabel('Relative Saturation [-]')
ylabel('Water Potential [pF]')
xlim([0 1])
mdl  = fitlm(WC_obs,WC_sim1);
p(5) = mdl.Rsquared.Adjusted;

%% Loam
load('baddrt.de.mat')
p(3)   = Data(43,5); % baddrt.de Saturated soil moisture content [-]
p(4)   = 0; % Residual soil water content [-]*
WP_obs      = (Data(43:48,4));  
WC_obs      = Data(43:48,2)/0.672827878;
WC_sd       = Data(43:48,3);
WP_sim      = (linspace(0.1,15,3300));
WC_sim      = van_genuchten(WP_sim,p)/0.672827878;
WC_sim1     = van_genuchten(x,p)/0.672827878;
fig = figure;
subplot(1,1,1);
plot(WC_sim,log10(WP_sim*1000))
hold on
plot(WC_obs,log10(WP_obs*1000),"*")
title('baddrt.de')
xlabel('Relative Saturation [-]')
ylabel('Water Potential [pF]')
xlim([0 1])
mdl  = fitlm(WC_obs,WC_sim1);

p(5) = mdl.Rsquared.Adjusted;
%% Loamy Sand
load('Sev.mix.mat')
p(3)   = Data(37,5); % Sev.mix Saturated soil moisture content [-]
p(4)   = 0; % Residual soil water content [-]*
WP_obs      = (Data(37:42,4));  
WC_obs      = Data(37:42,2)/0.375467806;
WC_sd       = Data(37:42,3);
WP_sim      = (linspace(0.1,15,3300));
WC_sim      = van_genuchten(WP_sim,p)/0.375467806;
WC_sim1     = van_genuchten(x,p)/0.375467806;
fig = figure;
subplot(1,2,1);
plot(WC_sim,log10(WP_sim*1000))
hold on
plot(WC_obs,log10(WP_obs*1000),"*")
title('Sev.mix')
xlabel('Relative Saturation [-]')
ylabel('Water Potential [pF]')
xlim([0 1])
mdl  = fitlm(WC_obs,WC_sim1);
p(5) = mdl.Rsquared.Adjusted;

load('dona.ana.mat')
p(3)   = Data(79,5); % dona.ana Saturated soil moisture content [-]*
p(4)   = 0; % Residual soil water content [-]*
WP_obs      = (Data(79:84,4));  
WC_obs      = Data(79:84,2)/0.408520605;
WC_sd       = Data(79:84,3);
WP_sim      = (linspace(0.1,15,3300));
WC_sim      = van_genuchten(WP_sim,p)/0.408520605;
WC_sim1     = van_genuchten(x,p)/0.408520605;
% fig = figure;
subplot(1,2,2);
plot(WC_sim,log10(WP_sim*1000))
hold on
plot(WC_obs,log10(WP_obs*1000),"*")
title('dona.ana')
xlabel('Relative Saturation [-]')
ylabel('Water Potential [pF]')
xlim([0 1])
mdl  = fitlm(WC_obs,WC_sim1);
p(5) = mdl.Rsquared.Adjusted;

%% Organic

load('skotsvar.no.mat')
p(3)   = Data_2(139,5); % skotsvar Saturated soil moisture content [-]*
p(4)   = 0; % Residual soil water content [-]*
WP_obs      = (Data(139:142,4));  
WC_obs      = Data(139:142,2)/0.899042862;
WC_sd       = Data(139:142,3);
WP_sim      = (linspace(0.1,15,3300));
WC_sim      = van_genuchten(WP_sim,p)/0.899042862;
x1          = Data(1:4,4); % WP [bar]
WC_sim1     = van_genuchten(x1,p)/0.899042862;
fig = figure;
subplot(1,2,1);
plot(WC_sim,log10(WP_sim*1000))
hold on
plot(WC_obs,log10(WP_obs*1000),"*")
title('skotsvar.no**')
xlabel('Relative Saturation [-]')
ylabel('Water Potential [pF]')
xlim([0 1])
mdl  = fitlm(WC_obs,WC_sim1);
p(5) = mdl.Rsquared.Adjusted;


load('wayqe.re.mat')
p(3)   = Data(151,5); % wayqe.re Saturated soil moisture content [-]*
p(4)   = 0; % Residual soil water content [-]*
WP_obs      = (Data(151:153,4));  
WC_obs      = Data(151:153,2)/0.334706198;
WC_sd       = Data(151:153,3);
WP_sim      = (linspace(0.1,15,3300));
WC_sim      = van_genuchten(WP_sim,p)/0.334706198;
x1          = Data(1:3,4); % WP [bar]
WC_sim1     = van_genuchten(x1,p)/0.334706198;
% fig = figure;
subplot(1,2,2);
plot(WC_sim,log10(WP_sim*1000))
hold on
plot(WC_obs,log10(WP_obs*1000),"*")
title('wayqe.re')
xlabel('Relative Saturation [-]')
ylabel('Water Potential [pF]')
xlim([0 1])
mdl  = fitlm(WC_obs,WC_sim1);
p(5) = mdl.Rsquared.Adjusted;

%% Sand

load('cedarsav.us.mat')
p(3)   = Data(61,5); % cedarsav.us Saturated soil moisture content [-]
p(4)   = 0; % Residual soil water content [-]*
WP_obs      = (Data(61:66,4));  
WC_obs      = Data(61:66,2)/0.573952592;
WC_sd       = Data(61:66,3);
WP_sim      = (linspace(0.1,15,3300));
WC_sim      = van_genuchten(WP_sim,p)/0.573952592;
WC_sim1     = van_genuchten(x,p)/0.573952592;
fig = figure;
subplot(2,3,1);
plot(WC_sim,log10(WP_sim*1000))
hold on
plot(WC_obs,log10(WP_obs*1000),"*")
title('cedarsav.us')
xlabel('Relative Saturation [-]')
ylabel('Water Potential [pF]')
xlim([0 1])
mdl  = fitlm(WC_obs,WC_sim1);
p(5) = mdl.Rsquared.Adjusted;

load('hoide.de.mat')
p(3)   = Data(85,5); % hoide.de Saturated soil moisture content [-]*
p(4)   = 0; % Residual soil water content [-]*
WP_obs      = (Data(85:90,4));  
WC_obs      = Data(85:90,2)/0.442552624;
WC_sd       = Data(85:90,3);
WP_sim      = (linspace(0.1,15,3300));
WC_sim      = van_genuchten(WP_sim,p)/0.442552624;
WC_sim1     = van_genuchten(x,p)/0.442552624;
% fig = figure;
subplot(2,3,2);
plot(WC_sim,log10(WP_sim*1000))
hold on
plot(WC_obs,log10(WP_obs*1000),"*")
title('hoide.de')
xlabel('Relative Saturation [-]')
ylabel('Water Potential [pF]')
xlim([0 1])
mdl  = fitlm(WC_obs,WC_sim1);
p(5) = mdl.Rsquared.Adjusted;

load('horacg.cr.mat')
p(3)   = Data(91,5); % horacg.cr Saturated soil moisture content [-]*
p(4)   = 0; % Residual soil water content [-]*
WP_obs      = (Data(91:96,4));  
WC_obs      = Data(91:96,2)/0.584847791;
WC_sd       = Data(91:96,3);
WP_sim      = (linspace(0.1,15,3300));
WC_sim      = van_genuchten(WP_sim,p)/0.584847791;
WC_sim1     = van_genuchten(x,p)/0.584847791;
% fig = figure;
subplot(2,3,3);
plot(WC_sim,log10(WP_sim*1000))
hold on
plot(WC_obs,log10(WP_obs*1000),"*")
title('horacg.cr')
xlabel('Relative Saturation [-]')
ylabel('Water Potential [pF]')
xlim([0 1])
mdl  = fitlm(WC_obs,WC_sim1);
p(5) = mdl.Rsquared.Adjusted;

load('hyide.de.mat')
p(3)   = Data_2(97,5); % hyide.de Saturated soil moisture content [-]*
p(4)   = 0; % Residual soil water content [-]*
WP_obs      = (Data(97:102,4));  
WC_obs      = Data(97:102,2)/0.571734613;
WC_sd       = Data(97:102,3);
WP_sim      = (linspace(0.1,15,3300));
WC_sim      = van_genuchten(WP_sim,p)/0.571734613;
WC_sim1     = van_genuchten(x,p)/0.571734613;
% fig = figure;
subplot(2,3,4);
plot(WC_sim,log10(WP_sim*1000))
hold on
plot(WC_obs,log10(WP_obs*1000),"*")
title('hyide.de**')
xlabel('Relative Saturation [-]')
ylabel('Water Potential [pF]')
xlim([0 1])
mdl  = fitlm(WC_obs,WC_sim1);
p(5) = mdl.Rsquared.Adjusted;

load('riomayo.ar.mat')
p(4)   = 0; % Residual soil water content [-]*
WP_obs      = (Data(121:126,4));  
WC_obs      = Data(121:126,2)/0.191113894;
WC_sd       = Data(121:126,3);
WP_sim      = (linspace(0.1,15,3300));
WC_sim      = van_genuchten(WP_sim,p)/0.191113894;
WC_sim1     = van_genuchten(x,p)/0.191113894;
% fig = figure;
subplot(2,3,5);
plot(WC_sim,log10(WP_sim*1000))
hold on
plot(WC_obs,log10(WP_obs*1000),"*")
title('riomayo.ar')
xlabel('Relative Saturation [-]')
ylabel('Water Potential [pF]')
xlim([0 1])
mdl  = fitlm(WC_obs,WC_sim1);
p(5) = mdl.Rsquared.Adjusted;

%% Sandy clay

load('PNE_unburned.mat')
p(3)   = Data(25,5); % PNE_unburned Saturated soil moisture content [-]*
p(4)   = 0; % Residual soil water content [-]*
WP_obs      = (Data(25:30,4));  
WC_obs      = Data(25:30,2)/0.598566125;
WC_sd       = Data(25:30,3);
WP_sim      = (linspace(0.1,15,3300));
WC_sim      = van_genuchten(WP_sim,p)/0.598566125;
WC_sim1     = van_genuchten(x,p)/0.598566125;
fig = figure;
subplot(1,1,1);
plot(WC_sim,log10(WP_sim*1000))
hold on
plot(WC_obs,log10(WP_obs*1000),"*")
title('PNE-unburned')
xlabel('Relative Saturation [-]')
ylabel('Water Potential [pF]')
xlim([0 1])
mdl  = fitlm(WC_obs,WC_sim1);
p(5) = mdl.Rsquared.Adjusted;

%% sandy clay loam

load('cobar.au.mat')
p(3)   = Data(67,5); % cobar.au Saturated soil moisture content [-]
p(4)   = 0; % Residual soil water content [-]*
WP_obs      = (Data(67:72,4));  
WC_obs      = Data(67:72,2)/0.380637137;
WC_sd       = Data(67:72,3);
WP_sim      = (linspace(0.1,15,3300));
WC_sim      = van_genuchten(WP_sim,p)/0.380637137;
WC_sim1     = van_genuchten(x,p)/0.380637137;
fig = figure;
subplot(1,2,1);
plot(WC_sim,log10(WP_sim*1000))
hold on
plot(WC_obs,log10(WP_obs*1000),"*")
title('cobar.au')
xlabel('Relative Saturation [-]')
ylabel('Water Potential [pF]')
xlim([0 1])
mdl  = fitlm(WC_obs,WC_sim1);
p(5) = mdl.Rsquared.Adjusted;

load('sgsdrt.us.mat')
p(3)   = Data(133,5); % sgsdrt.us Saturated soil moisture content [-]*
p(4)   = 0; % Residual soil water content [-]*
WP_obs      = (Data(133:138,4));  
WC_obs      = Data(133:138,2)/0.410624406;
WC_sd       = Data(133:138,3);
WP_sim      = (linspace(0.1,15,3300));
WC_sim      = van_genuchten(WP_sim,p)/0.410624406;
WC_sim1     = van_genuchten(x,p)/0.410624406;
% fig = figure;
subplot(1,2,2);
plot(WC_sim,log10(WP_sim*1000))
hold on
plot(WC_obs,log10(WP_obs*1000),"*")
title('sgsdrt.us')
xlabel('Relative Saturation [-]')
ylabel('Water Potential [pF]')
xlim([0 1])
mdl  = fitlm(WC_obs,WC_sim1);
p(5) = mdl.Rsquared.Adjusted;

%% sandy loam

load('brhill.au.mat')
p(3)   = Data(49,5); % brhill.au Saturated soil moisture content [-]*
p(4)   = 0; % Residual soil water content [-]*
WP_obs      = (Data(49:53,4));  
WC_obs      = Data(49:53,2)/0.392158463;
WC_sd       = Data(49:53,3);
WP_sim      = (linspace(0.1,15,3300));
WC_sim      = van_genuchten(WP_sim,p)/0.392158463;
x1          = Data(1:5,4); % WP [bar]
WC_sim1     = van_genuchten(x1,p)/0.392158463;
fig = figure;
subplot(2,3,1);
plot(WC_sim,log10(WP_sim*1000))
hold on
plot(WC_obs,log10(WP_obs*1000),"*")
title('brhill.au')
xlabel('Relative Saturation [-]')
ylabel('Water Potential [pF]')
xlim([0 1])
mdl  = fitlm(WC_obs,WC_sim1);
p(5) = mdl.Rsquared.Adjusted;

load('cowidrt.ca.mat')
p(3)   = Data(73,5); % cowidrt.ca Saturated soil moisture content [-]*
p(4)   = 0; % Residual soil water content [-]*
WP_obs      = (Data(73:78,4));  
WC_obs      = Data(73:78,2)/0.638466114;
WC_sd       = Data(73:78,3);
WP_sim      = (linspace(0.1,15,3300));
WC_sim      = van_genuchten(WP_sim,p)/0.638466114;
WC_sim1     = van_genuchten(x,p)/0.638466114;
% fig = figure;
subplot(2,3,2);
plot(WC_sim,log10(WP_sim*1000))
hold on
plot(WC_obs,log10(WP_obs*1000),"*")
title('cowidrt.ca')
xlabel('Relative Saturation [-]')
ylabel('Water Potential [pF]')
xlim([0 1])
mdl  = fitlm(WC_obs,WC_sim1);
p(5) = mdl.Rsquared.Adjusted;

load('lygra.no.mat')
p(4)   = 0; % Residual soil water content [-]*
WP_obs      = (Data(103:108,4));  
WC_obs      = Data(103:108,2)/0.244053379;
WC_sd       = Data(103:108,3);
WP_sim      = (linspace(0.1,15,3300));
WC_sim      = van_genuchten(WP_sim,p)/0.244053379;
WC_sim1     = van_genuchten(x,p)/0.244053379;
% fig = figure;
subplot(2,3,3);
plot(WC_sim,log10(WP_sim*1000))
hold on
plot(WC_obs,log10(WP_obs*1000),"*")
title('lygra.no')
xlabel('Relative Saturation [-]')
ylabel('Water Potential [pF]')
xlim([0 1])
mdl  = fitlm(WC_obs,WC_sim1);
p(5) = mdl.Rsquared.Adjusted;

load('nyngan.au.mat')
p(3)   = Data(109,5); % nyngan.au Saturated soil moisture content [-]
p(4)   = 0; % Residual soil water content [-]*
WP_obs      = (Data(109:114,4));  
WC_obs      = Data(109:114,2)/0.470866035;
WC_sd       = Data(109:114,3);
WP_sim      = (linspace(0.1,15,3300));
WC_sim      = van_genuchten(WP_sim,p)/0.470866035;
WC_sim1     = van_genuchten(x,p)/0.470866035;
% fig = figure;
subplot(2,3,4);
plot(WC_sim,log10(WP_sim*1000))
hold on
plot(WC_obs,log10(WP_obs*1000),"*")
title('nyngan.au')
xlabel('Relative Saturation [-]')
ylabel('Water Potential [pF]')
xlim([0 1])
mdl  = fitlm(WC_obs,WC_sim1);
p(5) = mdl.Rsquared.Adjusted;

load('passogavia.it.mat')
p(3)   = Data_2(115,5); % passogavia Saturated soil moisture content [-]*
p(4)   = 0; % Residual soil water content [-]*
WP_obs      = (Data(115:120,4));  
WC_obs      = Data(115:120,2)/0.781956695;
WC_sd       = Data(115:120,3);
WP_sim      = (linspace(0.1,15,3300));
WC_sim      = van_genuchten(WP_sim,p)/0.781956695;
WC_sim1     = van_genuchten(x,p)/0.781956695;
% fig = figure;
subplot(2,3,5);
plot(WC_sim,log10(WP_sim*1000))
hold on
plot(WC_obs,log10(WP_obs*1000),"*")
title('passogavia.it**')
xlabel('Relative Saturation [-]')
ylabel('Water Potential [pF]')
xlim([0 1])
mdl  = fitlm(WC_obs,WC_sim1);
p(5) = mdl.Rsquared.Adjusted;

load('scruzl.us.mat')
p(3)   = Data(127,5); % scruzl.us Saturated soil moisture content [-]*
p(4)   = 0; % Residual soil water content [-]*
WP_obs      = (Data(127:132,4));  
WC_obs      = Data(127:132,2)/0.549847877;
WC_sd       = Data(127:132,3);
WP_sim      = (linspace(0.1,15,3300));
WC_sim      = van_genuchten(WP_sim,p)/0.549847877;
WC_sim1     = van_genuchten(x,p)/0.549847877;
% fig = figure;
subplot(2,3,6);
plot(WC_sim,log10(WP_sim*1000))
hold on
plot(WC_obs,log10(WP_obs*1000),"*")
title('scruzl.us')
xlabel('Relative Saturation [-]')
ylabel('Water Potential [pF]')
xlim([0 1])
mdl  = fitlm(WC_obs,WC_sim1);
p(5) = mdl.Rsquared.Adjusted;

%% silt loam

load('Purdue.us.mat')
p(3)    = Data(31,5); % Purdue.us Saturated soil moisture content [-]*
p(4)   = 0; % Residual soil water content [-]*
WP_obs      = (Data(31:36,4));  
WC_obs      = Data(31:36,2)/0.627858604;
WC_sd       = Data(31:36,3);
WP_sim      = (linspace(0.1,15,3300));
WC_sim      = van_genuchten(WP_sim,p)/0.627858604;
WC_sim1     = van_genuchten(x,p)/0.627858604;
fig = figure;
subplot(1,1,1);
plot(WC_sim,log10(WP_sim*1000))
hold on
plot(WC_obs,log10(WP_obs*1000),"*")
title('Purdue.us')
xlabel('Relative Saturation [-]')
ylabel('Water Potential [pF]')
xlim([0 1])
mdl  = fitlm(WC_obs,WC_sim1);
p(5) = mdl.Rsquared.Adjusted;

%% silty clay loam

load('Ayora.mat')
p(3)   = Data(1,5); % Ayora Saturated soil moisture content [-]
p(4)   = 0; % Residual soil water content [-]*
WP_obs      = (Data(1:6,4));  
WC_obs      = Data(1:6,2)/0.504982107;
WC_sd       = Data(1:6,3);
WP_sim      = (linspace(0.1,15,3300));
WC_sim      = van_genuchten(WP_sim,p)/0.504982107;
WC_sim1     = van_genuchten(x,p)/0.504982107;
fig = figure;
subplot(1,1,1);
plot(WC_sim,log10(WP_sim*1000))
hold on
plot(WC_obs,log10(WP_obs*1000),"*")
title('Ayora')
xlabel('Relative Saturation [-]')
ylabel('Water Potential [pF]')
xlim([0 1])
mdl  = fitlm(WC_obs,WC_sim1);
p(5) = mdl.Rsquared.Adjusted;