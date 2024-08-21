%% Manzoni Plots %%

%% Calling Data %%

data    = load("data_manzoni_matlab.txt");
p_final = zeros(52,7);

%% Plotting %%

load('Ayora_ambient.mat')
WP_obs      = data(1:18,3);  
max_f       = max(data(1:18,4)); % maximum respiration
SR_obs      = data(1:18,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
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
p_final(1,:) = p;

%
load('Ayora_drought.mat')
WP_obs      = data(19:36,3);  
max_f       = max(data(19:36,4)); % maximum respiration
SR_obs      = data(19:36,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
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
p_final(2,:) = p;

%
load('GIG_ambient.mat')
WP_obs      = data(37:60,3);  
max_f       = max(data(37:60,4)); % maximum respiration
SR_obs      = data(37:60,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
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
p_final(3,:) = p;

%
load('GIG_drought.mat')
WP_obs      = data(61:84,3);  
max_f       = max(data(61:84,4)); % maximum respiration
SR_obs      = data(61:84,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
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
p_final(4,:) = p;

%
load('P12_ambient.mat')
WP_obs      = data(85:108,3);  
max_f       = max(data(85:108,4)); % maximum respiration
SR_obs      = data(85:108,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
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
p_final(5,:) = p;

%
load('P12_drought.mat')
WP_obs      = data(109:132,3);  
max_f       = max(data(109:132,4)); % maximum respiration
SR_obs      = data(109:132,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
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
p_final(6,:) = p;

%
load('P13_ambient.mat')
WP_obs      = data(133:156,3);  
max_f       = max(data(133:156,4)); % maximum respiration
SR_obs      = data(133:156,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
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
p_final(7,:) = p;

%
load('P13_drought.mat')
WP_obs      = cat(1,data(157:163,3),data(165:180,3));  
max_f       = max(cat(1,data(157:163,4),data(165:180,4))); % maximum respiration
SR_obs      = cat(1,data(157:163,4),data(165:180,4))/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = cat(1,data(157:163,5),data(165:180,5))/max_f;

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
p_final(8,:) = p;

%
load('PNE_unburned_ambient.mat')
WP_obs      = data(181:198,3);  
max_f       = max(data(181:198,4)); % maximum respiration
SR_obs      = data(181:198,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
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
p_final(9,:) = p;

%
load('PNE_unburned_drought.mat')
WP_obs      = data(199:216,3);  
max_f       = max(data(199:216,4)); % maximum respiration
SR_obs      = data(199:216,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
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
p_final(10,:) = p;

%
load('Purdue.us_ambient.mat')
WP_obs      = data(217:240,3);  
max_f       = max(data(217:240,4)); % maximum respiration
SR_obs      = data(217:240,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
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
p_final(11,:) = p;

%
load('Purdue.us_drought.mat')
WP_obs      = data(241:264,3);  
max_f       = max(data(241:264,4)); % maximum respiration
SR_obs      = data(241:264,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
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
p_final(12,:) = p;

%

load('Sev.mix_ambient.mat')
WP_obs      = data(265:294,3);  
max_f       = max(data(265:294,4)); % maximum respiration
SR_obs      = data(265:294,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
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
p_final(13,:) = p;

%
load('Sev.mix_drought.mat')
WP_obs      = data(295:324,3);  
max_f       = max(data(295:324,4)); % maximum respiration
SR_obs      = data(295:324,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
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
p_final(14,:) = p;

%
load('baddrt.de_ambient.mat')
WP_obs      = data(325:354,3);  
max_f       = max(data(325:354,4)); % maximum respiration
SR_obs      = data(325:354,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
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
p_final(15,:) = p;


load('baddrt.de_drought.mat')
WP_obs      = data(355:383,3);  
max_f       = max(data(355:383,4)); % maximum respiration
SR_obs      = data(355:383,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
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
p_final(16,:) = p;

%
load('brhill.au_ambient.mat')
WP_obs      = data(384:401,3);  
max_f       = max(data(384:401,4)); % maximum respiration
SR_obs      = data(384:401,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
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
p_final(17,:) = p;

%
load('brhill.au_drought.mat')
WP_obs      = data(402:419,3);  
max_f       = max(data(402:419,4)); % maximum respiration
SR_obs      = data(402:419,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
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
p_final(18,:) = p;

%
load('brookdale.ca_ambient.mat')
WP_obs      = data(420:437,3);  
max_f       = max(data(420:437,4)); % maximum respiration
SR_obs      = data(420:437,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
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
p_final(19,:) = p;

%
load('brookdale.ca_drought.mat')
WP_obs      = data(438:455,3);  
max_f       = max(data(438:455,4)); % maximum respiration
SR_obs      = data(438:455,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
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
p_final(20,:) = p;

%
load('cedarsav.us_ambient.mat')
WP_obs      = data(456:481,3);  
max_f       = max(data(456:481,4)); % maximum respiration
SR_obs      = data(456:481,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(456:481,5)/max_f;

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
p_final(21,:) = p;

%
load('cedarsav.us_drought.mat')
WP_obs      = data(482:507,3);  
max_f       = max(data(482:507,4)); % maximum respiration
SR_obs      = data(482:507,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(482:507,5)/max_f;

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
p_final(22,:) = p;

%
load('cobar.au_ambient.mat')
WP_obs      = data(508:524,3);  
max_f       = max(data(508:524,4)); % maximum respiration
SR_obs      = data(508:524,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(508:524,5)/max_f;

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
p_final(23,:) = p;

%
load('cobar.au_drought.mat')
WP_obs      = data(525:541,3);  
max_f       = max(data(525:541,4)); % maximum respiration
SR_obs      = data(525:541,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(525:541,5)/max_f;

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
p_final(24,:) = p;

%

load('cowidrt.ca_ambient.mat')
WP_obs      = data(542:565,3);  
max_f       = max(data(542:565,4)); % maximum respiration
SR_obs      = data(542:565,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(542:565,5)/max_f;

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
p_final(25,:) = p;

%
load('cowidrt.ca_drought.mat')
WP_obs      = data(566:589,3);  
max_f       = max(data(566:589,4)); % maximum respiration
SR_obs      = data(566:589,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(566:589,5)/max_f;

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
p_final(26,:) = p;

%
load('dona.ana_ambient.mat')
WP_obs      = data(590:612,3);  
max_f       = max(data(590:612,4)); % maximum respiration
SR_obs      = data(590:612,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(590:612,5)/max_f;

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
p_final(27,:) = p;

%
load('dona.ana_drought.mat')
WP_obs      = data(613:636,3);  
max_f       = max(data(613:636,4)); % maximum respiration
SR_obs      = data(613:636,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(613:636,5)/max_f;

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
p_final(28,:) = p;

%
load('hoide.de_ambient.mat')
WP_obs      = data(637:654,3);  
max_f       = max(data(637:654,4)); % maximum respiration
SR_obs      = data(637:654,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(637:654,5)/max_f;

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
p_final(29,:) = p;

%
load('hoide.de_drought.mat')
WP_obs      = data(655:672,3);  
max_f       = max(data(655:672,4)); % maximum respiration
SR_obs      = data(655:672,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(655:672,5)/max_f;

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
p_final(30,:) = p;

%
load('horacg.cr_ambient.mat')
WP_obs      = data(673:696,3);  
max_f       = max(data(673:696,4)); % maximum respiration
SR_obs      = data(673:696,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(673:696,5)/max_f;

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
p_final(31,:) = p;

%
load('horacg.cr_drought.mat')
WP_obs      = data(697:720,3);  
max_f       = max(data(697:720,4)); % maximum respiration
SR_obs      = data(697:720,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(697:720,5)/max_f;

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
p_final(32,:) = p;

%
load('hyide.de_ambient.mat')
WP_obs      = data(721:737,3);  
max_f       = max(data(721:737,4)); % maximum respiration
SR_obs      = data(721:737,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(721:737,5)/max_f;

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
p_final(33,:) = p;

%
load('hyide.de_drought.mat')
WP_obs      = data(738:753,3);  
max_f       = max(data(738:753,4)); % maximum respiration
SR_obs      = data(738:753,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(738:753,5)/max_f;

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
p_final(34,:) = p;

%
load('lygra.no_ambient.mat')
WP_obs      = data(754:771,3);  
max_f       = max(data(754:771,4)); % maximum respiration
SR_obs      = data(754:771,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(754:771,5)/max_f;

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
p_final(35,:) = p;

%
load('lygra.no_drought.mat')
WP_obs      = data(772:789,3);  
max_f       = max(data(772:789,4)); % maximum respiration
SR_obs      = data(772:789,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(772:789,5)/max_f;

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
p_final(36,:) = p;

%

load('nyngan.au_ambient.mat')
WP_obs      = data(790:807,3);  
max_f       = max(data(790:807,4)); % maximum respiration
SR_obs      = data(790:807,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(790:807,5)/max_f;

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
p_final(37,:) = p;

%
load('nyngan.au_drought.mat')
WP_obs      = data(808:825,3);  
max_f       = max(data(808:825,4)); % maximum respiration
SR_obs      = data(808:825,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(808:825,5)/max_f;

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
p_final(38,:) = p;

%
load('passogavia.it_ambient.mat')
WP_obs      = data(826:849,3);  
max_f       = max(data(826:849,4)); % maximum respiration
SR_obs      = data(826:849,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(826:849,5)/max_f;

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
p_final(39,:) = p;

%
load('passogavia.it_drought.mat')
WP_obs      = data(850:873,3);  
max_f       = max(data(850:873,4)); % maximum respiration
SR_obs      = data(850:873,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(850:873,5)/max_f;

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
p_final(40,:) = p;

%
load('riomayo.ar_ambient.mat')
WP_obs      = data(874:888,3);  
max_f       = max(data(874:888,4)); % maximum respiration
SR_obs      = data(874:888,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(874:888,5)/max_f;

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
p_final(41,:) = p;

%
load('riomayo.ar_drought.mat')
WP_obs      = data(889:905,3);  
max_f       = max(data(889:905,4)); % maximum respiration
SR_obs      = data(889:905,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(889:905,5)/max_f;

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
p_final(42,:) = p;

%
load('scruzl.us_ambient.mat')
WP_obs      = data(906:935,3);  
max_f       = max(data(906:935,4)); % maximum respiration
SR_obs      = data(906:935,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(906:935,5)/max_f;

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
p_final(43,:) = p;

%
load('scruzl.us_drought.mat')
WP_obs      = data(936:965,3);  
max_f       = max(data(936:965,4)); % maximum respiration
SR_obs      = data(936:965,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(936:965,5)/max_f;

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
p_final(44,:) = p;

%
load('sgsdrt.us_ambient.mat')
WP_obs      = data(966:988,3);  
max_f       = max(data(966:988,4)); % maximum respiration
SR_obs      = data(966:988,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(966:988,5)/max_f;

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
p_final(45,:) = p;

%
load('sgsdrt.us_drought.mat')
WP_obs      = data(989:1012,3);  
max_f       = max(data(989:1012,4)); % maximum respiration
SR_obs      = data(989:1012,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(989:1012,5)/max_f;

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
p_final(46,:) = p;

%
load('skotsvar.no_ambient.mat')
WP_obs      = data(1013:1030,3);  
max_f       = max(data(1013:1030,4)); % maximum respiration
SR_obs      = data(1013:1030,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(1013:1030,5)/max_f;

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
p_final(47,:) = p;

%
load('skotsvar.no_drought.mat')
WP_obs      = data(1031:1048,3);  
max_f       = max(data(1031:1048,4)); % maximum respiration
SR_obs      = data(1031:1048,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(1031:1048,5)/max_f;

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
p_final(48,:) = p;

% 

load('ukulingadrt.za_ambient.mat')
WP_obs      = data(1049:1066,3);  
max_f       = max(data(1049:1066,4)); % maximum respiration
SR_obs      = data(1049:1066,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(1049:1066,5)/max_f;

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
p_final(49,:) = p;

%
load('ukulingadrt.za_drought.mat')
WP_obs      = data(1067:1084,3);  
max_f       = max(data(1067:1084,4)); % maximum respiration
SR_obs      = data(1067:1084,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(1067:1084,5)/max_f;

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
p_final(50,:) = p;

%
load('wayqe.re_ambient.mat')
WP_obs      = data(1085:1102,3);  
max_f       = max(data(1085:1102,4)); % maximum respiration
SR_obs      = data(1085:1102,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(1085:1102,5)/max_f;

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
p_final(51,:) = p;

%
load('wayqe.re_drought.mat')
WP_obs      = data(1103:1120,3);  
max_f       = max(data(1103:1120,4)); % maximum respiration
SR_obs      = data(1103:1120,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(1103:1120,5)/max_f;

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
p_final(52,:) = p;

%%

p      = p_final;
save('p_final_manzoni.mat','p')
VG_titles = {'psi_th' 'alpha' 'psi_fc' 'r^2' 'p-value' 'sample size' 'SEE'};
C = [VG_titles; num2cell(p)];
writecell(C,'parameters_manzoni.csv') 
