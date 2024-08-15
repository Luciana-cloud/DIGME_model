%% Manzoni Plots %%

%% Calling Data %%

data    = load("data_manzoni_matlab.txt");
p_final = zeros(52,6);

%% Plotting %%

load('Ayora_ambient.mat')
WP_obs      = data(1:17,3);  
max_f       = max(data(1:17,4)); % maximum respiration
SR_obs      = data(1:17,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);

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
p_final(1,:) = p;

%
load('Ayora_drought.mat')
WP_obs      = data(18:34,3);  
max_f       = max(data(18:34,4)); % maximum respiration
SR_obs      = data(18:34,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);

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
p_final(2,:) = p;

%
load('GIG_ambient.mat')
WP_obs      = data(35:58,3);  
max_f       = max(data(35:58,4)); % maximum respiration
SR_obs      = data(35:58,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);

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
p_final(3,:) = p;

%
load('GIG_drought.mat')
WP_obs      = data(59:82,3);  
max_f       = max(data(59:82,4)); % maximum respiration
SR_obs      = data(59:82,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);

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
p_final(4,:) = p;

%
load('P12_ambient.mat')
WP_obs      = data(83:106,3);  
max_f       = max(data(83:106,4)); % maximum respiration
SR_obs      = data(83:106,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);

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
p_final(5,:) = p;

%
load('P12_drought.mat')
WP_obs      = data(107:130,3);  
max_f       = max(data(107:130,4)); % maximum respiration
SR_obs      = data(107:130,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);

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
p_final(6,:) = p;

%
load('P13_ambient.mat')
WP_obs      = data(131:154,3);  
max_f       = max(data(131:154,4)); % maximum respiration
SR_obs      = data(131:154,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);

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
p_final(7,:) = p;

%
load('P13_drought.mat')
WP_obs      = cat(1,data(155:161,3),data(163:178,3));  
max_f       = max(cat(1,data(155:161,4),data(163:178,4))); % maximum respiration
SR_obs      = cat(1,data(155:161,4),data(163:178,4))/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);

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
p_final(8,:) = p;

%
load('PNE_unburned_ambient.mat')
WP_obs      = data(179:196,3);  
max_f       = max(data(179:196,4)); % maximum respiration
SR_obs      = data(179:196,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);

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
p_final(9,:) = p;

%
load('PNE_unburned_drought.mat')
WP_obs      = data(197:214,3);  
max_f       = max(data(197:214,4)); % maximum respiration
SR_obs      = data(197:214,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);

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
p_final(10,:) = p;

%
load('Purdue.us_ambient.mat')
WP_obs      = data(215:238,3);  
max_f       = max(data(215:238,4)); % maximum respiration
SR_obs      = data(215:238,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);

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
p_final(11,:) = p;

%
load('Purdue.us_drought.mat')
WP_obs      = data(239:262,3);  
max_f       = max(data(239:262,4)); % maximum respiration
SR_obs      = data(239:262,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);

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
p_final(12,:) = p;

%

load('Sev.mix_ambient.mat')
WP_obs      = data(263:292,3);  
max_f       = max(data(263:292,4)); % maximum respiration
SR_obs      = data(263:292,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);

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
p_final(13,:) = p;

%
load('Sev.mix_drought.mat')
WP_obs      = data(293:322,3);  
max_f       = max(data(293:322,4)); % maximum respiration
SR_obs      = data(293:322,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);

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
p_final(14,:) = p;

%
load('baddrt.de_ambient.mat')
WP_obs      = data(323:352,3);  
max_f       = max(data(323:352,4)); % maximum respiration
SR_obs      = data(323:352,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);

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
p_final(15,:) = p;


load('baddrt.de_drought.mat')
WP_obs      = data(353:381,3);  
max_f       = max(data(353:381,4)); % maximum respiration
SR_obs      = data(353:381,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);

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
p_final(16,:) = p;

%
load('brhill.au_ambient.mat')
WP_obs      = data(382:399,3);  
max_f       = max(data(382:399,4)); % maximum respiration
SR_obs      = data(382:399,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);

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
p_final(17,:) = p;

