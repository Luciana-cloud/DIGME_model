%% Manzoni Plots %%

%% Calling Data %%

data    = load("data_manzoni_matlab.txt");
p_final = zeros(52,8);
a       = zeros(1e6,52);

%% Plotting %%

load('Ayora_ambient_2.mat')
WP_obs      = data(1:18,3);  
max_f       = max(data(1:18,4)); % maximum respiration
SR_obs      = data(1:18,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(1:18,5)/max_f;

fig = figure;
subplot(3,4,1);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('Ayora - Ambient')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(1e-6) log10(10^3.5)])
ylim([0 1])
p(1) = 10^p(1);
mdl  = fitlm(SR_obs,SR_sim1);
p(4) = mdl.Rsquared.Adjusted;
p(5) = coefTest(mdl);
p(6) = length(WP_obs);
p(7) = sum(((log(SR_obs) - log(SR_sim1)).^2)./(log(SR_sd)).^2);
p(8) = log10(p(1))-log10(p(3));
p_final(1,:) = p;
a(:,1)       = WP_sim;
a(:,2)       = SR_sim;

%
load('Ayora_drought_2.mat')
WP_obs      = data(19:36,3);  
max_f       = max(data(19:36,4)); % maximum respiration
SR_obs      = data(19:36,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(19:36,5)/max_f;

subplot(3,4,2);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('Ayora - Drought')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(1e-6) log10(10^3.5)])
ylim([0 1])
p(1) = 10^p(1);
mdl  = fitlm(SR_obs,SR_sim1);
p(4) = mdl.Rsquared.Adjusted;
p(5) = coefTest(mdl);
p(6) = length(WP_obs);
p(7) = sum(((log(SR_obs) - log(SR_sim1)).^2)./(log(SR_sd)).^2);
p(8) = log10(p(1))-log10(p(3));
p_final(2,:) = p;

%
load('GIG_ambient_2.mat')
WP_obs      = data(37:60,3);  
max_f       = max(data(37:60,4)); % maximum respiration
SR_obs      = data(37:60,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(37:60,5)/max_f;

% fig = figure;
subplot(3,4,3);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('GIG - Ambient')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(1e-6) log10(10^3.5)])
ylim([0 1])
p(1) = 10^p(1);
mdl  = fitlm(SR_obs,SR_sim1);
p(4) = mdl.Rsquared.Adjusted;
p(5) = coefTest(mdl);
p(6) = length(WP_obs);
p(7) = sum(((log(SR_obs) - log(SR_sim1)).^2)./(log(SR_sd)).^2);
p(8) = log10(p(1))-log10(p(3));
p_final(3,:) = p;
a(:,3)       = WP_sim;
a(:,4)       = SR_sim;

%
load('GIG_drought_2.mat')
WP_obs      = data(61:84,3);  
max_f       = max(data(61:84,4)); % maximum respiration
SR_obs      = data(61:84,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(61:84,5)/max_f;

subplot(3,4,4);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('GIG - Drought')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(1e-6) log10(10^3.5)])
ylim([0 1])
p(1) = 10^p(1);
mdl  = fitlm(SR_obs,SR_sim1);
p(4) = mdl.Rsquared.Adjusted;
p(5) = coefTest(mdl);
p(6) = length(WP_obs);
p(7) = sum(((log(SR_obs) - log(SR_sim1)).^2)./(log(SR_sd)).^2);
p(8) = log10(p(1))-log10(p(3));
p_final(4,:) = p;

%
load('P12_ambient_2.mat')
WP_obs      = data(85:108,3);  
max_f       = max(data(85:108,4)); % maximum respiration
SR_obs      = data(85:108,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(85:108,5)/max_f;

% fig = figure;
subplot(3,4,5);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('P12 - Ambient')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(1e-6) log10(10^3.5)])
ylim([0 1])
p(1) = 10^p(1);
mdl  = fitlm(SR_obs,SR_sim1);
p(4) = mdl.Rsquared.Adjusted;
p(5) = coefTest(mdl);
p(6) = length(WP_obs);
p(7) = sum(((log(SR_obs) - log(SR_sim1)).^2)./(log(SR_sd)).^2);
p(8) = log10(p(1))-log10(p(3));
p_final(5,:) = p;
a(:,5)       = WP_sim;
a(:,6)       = SR_sim;

%
load('P12_drought_2.mat')
WP_obs      = data(109:132,3);  
max_f       = max(data(109:132,4)); % maximum respiration
SR_obs      = data(109:132,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(109:132,5)/max_f;

subplot(3,4,6);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('P12 - Drought')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(1e-6) log10(10^3.5)])
ylim([0 1])
p(1) = 10^p(1);
mdl  = fitlm(SR_obs,SR_sim1);
p(4) = mdl.Rsquared.Adjusted;
p(5) = coefTest(mdl);
p(6) = length(WP_obs);
p(7) = sum(((log(SR_obs) - log(SR_sim1)).^2)./(log(SR_sd)).^2);
p(8) = log10(p(1))-log10(p(3));
p_final(6,:) = p;

%
load('P13_ambient_2.mat')
WP_obs      = data(133:156,3);  
max_f       = max(data(133:156,4)); % maximum respiration
SR_obs      = data(133:156,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(133:156,5)/max_f;

% fig = figure;
subplot(3,4,7);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('P13 - Ambient')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(1e-6) log10(10^3.5)])
ylim([0 1])
p(1) = 10^p(1);
mdl  = fitlm(SR_obs,SR_sim1);
p(4) = mdl.Rsquared.Adjusted;
p(5) = coefTest(mdl);
p(6) = length(WP_obs);
p(7) = sum(((log(SR_obs) - log(SR_sim1)).^2)./(log(SR_sd)).^2);
p(8) = log10(p(1))-log10(p(3));
p_final(7,:) = p;
a(:,7)       = WP_sim;
a(:,8)       = SR_sim;

%
load('P13_drought_2.mat')
WP_obs      = data(157:180,3);  
max_f       = max(data(157:180,4)); % maximum respiration
SR_obs      = data(157:180,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(157:180,5)/max_f;

subplot(3,4,8);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('P13 - Drought')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(1e-6) log10(10^3.5)])
ylim([0 1])
p(1) = 10^p(1);
mdl  = fitlm(SR_obs,SR_sim1);
p(4) = mdl.Rsquared.Adjusted;
p(5) = coefTest(mdl);
p(6) = length(WP_obs);
p(7) = sum(((log(SR_obs) - log(SR_sim1)).^2)./(log(SR_sd)).^2);
p(8) = log10(p(1))-log10(p(3));
p_final(8,:) = p;

