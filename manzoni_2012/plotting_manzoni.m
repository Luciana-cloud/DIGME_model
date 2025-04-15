%% Manzoni Plots %%

%% Calling Data %%

data    = load("manzoni_new_matlab.txt");
p_final = zeros(52,8);
a       = zeros(1e6,52);

%% Plotting

load('Ayora_ambient_final.mat')
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
load('Ayora_drought_final.mat')
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
a(:,3)       = WP_sim;
a(:,4)       = SR_sim;

%
load('baddrt.de_ambient_final.mat')
WP_obs      = data(37:66,3);  
max_f       = max(data(37:66,4)); % maximum respiration
SR_obs      = data(37:66,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(37:66,5)/max_f;

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
p_final(3,:) = p;
a(:,5)       = WP_sim;
a(:,6)       = SR_sim;

load('baddrt.de_drought_final.mat')
WP_obs      = data(67:95,3);  
max_f       = max(data(67:95,4)); % maximum respiration
SR_obs      = data(67:95,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(67:95,5)/max_f;

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
p_final(4,:) = p;
a(:,7)       = WP_sim;
a(:,8)       = SR_sim;

%
load('brhill.au_ambient_final.mat')
WP_obs      = data(96:113,3);  
max_f       = max(data(96:113,4)); % maximum respiration
SR_obs      = data(96:113,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(96:113,5)/max_f;

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
p_final(5,:) = p;
a(:,9)       = WP_sim;
a(:,10)       = SR_sim;

%
load('brhill.au_drought_final.mat')
WP_obs      = data(114:131,3);  
max_f       = max(data(114:131,4)); % maximum respiration
SR_obs      = data(114:131,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(114:131,5)/max_f;

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
p_final(6,:) = p;
a(:,11)       = WP_sim;
a(:,12)       = SR_sim;

%
load('brookdale.ca_ambient_final.mat')
WP_obs      = data(132:149,3);  
max_f       = max(data(132:149,4)); % maximum respiration
SR_obs      = data(132:149,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(132:149,5)/max_f;

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
p_final(7,:) = p;
a(:,13)       = WP_sim;
a(:,14)       = SR_sim;

%
load('brookdale.ca_drought_final.mat')
WP_obs      = data(150:167,3);  
max_f       = max(data(150:167,4)); % maximum respiration
SR_obs      = data(150:167,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(150:167,5)/max_f;

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
p_final(8,:) = p;
a(:,15)       = WP_sim;
a(:,16)       = SR_sim;

%
load('cedarsav.us_ambient_final.mat')
WP_obs      = data(168:197,3);  
max_f       = max(data(168:197,4)); % maximum respiration
SR_obs      = data(168:197,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(168:197,5)/max_f;

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
p_final(9,:) = p;
a(:,17)       = WP_sim;
a(:,18)       = SR_sim;

%
load('cedarsav.us_drought_final.mat')
WP_obs      = data(198:227,3);  
max_f       = max(data(198:227,4)); % maximum respiration
SR_obs      = data(198:227,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(198:227,5)/max_f;

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
p_final(10,:) = p;
a(:,19)       = WP_sim;
a(:,20)       = SR_sim;

%
load('cobar.au_ambient_final.mat')
WP_obs      = data(228:245,3);  
max_f       = max(data(228:245,4)); % maximum respiration
SR_obs      = data(228:245,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(228:245,5)/max_f;

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
p_final(11,:) = p;
a(:,21)       = WP_sim;
a(:,22)       = SR_sim;

%
load('cobar.au_drought_final.mat')
WP_obs      = data(246:263,3);  
max_f       = max(data(246:263,4)); % maximum respiration
SR_obs      = data(246:263,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(246:263,5)/max_f;

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
p_final(12,:) = p;
a(:,23)       = WP_sim;
a(:,24)       = SR_sim;

%

load('cowidrt.ca_ambient_final.mat')
WP_obs      = data(264:287,3);  
max_f       = max(data(264:287,4)); % maximum respiration
SR_obs      = data(264:287,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(264:287,5)/max_f;

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
p_final(13,:) = p;
a(:,25)       = WP_sim;
a(:,26)       = SR_sim;

%
load('cowidrt.ca_drought_final.mat')
WP_obs      = data(288:311,3);  
max_f       = max(data(288:311,4)); % maximum respiration
SR_obs      = data(288:311,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(288:311,5)/max_f;

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
p_final(14,:) = p;
a(:,27)       = WP_sim;
a(:,28)       = SR_sim;

%
load('dona.ana_ambient_final.mat')
WP_obs      = data(312:335,3);  
max_f       = max(data(312:335,4)); % maximum respiration
SR_obs      = data(312:335,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(312:335,5)/max_f;

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
p_final(15,:) = p;
a(:,29)       = WP_sim;
a(:,30)       = SR_sim;

%
load('dona.ana_drought_final.mat')
WP_obs      = data(336:359,3);  
max_f       = max(data(336:359,4)); % maximum respiration
SR_obs      = data(336:359,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(336:359,5)/max_f;

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
p_final(16,:) = p;
a(:,31)       = WP_sim;
a(:,32)       = SR_sim;

%
load('GIG_ambient_final.mat')
WP_obs      = data(360:383,3);  
max_f       = max(data(360:383,4)); % maximum respiration
SR_obs      = data(360:383,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(360:383,5)/max_f;

% fig = figure;
subplot(3,4,5);
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
p_final(17,:) = p;
a(:,33)       = WP_sim;
a(:,34)       = SR_sim;


%
load('GIG_drought_final.mat')
WP_obs      = data(384:407,3);  
max_f       = max(data(384:407,4)); % maximum respiration
SR_obs      = data(384:407,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(384:407,5)/max_f;

subplot(3,4,6);
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
p_final(18,:) = p;
a(:,35)       = WP_sim;
a(:,36)       = SR_sim;

%
load('hoide.de_ambient_final.mat')
WP_obs      = data(408:425,3);  
max_f       = max(data(408:425,4)); % maximum respiration
SR_obs      = data(408:425,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(408:425,5)/max_f;

% fig = figure;
subplot(3,4,7);
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
p_final(19,:) = p;
a(:,37)       = WP_sim;
a(:,38)       = SR_sim;

%
load('hoide.de_drought_final.mat')
WP_obs      = data(426:443,3);  
max_f       = max(data(426:443,4)); % maximum respiration
SR_obs      = data(426:443,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(426:443,5)/max_f;

subplot(3,4,8);
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
p_final(20,:) = p;
a(:,39)       = WP_sim;
a(:,40)       = SR_sim;

%
load('horacg.cr_ambient_final.mat')
WP_obs      = data(444:467,3);  
max_f       = max(data(444:467,4)); % maximum respiration
SR_obs      = data(444:467,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(444:467,5)/max_f;

% fig = figure;
subplot(3,4,9);
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
p_final(21,:) = p;
a(:,41)       = WP_sim;
a(:,42)       = SR_sim;

%
load('horacg.cr_drought_final.mat')
WP_obs      = data(468:491,3);  
max_f       = max(data(468:491,4)); % maximum respiration
SR_obs      = data(468:491,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(468:491,5)/max_f;

subplot(3,4,10);
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
p_final(22,:) = p;
a(:,43)       = WP_sim;
a(:,44)       = SR_sim;

%
load('hyide.de_ambient_final.mat')
WP_obs      = data(492:509,3);  
max_f       = max(data(492:509,4)); % maximum respiration
SR_obs      = data(492:509,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(492:509,5)/max_f;

% fig = figure;
subplot(3,4,11);
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
p_final(23,:) = p;
a(:,45)       = WP_sim;
a(:,46)       = SR_sim;

%
load('hyide.de_drought_final.mat')
WP_obs      = data(510:527,3);  
max_f       = max(data(510:527,4)); % maximum respiration
SR_obs      = data(510:527,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(510:527,5)/max_f;

subplot(3,4,12);
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
p_final(24,:) = p;
a(:,47)       = WP_sim;
a(:,48)       = SR_sim;

%

load('lygra.no_ambient_final.mat')
WP_obs      = data(528:545,3);  
max_f       = max(data(528:545,4)); % maximum respiration
SR_obs      = data(528:545,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(528:545,5)/max_f;

fig = figure;
subplot(3,4,1);
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
p_final(25,:) = p;
a(:,49)       = WP_sim;
a(:,50)       = SR_sim;

%
load('lygra.no_drought_final.mat')
WP_obs      = data(546:563,3);  
max_f       = max(data(546:563,4)); % maximum respiration
SR_obs      = data(546:563,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(546:563,5)/max_f;

subplot(3,4,2);
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
p_final(26,:) = p;
a(:,51)       = WP_sim;
a(:,52)       = SR_sim;

%

load('nyngan.au_ambient_final.mat')
WP_obs      = data(564:581,3);  
max_f       = max(data(564:581,4)); % maximum respiration
SR_obs      = data(564:581,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(564:581,5)/max_f;

% fig = figure;
subplot(3,4,3);
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
p_final(27,:) = p;
a(:,53)       = WP_sim;
a(:,54)       = SR_sim;

%
load('nyngan.au_drought_final.mat')
WP_obs      = data(582:599,3);  
max_f       = max(data(582:599,4)); % maximum respiration
SR_obs      = data(582:599,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(582:599,5)/max_f;

subplot(3,4,4);
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
p_final(28,:) = p;
a(:,55)       = WP_sim;
a(:,56)       = SR_sim;

%
load('P12_ambient_final.mat')
WP_obs      = data(600:623,3);  
max_f       = max(data(600:623,4)); % maximum respiration
SR_obs      = data(600:623,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(600:623,5)/max_f;

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
p_final(29,:) = p;
a(:,57)       = WP_sim;
a(:,58)       = SR_sim;

%
load('P12_drought_final.mat')
WP_obs      = data(624:647,3);  
max_f       = max(data(624:647,4)); % maximum respiration
SR_obs      = data(624:647,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(624:647,5)/max_f;

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
p_final(30,:) = p;
a(:,59)       = WP_sim;
a(:,60)       = SR_sim;

%
load('P13_ambient_final.mat')
WP_obs      = data(648:671,3);  
max_f       = max(data(648:671,4)); % maximum respiration
SR_obs      = data(648:671,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(648:671,5)/max_f;

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
p_final(31,:) = p;
a(:,61)       = WP_sim;
a(:,62)       = SR_sim;

%
load('P13_drought_final.mat')
WP_obs      = data(672:695,3);  
max_f       = max(data(672:695,4)); % maximum respiration
SR_obs      = data(672:695,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(672:695,5)/max_f;

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
p_final(32,:) = p;
a(:,63)       = WP_sim;
a(:,64)       = SR_sim;

%
load('passogavia.it_ambient_final.mat')
WP_obs      = data(696:719,3);  
max_f       = max(data(696:719,4)); % maximum respiration
SR_obs      = data(696:719,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(696:719,5)/max_f;

% fig = figure;
subplot(3,4,9);
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
p_final(33,:) = p;
a(:,65)       = WP_sim;
a(:,66)       = SR_sim;

%
load('passogavia.it_drought_final.mat')
WP_obs      = data(720:743,3);  
max_f       = max(data(720:743,4)); % maximum respiration
SR_obs      = data(720:743,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(720:743,5)/max_f;

subplot(3,4,10);
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
p_final(34,:) = p;
a(:,67)       = WP_sim;
a(:,68)       = SR_sim;

%
load('PNE_unburned_ambient_final.mat')
WP_obs      = data(744:761,3);  
max_f       = max(data(744:761,4)); % maximum respiration
SR_obs      = data(744:761,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(744:761,5)/max_f;

% fig = figure;
subplot(3,4,11);
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
p_final(35,:) = p;
a(:,69)       = WP_sim;
a(:,70)       = SR_sim;
%
load('PNE_unburned_drought_final.mat')
WP_obs      = data(762:779,3);  
max_f       = max(data(762:779,4)); % maximum respiration
SR_obs      = data(762:779,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(762:779,5)/max_f;

subplot(3,4,12);
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
p_final(36,:) = p;
a(:,71)       = WP_sim;
a(:,72)       = SR_sim;

%

load('Purdue.us_ambient_final.mat')
WP_obs      = data(780:803,3);  
max_f       = max(data(780:803,4)); % maximum respiration
SR_obs      = data(780:803,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(780:803,5)/max_f;

fig = figure;
subplot(3,4,1);
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
p_final(37,:) = p;
a(:,73)       = WP_sim;
a(:,74)       = SR_sim;

%
load('Purdue.us_drought_final.mat')
WP_obs      = data(804:827,3);  
max_f       = max(data(804:827,4)); % maximum respiration
SR_obs      = data(804:827,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(804:827,5)/max_f;

subplot(3,4,2);
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
p_final(38,:) = p;
a(:,75)       = WP_sim;
a(:,76)       = SR_sim;

%
load('riomayo.ar_ambient_final.mat')
WP_obs      = data(828:842,3);  
max_f       = max(data(828:842,4)); % maximum respiration
SR_obs      = data(828:842,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(828:842,5)/max_f;

% fig = figure;
subplot(3,4,3);
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
p_final(39,:) = p;
a(:,77)       = WP_sim;
a(:,78)       = SR_sim;

%
load('riomayo.ar_drought_final.mat')
WP_obs      = data(843:859,3);  
max_f       = max(data(843:859,4)); % maximum respiration
SR_obs      = data(843:859,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(843:859,5)/max_f;

subplot(3,4,4);
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
p_final(40,:) = p;
a(:,79)       = WP_sim;
a(:,80)       = SR_sim;

%
load('scruzl.us_ambient_final.mat')
WP_obs      = data(860:889,3);  
max_f       = max(data(860:889,4)); % maximum respiration
SR_obs      = data(860:889,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(860:889,5)/max_f;

% fig = figure;
subplot(3,4,5);
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
p_final(41,:) = p;
a(:,81)       = WP_sim;
a(:,82)       = SR_sim;

%
load('scruzl.us_drought_final.mat')
WP_obs      = data(890:919,3);  
max_f       = max(data(890:919,4)); % maximum respiration
SR_obs      = data(890:919,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(890:919,5)/max_f;

subplot(3,4,6);
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
p_final(42,:) = p;
a(:,83)       = WP_sim;
a(:,84)       = SR_sim;

%

load('Sev.mix_ambient_final.mat')
WP_obs      = data(920:949,3);  
max_f       = max(data(920:949,4)); % maximum respiration
SR_obs      = data(920:949,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(920:949,5)/max_f;

% fig = figure;
subplot(3,4,7);
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
p_final(43,:) = p;
a(:,85)       = WP_sim;
a(:,86)       = SR_sim;

%
load('Sev.mix_drought_final.mat')
WP_obs      = data(950:979,3);  
max_f       = max(data(950:979,4)); % maximum respiration
SR_obs      = data(950:979,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(950:979,5)/max_f;

subplot(3,4,8);
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
p_final(44,:) = p;
a(:,87)       = WP_sim;
a(:,88)       = SR_sim;

%
load('sgsdrt.us_ambient_final.mat')
WP_obs      = data(980:1003,3);  
max_f       = max(data(980:1003,4)); % maximum respiration
SR_obs      = data(980:1003,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(980:1003,5)/max_f;

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
a(:,89)       = WP_sim;
a(:,90)       = SR_sim;

%
load('sgsdrt.us_drought_final.mat')
WP_obs      = data(1004:1027,3);  
max_f       = max(data(1004:1027,4)); % maximum respiration
SR_obs      = data(1004:1027,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(1004:1027,5)/max_f;

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
a(:,91)       = WP_sim;
a(:,92)       = SR_sim;

%
load('skotsvar.no_ambient_final.mat')
WP_obs      = data(1028:1045,3);  
max_f       = max(data(1028:1045,4)); % maximum respiration
SR_obs      = data(1028:1045,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(1028:1045,5)/max_f;

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
a(:,93)       = WP_sim;
a(:,94)       = SR_sim;

%
load('skotsvar.no_drought_final.mat')
WP_obs      = data(1046:1063,3);  
max_f       = max(data(1046:1063,4)); % maximum respiration
SR_obs      = data(1046:1063,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(1046:1063,5)/max_f;

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
a(:,95)       = WP_sim;
a(:,96)       = SR_sim;

%

load('ukulingadrt.za_ambient_final.mat')
WP_obs      = data(1064:1081,3);  
max_f       = max(data(1064:1081,4)); % maximum respiration
SR_obs      = data(1064:1081,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(1064:1081,5)/max_f;

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
a(:,97)       = WP_sim;
a(:,98)       = SR_sim;

%
load('ukulingadrt.za_drought_final.mat')
WP_obs      = data(1082:1099,3);  
max_f       = max(data(1082:1099,4)); % maximum respiration
SR_obs      = data(1082:1099,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(1082:1099,5)/max_f;

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
a(:,99)       = WP_sim;
a(:,100)       = SR_sim;

%
load('wayqe.re_ambient_final.mat')
WP_obs      = data(1100:1117,3);  
max_f       = max(data(1100:1117,4)); % maximum respiration
SR_obs      = data(1100:1117,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(1100:1117,5)/max_f;

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
a(:,101)       = WP_sim;
a(:,102)       = SR_sim;

%
load('wayqe.re_drought_final.mat')
WP_obs      = data(1118:1135,3);  
max_f       = max(data(1118:1135,4)); % maximum respiration
SR_obs      = data(1118:1135,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(1118:1135,5)/max_f;

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
a(:,103)       = WP_sim;
a(:,104)       = SR_sim;

load('Hongyuan_ambient_final.mat')
WP_obs      = data(1136:1159,3);  
max_f       = max(data(1136:1159,4)); % maximum respiration
SR_obs      = data(1136:1159,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(1136:1159,5)/max_f;

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
p_final(53,:) = p;
a(:,105)       = WP_sim;
a(:,106)       = SR_sim;

load('Hongyuan_drought_final.mat')
WP_obs      = data(1160:1183,3);  
max_f       = max(data(1160:1183,4)); % maximum respiration
SR_obs      = data(1160:1183,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(1160:1183,5)/max_f;

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
p_final(54,:) = p;
a(:,107)       = WP_sim;
a(:,108)       = SR_sim;

load('Hulunber_ambient_final.mat')
WP_obs      = data(1184:1237,3);  
max_f       = max(data(1184:1237,4)); % maximum respiration
SR_obs      = data(1184:1237,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(1184:1237,5)/max_f;

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
p_final(55,:) = p;
a(:,109)       = WP_sim;
a(:,110)       = SR_sim;

load('Hulunber_drought_final.mat')
WP_obs      = data(1238:1291,3);  
max_f       = max(data(1238:1291,4)); % maximum respiration
SR_obs      = data(1238:1291,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(1238:1291,5)/max_f;

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
p_final(56,:) = p;
a(:,111)       = WP_sim;
a(:,112)       = SR_sim;

load('Naqui_ambient_final.mat')
WP_obs      = data(1292:1325,3);  
max_f       = max(data(1292:1325,4)); % maximum respiration
SR_obs      = data(1292:1325,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(1292:1325,5)/max_f;

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
p_final(57,:) = p;
a(:,113)       = WP_sim;
a(:,114)       = SR_sim;

load('Naqui_drought_final.mat')
WP_obs      = data(1326:1361,3);  
max_f       = max(data(1326:1361,4)); % maximum respiration
SR_obs      = data(1326:1361,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(1326:1361,5)/max_f;

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
p_final(58,:) = p;
a(:,115)       = WP_sim;
a(:,116)       = SR_sim;

load('Urat_ambient_final.mat')
WP_obs      = data(1362:1397,3);  
max_f       = max(data(1362:1397,4)); % maximum respiration
SR_obs      = data(1362:1397,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(1362:1397,5)/max_f;

%fig = figure;
subplot(3,4,11);
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
p_final(59,:) = p;
a(:,117)       = WP_sim;
a(:,118)       = SR_sim;

load('Urat_drought_final.mat')
WP_obs      = data(1398:1433,3);  
max_f       = max(data(1398:1433,4)); % maximum respiration
SR_obs      = data(1398:1433,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(1398:1433,5)/max_f;

subplot(3,4,12);
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
p_final(60,:) = p;
a(:,119)       = WP_sim;
a(:,120)       = SR_sim;

%

load('Yanchi_ambient_final.mat')
WP_obs      = data(1434:1470,3);  
max_f       = max(data(1434:1470,4)); % maximum respiration
SR_obs      = data(1434:1470,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(1434:1470,5)/max_f;

fig = figure;
subplot(3,4,1);
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
p_final(61,:) = p;
a(:,121)       = WP_sim;
a(:,122)       = SR_sim;

load('Yanchi_drought_final.mat')
WP_obs      = data(1471:1507,3);  
max_f       = max(data(1471:1507,4)); % maximum respiration
SR_obs      = data(1471:1507,4)/max_f;
WP_sim      = (linspace(p(3),1e3,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);
SR_sd       = data(1471:1507,5)/max_f;

subplot(3,4,2);
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
p_final(62,:) = p;
a(:,123)       = WP_sim;
a(:,124)       = SR_sim;

%%

p      = p_final;
save('p_final_manzoni_2.mat','p')
VG_titles = {'psi_th' 'alpha' 'psi_fc' 'r^2' 'p-value' 'sample size' 'SEE' 'Respiration_breadth'};
C = [VG_titles; num2cell(p)];

%%
writecell(C,'parameters_manzoni_2.csv') 

writematrix(a,'matrices_ambient_2.csv') 