%
load('brhill.au_drought.mat')
WP_obs      = data(400:417,3);  
max_f       = max(data(400:417,4)); % maximum respiration
SR_obs      = data(400:417,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);

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
p_final(18,:) = p;

%
load('brookdale.ca_ambient.mat')
WP_obs      = data(418:433,3);  
max_f       = max(data(418:433,4)); % maximum respiration
SR_obs      = data(418:433,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);

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
p_final(19,:) = p;

%
load('brookdale.ca_drought.mat')
WP_obs      = data(434:450,3);  
max_f       = max(data(434:450,4)); % maximum respiration
SR_obs      = data(434:450,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);

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
p_final(20,:) = p;

%
load('cedarsav.us_ambient.mat')
WP_obs      = data(451:476,3);  
max_f       = max(data(451:476,4)); % maximum respiration
SR_obs      = data(451:476,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);

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
p_final(21,:) = p;

%
load('cedarsav.us_drought.mat')
WP_obs      = data(477:501,3);  
max_f       = max(data(477:501,4)); % maximum respiration
SR_obs      = data(477:501,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);

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
p_final(22,:) = p;

%
load('cobar.au_ambient.mat')
WP_obs      = data(502:518,3);  
max_f       = max(data(502:518,4)); % maximum respiration
SR_obs      = data(502:518,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);

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
p_final(23,:) = p;

%
load('cobar.au_drought.mat')
WP_obs      = data(519:535,3);  
max_f       = max(data(519:535,4)); % maximum respiration
SR_obs      = data(519:535,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);

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
p_final(24,:) = p;

%

load('cowidrt.ca_ambient.mat')
WP_obs      = data(536:550,3);  
max_f       = max(data(536:550,4)); % maximum respiration
SR_obs      = data(536:550,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);

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
p_final(25,:) = p;

%
load('cowidrt.ca_drought.mat')
WP_obs      = data(551:566,3);  
max_f       = max(data(551:566,4)); % maximum respiration
SR_obs      = data(551:566,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);

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
p_final(26,:) = p;

%
load('dona.ana_ambient.mat')
WP_obs      = data(567:589,3);  
max_f       = max(data(567:589,4)); % maximum respiration
SR_obs      = data(567:589,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);

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
p_final(27,:) = p;

%
load('dona.ana_drought.mat')
WP_obs      = data(590:613,3);  
max_f       = max(data(590:613,4)); % maximum respiration
SR_obs      = data(590:613,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);

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
p_final(28,:) = p;

%
load('hoide.de_ambient.mat')
WP_obs      = data(614:630,3);  
max_f       = max(data(614:630,4)); % maximum respiration
SR_obs      = data(614:630,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);

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
p_final(29,:) = p;

%
load('hoide.de_drought.mat')
WP_obs      = data(631:646,3);  
max_f       = max(data(631:646,4)); % maximum respiration
SR_obs      = data(631:646,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);

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
p_final(30,:) = p;

%
load('horacg.cr_ambient.mat')
WP_obs      = data(647:670,3);  
max_f       = max(data(647:670,4)); % maximum respiration
SR_obs      = data(647:670,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);

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
p_final(31,:) = p;

%
load('horacg.cr_drought.mat')
WP_obs      = data(671:694,3);  
max_f       = max(data(671:694,4)); % maximum respiration
SR_obs      = data(671:694,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);

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
p_final(32,:) = p;

%
load('hyide.de_ambient.mat')
WP_obs      = data(695:708,3);  
max_f       = max(data(695:708,4)); % maximum respiration
SR_obs      = data(695:708,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);

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
p_final(33,:) = p;

%
load('hyide.de_drought.mat')
WP_obs      = data(709:721,3);  
max_f       = max(data(709:721,4)); % maximum respiration
SR_obs      = data(709:721,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);

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
p_final(34,:) = p;

%
load('lygra.no_ambient.mat')
WP_obs      = data(722:739,3);  
max_f       = max(data(722:739,4)); % maximum respiration
SR_obs      = data(722:739,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);

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
p_final(35,:) = p;

%
load('lygra.no_drought.mat')
WP_obs      = data(740:756,3);  
max_f       = max(data(740:756,4)); % maximum respiration
SR_obs      = data(740:756,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);

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
p_final(36,:) = p;