%
load('PNE_unburned_ambient_2.mat')
WP_obs      = data(181:198,3);  
max_f       = max(data(181:198,4)); % maximum respiration
SR_obs      = data(181:198,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(181:198,5)/max_f;

% fig = figure;
subplot(3,4,9);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('PNE unburned - Ambient')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(1e-6) log10(10^3.5)])
ylim([0 1])
p(1) = 10^p(1);
mdl  = fitlm(SR_obs,SR_sim1);
p(4) = mdl.Rsquared.Adjusted;
p(5) = coefTest(mdl);
p(6) = length(WP_obs);
p(7) = sum(((log(SR_obs) - log(SR_sim1)).^2)./(log(SR_sd)).^2);
p(8) = log10(p(1))-log10(p(3));
p_final(9,:) = p;
a(:,9)       = WP_sim;
a(:,10)      = SR_sim;

%
load('PNE_unburned_drought_2.mat')
WP_obs      = data(199:216,3);  
max_f       = max(data(199:216,4)); % maximum respiration
SR_obs      = data(199:216,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(199:216,5)/max_f;

subplot(3,4,10);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('PNE unburned - Drought')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(1e-6) log10(10^3.5)])
ylim([0 1])
p(1) = 10^p(1);
mdl  = fitlm(SR_obs,SR_sim1);
p(4) = mdl.Rsquared.Adjusted;
p(5) = coefTest(mdl);
p(6) = length(WP_obs);
p(7) = sum(((log(SR_obs) - log(SR_sim1)).^2)./(log(SR_sd)).^2);
p(8) = log10(p(1))-log10(p(3));
p_final(10,:) = p;

%
load('Purdue.us_ambient_2.mat')
WP_obs      = data(217:240,3);  
max_f       = max(data(217:240,4)); % maximum respiration
SR_obs      = data(217:240,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(217:240,5)/max_f;

% fig = figure;
subplot(3,4,11);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('Purdue - Ambient')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(1e-6) log10(10^3.5)])
ylim([0 1])
p(1) = 10^p(1);
mdl  = fitlm(SR_obs,SR_sim1);
p(4) = mdl.Rsquared.Adjusted;
p(5) = coefTest(mdl);
p(6) = length(WP_obs);
p(7) = sum(((log(SR_obs) - log(SR_sim1)).^2)./(log(SR_sd)).^2);
p(8) = log10(p(1))-log10(p(3));
p_final(11,:) = p;
a(:,11)       = WP_sim;
a(:,12)       = SR_sim;
%
load('Purdue.us_drought_2.mat')
WP_obs      = data(241:264,3);  
max_f       = max(data(241:264,4)); % maximum respiration
SR_obs      = data(241:264,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(241:264,5)/max_f;

subplot(3,4,12);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('Purdue - Drought')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(1e-6) log10(10^3.5)])
ylim([0 1])
p(1) = 10^p(1);
mdl  = fitlm(SR_obs,SR_sim1);
p(4) = mdl.Rsquared.Adjusted;
p(5) = coefTest(mdl);
p(6) = length(WP_obs);
p(7) = sum(((log(SR_obs) - log(SR_sim1)).^2)./(log(SR_sd)).^2);
p(8) = log10(p(1))-log10(p(3));
p_final(12,:) = p;

%

load('Sev.mix_ambient_2.mat')
WP_obs      = data(265:294,3);  
max_f       = max(data(265:294,4)); % maximum respiration
SR_obs      = data(265:294,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(265:294,5)/max_f;

fig = figure;
subplot(3,4,1);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('Sev.mix - Ambient')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(1e-6) log10(10^3.5)])
ylim([0 1])
p(1) = 10^p(1);
mdl  = fitlm(SR_obs,SR_sim1);
p(4) = mdl.Rsquared.Adjusted;
p(5) = coefTest(mdl);
p(6) = length(WP_obs);
p(7) = sum(((log(SR_obs) - log(SR_sim1)).^2)./(log(SR_sd)).^2);
p(8) = log10(p(1))-log10(p(3));
p_final(13,:) = p;
a(:,13)       = WP_sim;
a(:,14)       = SR_sim;

%
load('Sev.mix_drought_2.mat')
WP_obs      = data(295:324,3);  
max_f       = max(data(295:324,4)); % maximum respiration
SR_obs      = data(295:324,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(295:324,5)/max_f;

subplot(3,4,2);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('Sev.mix - Drought')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(1e-6) log10(10^3.5)])
ylim([0 1])
p(1) = 10^p(1);
mdl  = fitlm(SR_obs,SR_sim1);
p(4) = mdl.Rsquared.Adjusted;
p(5) = coefTest(mdl);
p(6) = length(WP_obs);
p(7) = sum(((log(SR_obs) - log(SR_sim1)).^2)./(log(SR_sd)).^2);
p(8) = log10(p(1))-log10(p(3));
p_final(14,:) = p;

%
load('baddrt.de_ambient_2.mat')
WP_obs      = data(325:354,3);  
max_f       = max(data(325:354,4)); % maximum respiration
SR_obs      = data(325:354,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(325:354,5)/max_f;

% fig = figure;
subplot(3,4,3);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('baddrt - Ambient')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(1e-6) log10(10^3.5)])
ylim([0 1])
p(1) = 10^p(1);
mdl  = fitlm(SR_obs,SR_sim1);
p(4) = mdl.Rsquared.Adjusted;
p(5) = coefTest(mdl);
p(6) = length(WP_obs);
p(7) = sum(((log(SR_obs) - log(SR_sim1)).^2)./(log(SR_sd)).^2);
p(8) = log10(p(1))-log10(p(3));
p_final(15,:) = p;
a(:,15)       = WP_sim;
a(:,16)       = SR_sim;

load('baddrt.de_drought_2.mat')
WP_obs      = data(355:383,3);  
max_f       = max(data(355:383,4)); % maximum respiration
SR_obs      = data(355:383,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(355:383,5)/max_f;

subplot(3,4,4);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('baddrt - Drought')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(1e-6) log10(10^3.5)])
ylim([0 1])
p(1) = 10^p(1);
mdl  = fitlm(SR_obs,SR_sim1);
p(4) = mdl.Rsquared.Adjusted;
p(5) = coefTest(mdl);
p(6) = length(WP_obs);
p(7) = sum(((log(SR_obs) - log(SR_sim1)).^2)./(log(SR_sd)).^2);
p(8) = log10(p(1))-log10(p(3));
p_final(16,:) = p;

%
load('brhill.au_ambient_2.mat')
WP_obs      = data(384:401,3);  
max_f       = max(data(384:401,4)); % maximum respiration
SR_obs      = data(384:401,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(384:401,5)/max_f;

% fig = figure;
subplot(3,4,5);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('brhill - Ambient')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(1e-6) log10(10^3.5)])
ylim([0 1])
p(1) = 10^p(1);
mdl  = fitlm(SR_obs,SR_sim1);
p(4) = mdl.Rsquared.Adjusted;
p(5) = coefTest(mdl);
p(6) = length(WP_obs);
p(7) = sum(((log(SR_obs) - log(SR_sim1)).^2)./(log(SR_sd)).^2);
p(8) = log10(p(1))-log10(p(3));
p_final(17,:) = p;
a(:,17)       = WP_sim;
a(:,18)       = SR_sim;

%
load('brhill.au_drought_2.mat')
WP_obs      = data(402:419,3);  
max_f       = max(data(402:419,4)); % maximum respiration
SR_obs      = data(402:419,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(402:419,5)/max_f;

subplot(3,4,6);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('brhill - Drought')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(1e-6) log10(10^3.5)])
ylim([0 1])
p(1) = 10^p(1);
mdl  = fitlm(SR_obs,SR_sim1);
p(4) = mdl.Rsquared.Adjusted;
p(5) = coefTest(mdl);
p(6) = length(WP_obs);
p(7) = sum(((log(SR_obs) - log(SR_sim1)).^2)./(log(SR_sd)).^2);
p(8) = log10(p(1))-log10(p(3));
p_final(18,:) = p;

%
load('brookdale.ca_ambient_2.mat')
WP_obs      = data(420:437,3);  
max_f       = max(data(420:437,4)); % maximum respiration
SR_obs      = data(420:437,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(420:437,5)/max_f;

% fig = figure;
subplot(3,4,7);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('brookdale - Ambient')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(1e-6) log10(10^3.5)])
ylim([0 1])
p(1) = 10^p(1);
mdl  = fitlm(SR_obs,SR_sim1);
p(4) = mdl.Rsquared.Adjusted;
p(5) = coefTest(mdl);
p(6) = length(WP_obs);
p(7) = sum(((log(SR_obs) - log(SR_sim1)).^2)./(log(SR_sd)).^2);
p(8) = log10(p(1))-log10(p(3));
p_final(19,:) = p;
a(:,19)       = WP_sim;
a(:,20)       = SR_sim;

%
load('brookdale.ca_drought_2.mat')
WP_obs      = data(438:455,3);  
max_f       = max(data(438:455,4)); % maximum respiration
SR_obs      = data(438:455,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(438:455,5)/max_f;

subplot(3,4,8);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('brookdale - Drought')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(1e-6) log10(10^3.5)])
ylim([0 1])
p(1) = 10^p(1);
mdl  = fitlm(SR_obs,SR_sim1);
p(4) = mdl.Rsquared.Adjusted;
p(5) = coefTest(mdl);
p(6) = length(WP_obs);
p(7) = sum(((log(SR_obs) - log(SR_sim1)).^2)./(log(SR_sd)).^2);
p(8) = log10(p(1))-log10(p(3));
p_final(20,:) = p;

%
load('cedarsav.us_ambient_2.mat')
WP_obs      = data(456:484,3);  
max_f       = max(data(456:484,4)); % maximum respiration
SR_obs      = data(456:484,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(456:484,5)/max_f;

% fig = figure;
subplot(3,4,9);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('cedarsav - Ambient')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(1e-6) log10(10^3.5)])
ylim([0 1])
p(1) = 10^p(1);
mdl  = fitlm(SR_obs,SR_sim1);
p(4) = mdl.Rsquared.Adjusted;
p(5) = coefTest(mdl);
p(6) = length(WP_obs);
p(7) = sum(((log(SR_obs) - log(SR_sim1)).^2)./(log(SR_sd)).^2);
p(8) = log10(p(1))-log10(p(3));
p_final(21,:) = p;
a(:,21)       = WP_sim;
a(:,22)       = SR_sim;

%
load('cedarsav.us_drought_2.mat')
WP_obs      = data(485:512,3);  
max_f       = max(data(485:512,4)); % maximum respiration
SR_obs      = data(485:512,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(485:512,5)/max_f;

subplot(3,4,10);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('cedarsav - Drought')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(1e-6) log10(10^3.5)])
ylim([0 1])
p(1) = 10^p(1);
mdl  = fitlm(SR_obs,SR_sim1);
p(4) = mdl.Rsquared.Adjusted;
p(5) = coefTest(mdl);
p(6) = length(WP_obs);
p(7) = sum(((log(SR_obs) - log(SR_sim1)).^2)./(log(SR_sd)).^2);
p(8) = log10(p(1))-log10(p(3));
p_final(22,:) = p;

%
load('cobar.au_ambient_2.mat')
WP_obs      = data(513:529,3);  
max_f       = max(data(513:529,4)); % maximum respiration
SR_obs      = data(513:529,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(513:529,5)/max_f;

% fig = figure;
subplot(3,4,11);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('cobar - Ambient')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(1e-6) log10(10^3.5)])
ylim([0 1])
p(1) = 10^p(1);
mdl  = fitlm(SR_obs,SR_sim1);
p(4) = mdl.Rsquared.Adjusted;
p(5) = coefTest(mdl);
p(6) = length(WP_obs);
p(7) = sum(((log(SR_obs) - log(SR_sim1)).^2)./(log(SR_sd)).^2);
p(8) = log10(p(1))-log10(p(3));
p_final(23,:) = p;
a(:,23)       = WP_sim;
a(:,24)       = SR_sim;

%
load('cobar.au_drought_2.mat')
WP_obs      = data(530:546,3);  
max_f       = max(data(530:546,4)); % maximum respiration
SR_obs      = data(530:546,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(530:546,5)/max_f;

subplot(3,4,12);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('cobar - Drought')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(1e-6) log10(10^3.5)])
ylim([0 1])
p(1) = 10^p(1);
mdl  = fitlm(SR_obs,SR_sim1);
p(4) = mdl.Rsquared.Adjusted;
p(5) = coefTest(mdl);
p(6) = length(WP_obs);
p(7) = sum(((log(SR_obs) - log(SR_sim1)).^2)./(log(SR_sd)).^2);
p(8) = log10(p(1))-log10(p(3));
p_final(24,:) = p;