%

load('nyngan.au_ambient.mat')
WP_obs      = data(757:774,3);  
max_f       = max(data(757:774,4)); % maximum respiration
SR_obs      = data(757:774,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);

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
p_final(37,:) = p;

%
load('nyngan.au_drought.mat')
WP_obs      = data(775:792,3);  
max_f       = max(data(775:792,4)); % maximum respiration
SR_obs      = data(775:792,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);

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
p_final(38,:) = p;

%
load('passogavia.it_ambient.mat')
WP_obs      = data(793:816,3);  
max_f       = max(data(793:816,4)); % maximum respiration
SR_obs      = data(793:816,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);

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
p_final(39,:) = p;

%
load('passogavia.it_drought.mat')
WP_obs      = data(817:840,3);  
max_f       = max(data(817:840,4)); % maximum respiration
SR_obs      = data(817:840,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);

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
p_final(40,:) = p;

%
load('riomayo.ar_ambient.mat')
WP_obs      = data(841:852,3);  
max_f       = max(data(841:852,4)); % maximum respiration
SR_obs      = data(841:852,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);

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
p_final(41,:) = p;

%
load('riomayo.ar_drought.mat')
WP_obs      = data(853:866,3);  
max_f       = max(data(853:866,4)); % maximum respiration
SR_obs      = data(853:866,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);

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
p_final(42,:) = p;

%
load('scruzl.us_ambient.mat')
WP_obs      = data(867:896,3);  
max_f       = max(data(867:896,4)); % maximum respiration
SR_obs      = data(867:896,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);

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
p_final(43,:) = p;

%
load('scruzl.us_drought.mat')
WP_obs      = data(897:926,3);  
max_f       = max(data(897:926,4)); % maximum respiration
SR_obs      = data(897:926,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);

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
p_final(44,:) = p;

%
load('sgsdrt.us_ambient.mat')
WP_obs      = data(927:949,3);  
max_f       = max(data(927:949,4)); % maximum respiration
SR_obs      = data(927:949,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);

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
p_final(45,:) = p;

%
load('sgsdrt.us_drought.mat')
WP_obs      = data(950:973,3);  
max_f       = max(data(950:973,4)); % maximum respiration
SR_obs      = data(950:973,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);

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
p_final(46,:) = p;

%
load('skotsvar.no_ambient.mat')
WP_obs      = data(974:990,3);  
max_f       = max(data(974:990,4)); % maximum respiration
SR_obs      = data(974:990,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);

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
p_final(47,:) = p;

%
load('skotsvar.no_drought.mat')
WP_obs      = data(991:1008,3);  
max_f       = max(data(991:1008,4)); % maximum respiration
SR_obs      = data(991:1008,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);

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
p_final(48,:) = p;

% 

load('ukulingadrt.za_ambient.mat')
WP_obs      = data(1009:1026,3);  
max_f       = max(data(1009:1026,4)); % maximum respiration
SR_obs      = data(1009:1026,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);

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
p_final(49,:) = p;

%
load('ukulingadrt.za_drought.mat')
WP_obs      = data(1027:1044,3);  
max_f       = max(data(1027:1044,4)); % maximum respiration
SR_obs      = data(1027:1044,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);

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
p_final(50,:) = p;

%
load('wayqe.re_ambient.mat')
WP_obs      = data(1045:1062,3);  
max_f       = max(data(1045:1062,4)); % maximum respiration
SR_obs      = data(1045:1062,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);

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
p_final(51,:) = p;

%
load('wayqe.re_drought.mat')
WP_obs      = data(1063:1080,3);  
max_f       = max(data(1063:1080,4)); % maximum respiration
SR_obs      = data(1063:1080,4)/max_f;
WP_sim      = (linspace(p(3),1000,1e6));
SR_sim      = manzoni_model(WP_sim,p);
SR_sim1     = manzoni_model(WP_obs,p);

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
p_final(52,:) = p;

%%

p      = p_final;
save('p_final_manzoni.mat','p')
VG_titles = {'psi_th' 'alpha' 'psi_fc' 'r^2' 'p-value' 'sample size'};
C = [VG_titles; num2cell(p)];
writecell(C,'parameters_manzoni.csv') 