%

load('cowidrt.ca_ambient_2.mat')
WP_obs      = data(547:570,3);  
max_f       = max(data(547:570,4)); % maximum respiration
SR_obs      = data(547:570,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(547:570,5)/max_f;

fig = figure;
subplot(3,4,1);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('cowidrt - Ambient')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(1e-6) log10(10^3.5)])
ylim([0 1])
p(1) = 10^p(1);
mdl  = fitlm(SR_obs,SR_sim1);
p(4) = mdl.Rsquared.Adjusted;
p(5) = coefTest(mdl);
p(6) = length(WP_obs);
p(7) = sum(((log(SR_obs) - log(SR_sim1)).^2)./(log(SR_sd)).^2);
p(8) = log10(p(1))-log10(p(3));
p_final(25,:) = p;
a(:,25)       = WP_sim;
a(:,26)       = SR_sim;

%
load('cowidrt.ca_drought_2.mat')
WP_obs      = data(571:594,3);  
max_f       = max(data(571:594,4)); % maximum respiration
SR_obs      = data(571:594,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(571:594,5)/max_f;

subplot(3,4,2);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('cowidrt - Drought')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(1e-6) log10(10^3.5)])
ylim([0 1])
p(1) = 10^p(1);
mdl  = fitlm(SR_obs,SR_sim1);
p(4) = mdl.Rsquared.Adjusted;
p(5) = coefTest(mdl);
p(6) = length(WP_obs);
p(7) = sum(((log(SR_obs) - log(SR_sim1)).^2)./(log(SR_sd)).^2);
p(8) = log10(p(1))-log10(p(3));
p_final(26,:) = p;

%
load('dona.ana_ambient_2.mat')
WP_obs      = data(595:617,3);  
max_f       = max(data(595:617,4)); % maximum respiration
SR_obs      = data(595:617,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(595:617,5)/max_f;

% fig = figure;
subplot(3,4,3);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('dona ana - Ambient')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(1e-6) log10(10^3.5)])
ylim([0 1])
p(1) = 10^p(1);
mdl  = fitlm(SR_obs,SR_sim1);
p(4) = mdl.Rsquared.Adjusted;
p(5) = coefTest(mdl);
p(6) = length(WP_obs);
p(7) = sum(((log(SR_obs) - log(SR_sim1)).^2)./(log(SR_sd)).^2);
p(8) = log10(p(1))-log10(p(3));
p_final(27,:) = p;
a(:,27)       = WP_sim;
a(:,28)       = SR_sim;

%
load('dona.ana_drought_2.mat')
WP_obs      = data(618:641,3);  
max_f       = max(data(618:641,4)); % maximum respiration
SR_obs      = data(618:641,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(618:641,5)/max_f;

subplot(3,4,4);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('dona ana - Drought')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(1e-6) log10(10^3.5)])
ylim([0 1])
p(1) = 10^p(1);
mdl  = fitlm(SR_obs,SR_sim1);
p(4) = mdl.Rsquared.Adjusted;
p(5) = coefTest(mdl);
p(6) = length(WP_obs);
p(7) = sum(((log(SR_obs) - log(SR_sim1)).^2)./(log(SR_sd)).^2);
p(8) = log10(p(1))-log10(p(3));
p_final(28,:) = p;

%
load('hoide.de_ambient_2.mat')
WP_obs      = data(642:659,3);  
max_f       = max(data(642:659,4)); % maximum respiration
SR_obs      = data(642:659,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(642:659,5)/max_f;

% fig = figure;
subplot(3,4,5);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('hoide - Ambient')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(1e-6) log10(10^3.5)])
ylim([0 1])
p(1) = 10^p(1);
mdl  = fitlm(SR_obs,SR_sim1);
p(4) = mdl.Rsquared.Adjusted;
p(5) = coefTest(mdl);
p(6) = length(WP_obs);
p(7) = sum(((log(SR_obs) - log(SR_sim1)).^2)./(log(SR_sd)).^2);
p(8) = log10(p(1))-log10(p(3));
p_final(29,:) = p;
a(:,29)       = WP_sim;
a(:,30)       = SR_sim;

%
load('hoide.de_drought_2.mat')
WP_obs      = data(660:677,3);  
max_f       = max(data(660:677,4)); % maximum respiration
SR_obs      = data(660:677,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(660:677,5)/max_f;

subplot(3,4,6);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('hoide - Drought')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(1e-6) log10(10^3.5)])
ylim([0 1])
p(1) = 10^p(1);
mdl  = fitlm(SR_obs,SR_sim1);
p(4) = mdl.Rsquared.Adjusted;
p(5) = coefTest(mdl);
p(6) = length(WP_obs);
p(7) = sum(((log(SR_obs) - log(SR_sim1)).^2)./(log(SR_sd)).^2);
p(8) = log10(p(1))-log10(p(3));
p_final(30,:) = p;

%
load('horacg.cr_ambient_2.mat')
WP_obs      = data(678:701,3);  
max_f       = max(data(678:701,4)); % maximum respiration
SR_obs      = data(678:701,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(678:701,5)/max_f;

% fig = figure;
subplot(3,4,7);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('horacg - Ambient')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(1e-6) log10(10^3.5)])
ylim([0 1])
p(1) = 10^p(1);
mdl  = fitlm(SR_obs,SR_sim1);
p(4) = mdl.Rsquared.Adjusted;
p(5) = coefTest(mdl);
p(6) = length(WP_obs);
p(7) = sum(((log(SR_obs) - log(SR_sim1)).^2)./(log(SR_sd)).^2);
p(8) = log10(p(1))-log10(p(3));
p_final(31,:) = p;
a(:,31)       = WP_sim;
a(:,32)       = SR_sim;

%
load('horacg.cr_drought_2.mat')
WP_obs      = data(702:725,3);  
max_f       = max(data(702:725,4)); % maximum respiration
SR_obs      = data(702:725,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(702:725,5)/max_f;

subplot(3,4,8);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('horacg - Drought')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(1e-6) log10(10^3.5)])
ylim([0 1])
p(1) = 10^p(1);
mdl  = fitlm(SR_obs,SR_sim1);
p(4) = mdl.Rsquared.Adjusted;
p(5) = coefTest(mdl);
p(6) = length(WP_obs);
p(7) = sum(((log(SR_obs) - log(SR_sim1)).^2)./(log(SR_sd)).^2);
p(8) = log10(p(1))-log10(p(3));
p_final(32,:) = p;

%
load('hyide.de_ambient_2.mat')
WP_obs      = data(726:742,3);  
max_f       = max(data(726:742,4)); % maximum respiration
SR_obs      = data(726:742,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(726:742,5)/max_f;

% fig = figure;
subplot(3,4,9);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('hyide - Ambient')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(1e-6) log10(10^3.5)])
ylim([0 1])
p(1) = 10^p(1);
mdl  = fitlm(SR_obs,SR_sim1);
p(4) = mdl.Rsquared.Adjusted;
p(5) = coefTest(mdl);
p(6) = length(WP_obs);
p(7) = sum(((log(SR_obs) - log(SR_sim1)).^2)./(log(SR_sd)).^2);
p(8) = log10(p(1))-log10(p(3));
p_final(33,:) = p;
a(:,33)       = WP_sim;
a(:,34)       = SR_sim;

%
load('hyide.de_drought_2.mat')
WP_obs      = data(743:760,3);  
max_f       = max(data(743:760,4)); % maximum respiration
SR_obs      = data(743:760,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(743:760,5)/max_f;

subplot(3,4,10);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('hyide - Drought')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(1e-6) log10(10^3.5)])
ylim([0 1])
p(1) = 10^p(1);
mdl  = fitlm(SR_obs,SR_sim1);
p(4) = mdl.Rsquared.Adjusted;
p(5) = coefTest(mdl);
p(6) = length(WP_obs);
p(7) = sum(((log(SR_obs) - log(SR_sim1)).^2)./(log(SR_sd)).^2);
p(8) = log10(p(1))-log10(p(3));
p_final(34,:) = p;

%
load('lygra.no_ambient_2.mat')
WP_obs      = data(761:778,3);  
max_f       = max(data(761:778,4)); % maximum respiration
SR_obs      = data(761:778,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(761:778,5)/max_f;

% fig = figure;
subplot(3,4,11);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('lygra - Ambient')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(1e-6) log10(10^3.5)])
ylim([0 1])
p(1) = 10^p(1);
mdl  = fitlm(SR_obs,SR_sim1);
p(4) = mdl.Rsquared.Adjusted;
p(5) = coefTest(mdl);
p(6) = length(WP_obs);
p(7) = sum(((log(SR_obs) - log(SR_sim1)).^2)./(log(SR_sd)).^2);
p(8) = log10(p(1))-log10(p(3));
p_final(35,:) = p;
a(:,35)       = WP_sim;
a(:,36)       = SR_sim;

%
load('lygra.no_drought_2.mat')
WP_obs      = data(779:796,3);  
max_f       = max(data(779:796,4)); % maximum respiration
SR_obs      = data(779:796,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(779:796,5)/max_f;

subplot(3,4,12);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('lygra - Drought')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(1e-6) log10(10^3.5)])
ylim([0 1])
p(1) = 10^p(1);
mdl  = fitlm(SR_obs,SR_sim1);
p(4) = mdl.Rsquared.Adjusted;
p(5) = coefTest(mdl);
p(6) = length(WP_obs);
p(7) = sum(((log(SR_obs) - log(SR_sim1)).^2)./(log(SR_sd)).^2);
p(8) = log10(p(1))-log10(p(3));
p_final(36,:) = p;

%

load('nyngan.au_ambient_2.mat')
WP_obs      = data(797:814,3);  
max_f       = max(data(797:814,4)); % maximum respiration
SR_obs      = data(797:814,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(797:814,5)/max_f;

fig = figure;
subplot(3,4,1);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('nyngan - Ambient')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(1e-6) log10(10^3.5)])
ylim([0 1])
p(1) = 10^p(1);
mdl  = fitlm(SR_obs,SR_sim1);
p(4) = mdl.Rsquared.Adjusted;
p(5) = coefTest(mdl);
p(6) = length(WP_obs);
p(7) = sum(((log(SR_obs) - log(SR_sim1)).^2)./(log(SR_sd)).^2);
p(8) = log10(p(1))-log10(p(3));
p_final(37,:) = p;
a(:,37)       = WP_sim;
a(:,38)       = SR_sim;

%
load('nyngan.au_drought_2.mat')
WP_obs      = data(815:832,3);  
max_f       = max(data(815:832,4)); % maximum respiration
SR_obs      = data(815:832,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(815:832,5)/max_f;

subplot(3,4,2);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('nyngan - Drought')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(1e-6) log10(10^3.5)])
ylim([0 1])
p(1) = 10^p(1);
mdl  = fitlm(SR_obs,SR_sim1);
p(4) = mdl.Rsquared.Adjusted;
p(5) = coefTest(mdl);
p(6) = length(WP_obs);
p(7) = sum(((log(SR_obs) - log(SR_sim1)).^2)./(log(SR_sd)).^2);
p(8) = log10(p(1))-log10(p(3));
p_final(38,:) = p;

%
load('passogavia.it_ambient_2.mat')
WP_obs      = data(833:856,3);  
max_f       = max(data(833:856,4)); % maximum respiration
SR_obs      = data(833:856,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(833:856,5)/max_f;

% fig = figure;
subplot(3,4,3);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('passogavia - Ambient')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(1e-6) log10(10^3.5)])
ylim([0 1])
p(1) = 10^p(1);
mdl  = fitlm(SR_obs,SR_sim1);
p(4) = mdl.Rsquared.Adjusted;
p(5) = coefTest(mdl);
p(6) = length(WP_obs);
p(7) = sum(((log(SR_obs) - log(SR_sim1)).^2)./(log(SR_sd)).^2);
p(8) = log10(p(1))-log10(p(3));
p_final(39,:) = p;
a(:,39)       = WP_sim;
a(:,40)       = SR_sim;

%
load('passogavia.it_drought_2.mat')
WP_obs      = data(857:880,3);  
max_f       = max(data(857:880,4)); % maximum respiration
SR_obs      = data(857:880,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(857:880,5)/max_f;

subplot(3,4,4);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('passogavia - Drought')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(1e-6) log10(10^3.5)])
ylim([0 1])
p(1) = 10^p(1);
mdl  = fitlm(SR_obs,SR_sim1);
p(4) = mdl.Rsquared.Adjusted;
p(5) = coefTest(mdl);
p(6) = length(WP_obs);
p(7) = sum(((log(SR_obs) - log(SR_sim1)).^2)./(log(SR_sd)).^2);
p(8) = log10(p(1))-log10(p(3));
p_final(40,:) = p;

%
load('riomayo.ar_ambient_2.mat')
WP_obs      = data(881:895,3);  
max_f       = max(data(881:895,4)); % maximum respiration
SR_obs      = data(881:895,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(881:895,5)/max_f;

% fig = figure;
subplot(3,4,5);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('riomayo - Ambient')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(1e-6) log10(10^3.5)])
ylim([0 1])
p(1) = 10^p(1);
mdl  = fitlm(SR_obs,SR_sim1);
p(4) = mdl.Rsquared.Adjusted;
p(5) = coefTest(mdl);
p(6) = length(WP_obs);
p(7) = sum(((log(SR_obs) - log(SR_sim1)).^2)./(log(SR_sd)).^2);
p(8) = log10(p(1))-log10(p(3));
p_final(41,:) = p;
a(:,41)       = WP_sim;
a(:,42)       = SR_sim;

%
load('riomayo.ar_drought_2.mat')
WP_obs      = data(896:912,3);  
max_f       = max(data(896:912,4)); % maximum respiration
SR_obs      = data(896:912,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(896:912,5)/max_f;

subplot(3,4,6);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('riomayo - Drought')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(1e-6) log10(10^3.5)])
ylim([0 1])
p(1) = 10^p(1);
mdl  = fitlm(SR_obs,SR_sim1);
p(4) = mdl.Rsquared.Adjusted;
p(5) = coefTest(mdl);
p(6) = length(WP_obs);
p(7) = sum(((log(SR_obs) - log(SR_sim1)).^2)./(log(SR_sd)).^2);
p(8) = log10(p(1))-log10(p(3));
p_final(42,:) = p;

%
load('scruzl.us_ambient_2.mat')
WP_obs      = data(913:942,3);  
max_f       = max(data(913:942,4)); % maximum respiration
SR_obs      = data(913:942,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(913:942,5)/max_f;

% fig = figure;
subplot(3,4,7);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('scruzl - Ambient')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(1e-6) log10(10^3.5)])
ylim([0 1])
p(1) = 10^p(1);
mdl  = fitlm(SR_obs,SR_sim1);
p(4) = mdl.Rsquared.Adjusted;
p(5) = coefTest(mdl);
p(6) = length(WP_obs);
p(7) = sum(((log(SR_obs) - log(SR_sim1)).^2)./(log(SR_sd)).^2);
p(8) = log10(p(1))-log10(p(3));
p_final(43,:) = p;
a(:,43)       = WP_sim;
a(:,44)       = SR_sim;

%
load('scruzl.us_drought_2.mat')
WP_obs      = data(943:972,3);  
max_f       = max(data(943:972,4)); % maximum respiration
SR_obs      = data(943:972,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(943:972,5)/max_f;

subplot(3,4,8);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('scruzl - Drought')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(1e-6) log10(10^3.5)])
ylim([0 1])
p(1) = 10^p(1);
mdl  = fitlm(SR_obs,SR_sim1);
p(4) = mdl.Rsquared.Adjusted;
p(5) = coefTest(mdl);
p(6) = length(WP_obs);
p(7) = sum(((log(SR_obs) - log(SR_sim1)).^2)./(log(SR_sd)).^2);
p(8) = log10(p(1))-log10(p(3));
p_final(44,:) = p;

%
load('sgsdrt.us_ambient_2.mat')
WP_obs      = data(973:995,3);  
max_f       = max(data(973:995,4)); % maximum respiration
SR_obs      = data(973:995,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(973:995,5)/max_f;

% fig = figure;
subplot(3,4,9);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('sgsdrt - Ambient')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(1e-6) log10(10^3.5)])
ylim([0 1])
p(1) = 10^p(1);
mdl  = fitlm(SR_obs,SR_sim1);
p(4) = mdl.Rsquared.Adjusted;
p(5) = coefTest(mdl);
p(6) = length(WP_obs);
p(7) = sum(((log(SR_obs) - log(SR_sim1)).^2)./(log(SR_sd)).^2);
p(8) = log10(p(1))-log10(p(3));
p_final(45,:) = p;
a(:,45)       = WP_sim;
a(:,46)       = SR_sim;

%
load('sgsdrt.us_drought_2.mat')
WP_obs      = data(996:1019,3);  
max_f       = max(data(996:1019,4)); % maximum respiration
SR_obs      = data(996:1019,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(996:1019,5)/max_f;

subplot(3,4,10);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('sgsdrt - Drought')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(1e-6) log10(10^3.5)])
ylim([0 1])
p(1) = 10^p(1);
mdl  = fitlm(SR_obs,SR_sim1);
p(4) = mdl.Rsquared.Adjusted;
p(5) = coefTest(mdl);
p(6) = length(WP_obs);
p(7) = sum(((log(SR_obs) - log(SR_sim1)).^2)./(log(SR_sd)).^2);
p(8) = log10(p(1))-log10(p(3));
p_final(46,:) = p;

%
load('skotsvar.no_ambient_2.mat')
WP_obs      = data(1020:1037,3);  
max_f       = max(data(1020:1037,4)); % maximum respiration
SR_obs      = data(1020:1037,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(1020:1037,5)/max_f;

% fig = figure;
subplot(3,4,11);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('skotsvar - Ambient')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(1e-6) log10(10^3.5)])
ylim([0 1])
p(1) = 10^p(1);
mdl  = fitlm(SR_obs,SR_sim1);
p(4) = mdl.Rsquared.Adjusted;
p(5) = coefTest(mdl);
p(6) = length(WP_obs);
p(7) = sum(((log(SR_obs) - log(SR_sim1)).^2)./(log(SR_sd)).^2);
p(8) = log10(p(1))-log10(p(3));
p_final(47,:) = p;
a(:,47)       = WP_sim;
a(:,48)       = SR_sim;

%
load('skotsvar.no_drought_2.mat')
WP_obs      = data(1038:1055,3);  
max_f       = max(data(1038:1055,4)); % maximum respiration
SR_obs      = data(1038:1055,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(1038:1055,5)/max_f;

subplot(3,4,12);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('skotsvar - Drought')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(1e-6) log10(10^3.5)])
ylim([0 1])
p(1) = 10^p(1);
mdl  = fitlm(SR_obs,SR_sim1);
p(4) = mdl.Rsquared.Adjusted;
p(5) = coefTest(mdl);
p(6) = length(WP_obs);
p(7) = sum(((log(SR_obs) - log(SR_sim1)).^2)./(log(SR_sd)).^2);
p(8) = log10(p(1))-log10(p(3));
p_final(48,:) = p;

% 

load('ukulingadrt.za_ambient_2.mat')
WP_obs      = data(1056:1073,3);  
max_f       = max(data(1056:1073,4)); % maximum respiration
SR_obs      = data(1056:1073,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(1056:1073,5)/max_f;

fig = figure;
subplot(3,4,1);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('ukulingadrt - Ambient')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(1e-6) log10(10^3.5)])
ylim([0 1])
p(1) = 10^p(1);
mdl  = fitlm(SR_obs,SR_sim1);
p(4) = mdl.Rsquared.Adjusted;
p(5) = coefTest(mdl);
p(6) = length(WP_obs);
p(7) = sum(((log(SR_obs) - log(SR_sim1)).^2)./(log(SR_sd)).^2);
p(8) = log10(p(1))-log10(p(3));
p_final(49,:) = p;
a(:,49)       = WP_sim;
a(:,50)       = SR_sim;

%
load('ukulingadrt.za_drought_2.mat')
WP_obs      = data(1074:1091,3);  
max_f       = max(data(1074:1091,4)); % maximum respiration
SR_obs      = data(1074:1091,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(1074:1091,5)/max_f;

subplot(3,4,2);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('ukulingadrt - Drought')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(1e-6) log10(10^3.5)])
ylim([0 1])
p(1) = 10^p(1);
mdl  = fitlm(SR_obs,SR_sim1);
p(4) = mdl.Rsquared.Adjusted;
p(5) = coefTest(mdl);
p(6) = length(WP_obs);
p(7) = sum(((log(SR_obs) - log(SR_sim1)).^2)./(log(SR_sd)).^2);
p(8) = log10(p(1))-log10(p(3));
p_final(50,:) = p;

%
load('wayqe.re_ambient_2.mat')
WP_obs      = data(1092:1109,3);  
max_f       = max(data(1092:1109,4)); % maximum respiration
SR_obs      = data(1092:1109,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(1092:1109,5)/max_f;

% fig = figure;
subplot(3,4,3);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('wayqe - Ambient')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(1e-6) log10(10^3.5)])
ylim([0 1])
p(1) = 10^p(1);
mdl  = fitlm(SR_obs,SR_sim1);
p(4) = mdl.Rsquared.Adjusted;
p(5) = coefTest(mdl);
p(6) = length(WP_obs);
p(7) = sum(((log(SR_obs) - log(SR_sim1)).^2)./(log(SR_sd)).^2);
p(8) = log10(p(1))-log10(p(3));
p_final(51,:) = p;
a(:,51)       = WP_sim;
a(:,52)       = SR_sim;

%
load('wayqe.re_drought_2.mat')
WP_obs      = data(1110:1127,3);  
max_f       = max(data(1110:1127,4)); % maximum respiration
SR_obs      = data(1110:1127,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(1110:1127,5)/max_f;

subplot(3,4,4);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('wayqe - Drought')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(1e-6) log10(10^3.5)])
ylim([0 1])
p(1) = 10^p(1);
mdl  = fitlm(SR_obs,SR_sim1);
p(4) = mdl.Rsquared.Adjusted;
p(5) = coefTest(mdl);
p(6) = length(WP_obs);
p(7) = sum(((log(SR_obs) - log(SR_sim1)).^2)./(log(SR_sd)).^2);
p(8) = log10(p(1))-log10(p(3));
p_final(52,:) = p;

%%

p      = p_final;
save('p_final_manzoni_2.mat','p')
VG_titles = {'psi_th' 'alpha' 'psi_fc' 'r^2' 'p-value' 'sample size' 'SEE' 'Respiration_breadth'};
C = [VG_titles; num2cell(p)];
writecell(C,'parameters_manzoni_2.csv') 

writematrix(a,'matrices_ambient_2.csv') 

%% Calling Data %%

data    = load("china_matlab.txt");
p_final = zeros(10,8);
a       = zeros(1e6,20);

%% Plotting %%

load('Urat_ambient_2.mat')
WP_obs      = data(1:36,3);  
max_f       = max(data(1:36,4)); % maximum respiration
SR_obs      = data(1:36,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(1:36,5)/max_f;

fig = figure;
subplot(3,4,1);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('Urat - Ambient')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(1e-6) log10(10^3.5)])
ylim([0 1])
p(1) = 10^p(1);
mdl  = fitlm(SR_obs,SR_sim1);
p(4) = mdl.Rsquared.Adjusted;
p(5) = coefTest(mdl);
p(6) = length(WP_obs);
p(7) = sum(((log(SR_obs) - log(SR_sim1)).^2)./(log(SR_sd)).^2);
p(8) = log10(p(1))-log10(p(3));
p_final(1,:) = p;
a(:,1)       = WP_sim;
a(:,2)       = SR_sim;

load('Urat_drought_2.mat')
WP_obs      = data(37:72,3);  
max_f       = max(data(37:72,4)); % maximum respiration
SR_obs      = data(37:72,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(37:72,5)/max_f;

subplot(3,4,2);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('Urat - Drought')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(1e-6) log10(10^3.5)])
ylim([0 1])
p(1) = 10^p(1);
mdl  = fitlm(SR_obs,SR_sim1);
p(4) = mdl.Rsquared.Adjusted;
p(5) = coefTest(mdl);
p(6) = length(WP_obs);
p(7) = sum(((log(SR_obs) - log(SR_sim1)).^2)./(log(SR_sd)).^2);
p(8) = log10(p(1))-log10(p(3));
p_final(2,:) = p;
a(:,3)       = WP_sim;
a(:,4)       = SR_sim;

load('Yanchi_ambient_2.mat')
WP_obs      = data(73:108,3);  
max_f       = max(data(73:108,4)); % maximum respiration
SR_obs      = data(73:108,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(73:108,5)/max_f;

subplot(3,4,3);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('Yanchi - Ambient')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(1e-6) log10(10^3.5)])
ylim([0 1])
p(1) = 10^p(1);
mdl  = fitlm(SR_obs,SR_sim1);
p(4) = mdl.Rsquared.Adjusted;
p(5) = coefTest(mdl);
p(6) = length(WP_obs);
p(7) = sum(((log(SR_obs) - log(SR_sim1)).^2)./(log(SR_sd)).^2);
p(8) = log10(p(1))-log10(p(3));
p_final(3,:) = p;
a(:,5)       = WP_sim;
a(:,6)       = SR_sim;

load('Yanchi_drought_2.mat')
WP_obs      = data(109:144,3);  
max_f       = max(data(109:144,4)); % maximum respiration
SR_obs      = data(109:144,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(109:144,5)/max_f;

subplot(3,4,4);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('Yanchi - Drought')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(1e-6) log10(10^3.5)])
ylim([0 1])
p(1) = 10^p(1);
mdl  = fitlm(SR_obs,SR_sim1);
p(4) = mdl.Rsquared.Adjusted;
p(5) = coefTest(mdl);
p(6) = length(WP_obs);
p(7) = sum(((log(SR_obs) - log(SR_sim1)).^2)./(log(SR_sd)).^2);
p(8) = log10(p(1))-log10(p(3));
p_final(4,:) = p;
a(:,7)       = WP_sim;
a(:,8)       = SR_sim;

load('Hongyuan_ambient_2.mat')
WP_obs      = data(145:167,3);  
max_f       = max(data(145:167,4)); % maximum respiration
SR_obs      = data(145:167,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(145:167,5)/max_f;

subplot(3,4,5);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('Hongyuan - Ambient')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(1e-6) log10(10^3.5)])
ylim([0 1])
p(1) = 10^p(1);
mdl  = fitlm(SR_obs,SR_sim1);
p(4) = mdl.Rsquared.Adjusted;
p(5) = coefTest(mdl);
p(6) = length(WP_obs);
p(7) = sum(((log(SR_obs) - log(SR_sim1)).^2)./(log(SR_sd)).^2);
p(8) = log10(p(1))-log10(p(3));
p_final(5,:) = p;
a(:,9)       = WP_sim;
a(:,10)       = SR_sim;

load('Hongyuan_drought_2.mat')
WP_obs      = data(168:191,3);  
max_f       = max(data(168:191,4)); % maximum respiration
SR_obs      = data(168:191,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(168:191,5)/max_f;

subplot(3,4,6);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('Hongyuan - Drought')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(1e-6) log10(10^3.5)])
ylim([0 1])
p(1) = 10^p(1);
mdl  = fitlm(SR_obs,SR_sim1);
p(4) = mdl.Rsquared.Adjusted;
p(5) = coefTest(mdl);
p(6) = length(WP_obs);
p(7) = sum(((log(SR_obs) - log(SR_sim1)).^2)./(log(SR_sd)).^2);
p(8) = log10(p(1))-log10(p(3));
p_final(6,:) = p;
a(:,11)       = WP_sim;
a(:,12)       = SR_sim;

load('Hulunber_ambient_2.mat')
WP_obs      = data(192:226,3);  
max_f       = max(data(192:226,4)); % maximum respiration
SR_obs      = data(192:226,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(192:226,5)/max_f;

subplot(3,4,7);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('Hulunber - Ambient')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(1e-6) log10(10^3.5)])
ylim([0 1])
p(1) = 10^p(1);
mdl  = fitlm(SR_obs,SR_sim1);
p(4) = mdl.Rsquared.Adjusted;
p(5) = coefTest(mdl);
p(6) = length(WP_obs);
p(7) = sum(((log(SR_obs) - log(SR_sim1)).^2)./(log(SR_sd)).^2);
p(8) = log10(p(1))-log10(p(3));
p_final(7,:) = p;
a(:,13)       = WP_sim;
a(:,14)       = SR_sim;

load('Hulunber_drought_2.mat')
WP_obs      = data(227:262,3);  
max_f       = max(data(227:262,4)); % maximum respiration
SR_obs      = data(227:262,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(227:262,5)/max_f;

subplot(3,4,8);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('Hulunber - Drought')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(1e-6) log10(10^3.5)])
ylim([0 1])
p(1) = 10^p(1);
mdl  = fitlm(SR_obs,SR_sim1);
p(4) = mdl.Rsquared.Adjusted;
p(5) = coefTest(mdl);
p(6) = length(WP_obs);
p(7) = sum(((log(SR_obs) - log(SR_sim1)).^2)./(log(SR_sd)).^2);
p(8) = log10(p(1))-log10(p(3));
p_final(8,:) = p;
a(:,15)       = WP_sim;
a(:,16)       = SR_sim;

load('Naqui_ambient_2.mat')
WP_obs      = data(263:296,3);  
max_f       = max(data(263:296,4)); % maximum respiration
SR_obs      = data(263:296,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(263:296,5)/max_f;

subplot(3,4,9);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('Naqui - Ambient')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(1e-6) log10(10^3.5)])
ylim([0 1])
p(1) = 10^p(1);
mdl  = fitlm(SR_obs,SR_sim1);
p(4) = mdl.Rsquared.Adjusted;
p(5) = coefTest(mdl);
p(6) = length(WP_obs);
p(7) = sum(((log(SR_obs) - log(SR_sim1)).^2)./(log(SR_sd)).^2);
p(8) = log10(p(1))-log10(p(3));
p_final(9,:) = p;
a(:,17)       = WP_sim;
a(:,18)       = SR_sim;

load('Naqui_drought_2.mat')
WP_obs      = data(297:331,3);  
max_f       = max(data(297:331,4)); % maximum respiration
SR_obs      = data(297:331,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(297:331,5)/max_f;

subplot(3,4,10);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('Naqui - Drought')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(1e-6) log10(10^3.5)])
ylim([0 1])
p(1) = 10^p(1);
mdl  = fitlm(SR_obs,SR_sim1);
p(4) = mdl.Rsquared.Adjusted;
p(5) = coefTest(mdl);
p(6) = length(WP_obs);
p(7) = sum(((log(SR_obs) - log(SR_sim1)).^2)./(log(SR_sd)).^2);
p(8) = log10(p(1))-log10(p(3));
p_final(10,:) = p;
a(:,19)       = WP_sim;
a(:,20)       = SR_sim;

%%
p      = p_final;
save('p_final_manzoni_china.mat','p')
VG_titles = {'psi_th' 'alpha' 'psi_fc' 'r^2' 'p-value' 'sample size' 'SEE' 'Respiration_breadth'};
C = [VG_titles; num2cell(p)];
writecell(C,'parameters_manzoni_china.csv') 

writematrix(a,'matrices_ambient_china.csv') 