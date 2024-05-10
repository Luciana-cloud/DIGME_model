%% Plotting Manzoni fits %%

%% Clay soils %%

load('GIG_ambient_manzoni.mat')
data        = load("GIG_ambient.txt");
WP_obs      = data(:,1);  
max_f       = max(data(:,2)); % maximum respiration
SR_obs      = data(:,2)/max_f;
WP_sim      = (linspace(p(3),1000,100000));
SR_sim      = manzoni_model(WP_sim,p);

fig = figure;
subplot(2,4,1);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('GIG_A_7C_7 - Ambient')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(0.01) log10(10^3.5)])
ylim([0 1])

load('GIG_drought_manzoni.mat')
data        = load("GIG_drought.txt");
WP_obs      = data(:,1);  
max_f       = max(data(:,2)); % maximum respiration
SR_obs      = data(:,2)/max_f;
WP_sim      = (linspace(p(3),1000,100000));
SR_sim      = manzoni_model(WP_sim,p);

subplot(2,4,2);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('GIG_A_7C_7 - Drought')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(0.01) log10(10^3.5)])
ylim([0 1])

load('P13_ambient_manzoni.mat')
data        = load("P13_ambient.txt");
WP_obs      = data(:,1);  
max_f       = max(data(:,2)); % maximum respiration
SR_obs      = data(:,2)/max_f;
WP_sim      = (linspace(p(3),1000,100000));
SR_sim      = manzoni_model(WP_sim,p);

subplot(2,4,3);
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
xlim([log10(0.01) log10(10^3.5)])
ylim([0 1])

load('P13_drought_manzoni.mat')
data        = load("P13_drought.txt");
WP_obs      = data(:,1);  
max_f       = max(data(:,2)); % maximum respiration
SR_obs      = data(:,2)/max_f;
WP_sim      = (linspace(p(3),1000,100000));
SR_sim      = manzoni_model(WP_sim,p);

subplot(2,4,4);
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
xlim([log10(0.01) log10(10^3.5)])
ylim([0 1])

load('P12_ambient_manzoni.mat')
data        = load("P12_ambient.txt");
WP_obs      = data(:,1);  
max_f       = max(data(:,2)); % maximum respiration
SR_obs      = data(:,2)/max_f;
WP_sim      = (linspace(p(3),1000,100000));
SR_sim      = manzoni_model(WP_sim,p);

subplot(2,4,5);
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
xlim([log10(0.01) log10(10^3.5)])
ylim([0 1])

load('P12_drought_manzoni.mat')
data        = load("P12_drought.txt");
WP_obs      = data(:,1);  
max_f       = max(data(:,2)); % maximum respiration
SR_obs      = data(:,2)/max_f;
WP_sim      = (linspace(p(3),1000,100000));
SR_sim      = manzoni_model(WP_sim,p);

subplot(2,4,6);
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
xlim([log10(0.01) log10(10^3.5)])
ylim([0 1])

load('ukulingadrt_ambient_manzoni.mat')
data        = load("ukulingadrt_ambient.txt");
WP_obs      = data(:,1);  
max_f       = max(data(:,2)); % maximum respiration
SR_obs      = data(:,2)/max_f;
WP_sim      = (linspace(p(3),1000,100000));
SR_sim      = manzoni_model(WP_sim,p);

subplot(2,4,7);
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
xlim([log10(0.01) log10(10^3.5)])
ylim([0 1])

load('ukulingadrt_drought_manzoni.mat')
data        = load("ukulingadrt_drought.txt");
WP_obs      = data(:,1);  
max_f       = max(data(:,2)); % maximum respiration
SR_obs      = data(:,2)/max_f;
WP_sim      = (linspace(p(3),1000,100000));
SR_sim      = manzoni_model(WP_sim,p);

subplot(2,4,8);
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
xlim([log10(0.01) log10(10^3.5)])
ylim([0 1])

sgtitle('Clay soils')

%% Clay Loam soils %%

load('Brookdale_ambient_manzoni.mat')
data        = load("Brookdale_ambient.txt");
WP_obs      = data(:,1);  
max_f       = max(data(:,2)); % maximum respiration
SR_obs      = data(:,2)/max_f;
WP_sim      = (linspace(p(3),1000,100000));
SR_sim      = manzoni_model(WP_sim,p);

fig = figure;
subplot(1,2,1);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('Brookdale - Ambient')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(0.01) log10(10^3.5)])
ylim([0 1])

load('Brookdale_drought_manzoni.mat')
data        = load("Brookdale_drought.txt");
WP_obs      = data(:,1);  
max_f       = max(data(:,2)); % maximum respiration
SR_obs      = data(:,2)/max_f;
WP_sim      = (linspace(p(3),1000,100000));
SR_sim      = manzoni_model(WP_sim,p);

subplot(1,2,2);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('Brookdale - Drought')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(0.01) log10(10^3.5)])
ylim([0 1])

sgtitle('Clay Loamy soils')

%% Loam soils soils %%

load('Badlauch_ambient_manzoni.mat')
data        = load("Badlauch_ambient.txt");
WP_obs      = data(:,1);  
max_f       = max(data(:,2)); % maximum respiration
SR_obs      = data(:,2)/max_f;
WP_sim      = (linspace(p(3),1000,100000));
SR_sim      = manzoni_model(WP_sim,p);

fig = figure;
subplot(1,2,1);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('Badlauch - Ambient')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(0.01) log10(10^3.5)])
ylim([0 1])

load('Badlauch_drought_manzoni.mat')
data        = load("Badlauch_drought.txt");
WP_obs      = data(:,1);  
max_f       = max(data(:,2)); % maximum respiration
SR_obs      = data(:,2)/max_f;
WP_sim      = (linspace(p(3),1000,100000));
SR_sim      = manzoni_model(WP_sim,p);

subplot(1,2,2);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('Badlauch - Drought')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(0.01) log10(10^3.5)])
ylim([0 1])

sgtitle('Loam soils')

%% Loamy sandy soils %%

load('Dona_ambient_manzoni.mat')
data        = load("dona_ambient.txt");
WP_obs      = data(:,1);  
max_f       = max(data(:,2)); % maximum respiration
SR_obs      = data(:,2)/max_f;
WP_sim      = (linspace(p(3),1000,100000));
SR_sim      = manzoni_model(WP_sim,p);

fig = figure;
subplot(2,2,1);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('Dona - Ambient')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(0.01) log10(10^3.5)])
ylim([0 1])

load('Dona_drought_manzoni.mat')
data        = load("dona_drought.txt");
WP_obs      = data(:,1);  
max_f       = max(data(:,2)); % maximum respiration
SR_obs      = data(:,2)/max_f;
WP_sim      = (linspace(p(3),1000,100000));
SR_sim      = manzoni_model(WP_sim,p);

subplot(2,2,2);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('Dona - Drought')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(0.01) log10(10^3.5)])
ylim([0 1])

load('sev_ambient_manzoni.mat')
data        = load("sev_mix_ambient.txt");
WP_obs      = data(:,1);  
max_f       = max(data(:,2)); % maximum respiration
SR_obs      = data(:,2)/max_f;
WP_sim      = (linspace(p(3),1000,100000));
SR_sim      = manzoni_model(WP_sim,p);

subplot(2,2,3);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('Sev - Ambient')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(0.01) log10(10^3.5)])
ylim([0 1])

load('sev_drought_manzoni.mat')
data        = load("sev_mix_drought.txt");
WP_obs      = data(:,1);  
max_f       = max(data(:,2)); % maximum respiration
SR_obs      = data(:,2)/max_f;
WP_sim      = (linspace(p(3),1000,100000));
SR_sim      = manzoni_model(WP_sim,p);

subplot(2,2,4);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('Sev - Drought')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(0.01) log10(10^3.5)])
ylim([0 1])

sgtitle('Loamy sandy soils')

%% Organic soils %%

load('skotsvar_ambient_manzoni.mat')
data        = load("skotsvar_ambient.txt");
WP_obs      = data(:,1);  
max_f       = max(data(:,2)); % maximum respiration
SR_obs      = data(:,2)/max_f;
WP_sim      = (linspace(p(3),1000,100000));
SR_sim      = manzoni_model(WP_sim,p);

fig = figure;
subplot(2,2,1);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('Skotsvar - Ambient')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(0.01) log10(10^3.5)])
ylim([0 1])

load('skotsvar_drought_manzoni.mat')
data        = load("skotsvar_drought.txt");
WP_obs      = data(:,1);  
max_f       = max(data(:,2)); % maximum respiration
SR_obs      = data(:,2)/max_f;
WP_sim      = (linspace(p(3),1000,100000));
SR_sim      = manzoni_model(WP_sim,p);

subplot(2,2,2);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('Skotsvar - Drought')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(0.01) log10(10^3.5)])
ylim([0 1])

load('wayqe_ambient_manzoni.mat')
data        = load("wayqe_ambient.txt");
WP_obs      = data(:,1);  
max_f       = max(data(:,2)); % maximum respiration
SR_obs      = data(:,2)/max_f;
WP_sim      = (linspace(p(3),1000,100000));
SR_sim      = manzoni_model(WP_sim,p);

subplot(2,2,3);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('Wayqe - Ambient')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(0.01) log10(10^3.5)])
ylim([0 1])

load('wayqe_drought_manzoni.mat')
data        = load("wayqe_drought.txt");
WP_obs      = data(:,1);  
max_f       = max(data(:,2)); % maximum respiration
SR_obs      = data(:,2)/max_f;
WP_sim      = (linspace(p(3),1000,100000));
SR_sim      = manzoni_model(WP_sim,p);

subplot(2,2,4);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('Wayqe - Drought')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(0.01) log10(10^3.5)])
ylim([0 1])

sgtitle('Organic soils')

%% Sandy soils %%

load('Savann_ambient_manzoni.mat')
data        = load("Savann_ambient.txt");
WP_obs      = data(:,1);  
max_f       = max(data(:,2)); % maximum respiration
SR_obs      = data(:,2)/max_f;
WP_sim      = (linspace(p(3),1000,100000));
SR_sim      = manzoni_model(WP_sim,p);

fig = figure;
subplot(3,4,1);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('Savann - Ambient')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(0.01) log10(10^3.5)])
ylim([0 1])

load('Savann_drought_manzoni.mat')
data        = load("Savann_drought.txt");
WP_obs      = data(:,1);  
max_f       = max(data(:,2)); % maximum respiration
SR_obs      = data(:,2)/max_f;
WP_sim      = (linspace(p(3),1000,100000));
SR_sim      = manzoni_model(WP_sim,p);

subplot(3,4,2);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('Savann - Drought')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(0.01) log10(10^3.5)])
ylim([0 1])

load('Hoide_ambient_manzoni.mat')
data        = load("hoide_ambient.txt");
WP_obs      = data(:,1);  
max_f       = max(data(:,2)); % maximum respiration
SR_obs      = data(:,2)/max_f;
WP_sim      = (linspace(p(3),1000,100000));
SR_sim      = manzoni_model(WP_sim,p);

subplot(3,4,3);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('Hoide - Ambient')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(0.01) log10(10^3.5)])
ylim([0 1])

load('Hoide_drought_manzoni.mat')
data        = load("hoide_drought.txt");
WP_obs      = data(:,1);  
max_f       = max(data(:,2)); % maximum respiration
SR_obs      = data(:,2)/max_f;
WP_sim      = (linspace(p(3),1000,100000));
SR_sim      = manzoni_model(WP_sim,p);

subplot(3,4,4);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('Hoide - Drought')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(0.01) log10(10^3.5)])
ylim([0 1])

load('Horacg_ambient_manzoni.mat')
data        = load("Horacg_ambient.txt");
WP_obs      = data(:,1);  
max_f       = max(data(:,2)); % maximum respiration
SR_obs      = data(:,2)/max_f;
WP_sim      = (linspace(p(3),1000,100000));
SR_sim      = manzoni_model(WP_sim,p);

subplot(3,4,5);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('Horacg - Ambient')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(0.01) log10(10^3.5)])
ylim([0 1])

load('Horacg_drought_manzoni.mat')
data        = load("Horacg_drought.txt");
WP_obs      = data(:,1);  
max_f       = max(data(:,2)); % maximum respiration
SR_obs      = data(:,2)/max_f;
WP_sim      = (linspace(p(3),1000,100000));
SR_sim      = manzoni_model(WP_sim,p);

subplot(3,4,6);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('Horacg - Drought')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(0.01) log10(10^3.5)])
ylim([0 1])

load('hyide_ambient_manzoni.mat')
data        = load("hyide_ambient.txt");
WP_obs      = data(:,1);  
max_f       = max(data(:,2)); % maximum respiration
SR_obs      = data(:,2)/max_f;
WP_sim      = (linspace(p(3),1000,100000));
SR_sim      = manzoni_model(WP_sim,p);

subplot(3,4,7);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('Hyide - Ambient')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(0.01) log10(10^3.5)])
ylim([0 1])

load('hyide_drought_manzoni.mat')
data        = load("hyide_drought.txt");
WP_obs      = data(:,1);  
max_f       = max(data(:,2)); % maximum respiration
SR_obs      = data(:,2)/max_f;
WP_sim      = (linspace(p(3),1000,100000));
SR_sim      = manzoni_model(WP_sim,p);

subplot(3,4,8);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('Hyide - Drought')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(0.01) log10(10^3.5)])
ylim([0 1])

load('riomayo_ambient_manzoni.mat')
data        = load("riomayo_ambient.txt");
WP_obs      = data(:,1);  
max_f       = max(data(:,2)); % maximum respiration
SR_obs      = data(:,2)/max_f;
WP_sim      = (linspace(p(3),1000,100000));
SR_sim      = manzoni_model(WP_sim,p);

subplot(3,4,9);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('Riomayo - Ambient')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(0.01) log10(10^3.5)])
ylim([0 1])

load('riomayo_drought_manzoni.mat')
data        = load("riomayo_drought.txt");
WP_obs      = data(:,1);  
max_f       = max(data(:,2)); % maximum respiration
SR_obs      = data(:,2)/max_f;
WP_sim      = (linspace(p(3),1000,100000));
SR_sim      = manzoni_model(WP_sim,p);

subplot(3,4,10);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('Riomayo - Drought')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(0.01) log10(10^3.5)])
ylim([0 1])

sgtitle('Sandy soils')

%% Sandy Clay soils %%

load('PNE_ambient_manzoni.mat')
data        = load("PNE_ambient.txt");
WP_obs      = data(:,1);  
max_f       = max(data(:,2)); % maximum respiration
SR_obs      = data(:,2)/max_f;
WP_sim      = (linspace(p(3),1000,100000));
SR_sim      = manzoni_model(WP_sim,p);

fig = figure;
subplot(1,2,1);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('PNE - Ambient')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(0.01) log10(10^3.5)])
ylim([0 1])

load('PNE_drought_manzoni.mat')
data        = load("PNE_drought.txt");
WP_obs      = data(:,1);  
max_f       = max(data(:,2)); % maximum respiration
SR_obs      = data(:,2)/max_f;
WP_sim      = (linspace(p(3),1000,100000));
SR_sim      = manzoni_model(WP_sim,p);

subplot(1,2,2);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('PNE - Drought')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(0.01) log10(10^3.5)])
ylim([0 1])

sgtitle('Sandy Clay soils')

%% Sandy Clay Loam soils %%

load('Cobar_ambient_manzoni.mat')
data        = load("Cobar_ambient.txt");
WP_obs      = data(:,1);  
max_f       = max(data(:,2)); % maximum respiration
SR_obs      = data(:,2)/max_f;
WP_sim      = (linspace(p(3),1000,100000));
SR_sim      = manzoni_model(WP_sim,p);

fig = figure;
subplot(2,2,1);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('Cobar - Ambient')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(0.01) log10(10^3.5)])
ylim([0 1])

load('Cobar_drought_manzoni.mat')
data        = load("Cobar_drought.txt");
WP_obs      = data(:,1);  
max_f       = max(data(:,2)); % maximum respiration
SR_obs      = data(:,2)/max_f;
WP_sim      = (linspace(p(3),1000,100000));
SR_sim      = manzoni_model(WP_sim,p);

subplot(2,2,2);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('Cobar - Drought')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(0.01) log10(10^3.5)])
ylim([0 1])

load('sgsdrt_ambient_manzoni.mat')
data        = load("sgsdrt_ambient.txt");
WP_obs      = data(:,1);  
max_f       = max(data(:,2)); % maximum respiration
SR_obs      = data(:,2)/max_f;
WP_sim      = (linspace(p(3),1000,100000));
SR_sim      = manzoni_model(WP_sim,p);

subplot(2,2,3);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('Sgsdrt - Ambient')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(0.01) log10(10^3.5)])
ylim([0 1])

load('sgsdrt_drought_manzoni.mat')
data        = load("sgsdrt_drought.txt");
WP_obs      = data(:,1);  
max_f       = max(data(:,2)); % maximum respiration
SR_obs      = data(:,2)/max_f;
WP_sim      = (linspace(p(3),1000,100000));
SR_sim      = manzoni_model(WP_sim,p);

subplot(2,2,4);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('Sgsdrt - Drought')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(0.01) log10(10^3.5)])
ylim([0 1])

sgtitle('Sandy Clay Loam soils')

%% Sandy Loam soils %%

load('Brhill_ambient_manzoni.mat')
data        = load("Brhill_ambient.txt");
WP_obs      = data(:,1);  
max_f       = max(data(:,2)); % maximum respiration
SR_obs      = data(:,2)/max_f;
WP_sim      = (linspace(p(3),1000,100000));
SR_sim      = manzoni_model(WP_sim,p);

fig = figure;
subplot(3,4,1);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('Brhill - Ambient')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(0.01) log10(10^3.5)])
ylim([0 1])

load('Brhill_drought_manzoni.mat')
data        = load("Brhill_drought.txt");
WP_obs      = data(:,1);  
max_f       = max(data(:,2)); % maximum respiration
SR_obs      = data(:,2)/max_f;
WP_sim      = (linspace(p(3),1000,100000));
SR_sim      = manzoni_model(WP_sim,p);

subplot(3,4,2);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('Brhill - Drought')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(0.01) log10(10^3.5)])
ylim([0 1])

load('Cowidrt_ambient_manzoni.mat')
data        = load("cowidrt_ambient.txt");
WP_obs      = data(:,1);  
max_f       = max(data(:,2)); % maximum respiration
SR_obs      = data(:,2)/max_f;
WP_sim      = (linspace(p(3),1000,100000));
SR_sim      = manzoni_model(WP_sim,p);

subplot(3,4,3);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('Cowidrt - Ambient')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(0.01) log10(10^3.5)])
ylim([0 1])

load('Cowidrt_drought_manzoni.mat')
data        = load("cowidrt_drought.txt");
WP_obs      = data(:,1);  
max_f       = max(data(:,2)); % maximum respiration
SR_obs      = data(:,2)/max_f;
WP_sim      = (linspace(p(3),1000,100000));
SR_sim      = manzoni_model(WP_sim,p);

subplot(3,4,4);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('Cowidrt - Drought')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(0.01) log10(10^3.5)])
ylim([0 1])

load('Lygra_ambient_manzoni.mat')
data        = load("Lygra_ambient.txt");
WP_obs      = data(:,1);  
max_f       = max(data(:,2)); % maximum respiration
SR_obs      = data(:,2)/max_f;
WP_sim      = (linspace(p(3),1000,100000));
SR_sim      = manzoni_model(WP_sim,p);

subplot(3,4,5);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('Lygra - Ambient')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(0.01) log10(10^3.5)])
ylim([0 1])

load('Lygra_drought_manzoni.mat')
data        = load("Lygra_drought.txt");
WP_obs      = data(:,1);  
max_f       = max(data(:,2)); % maximum respiration
SR_obs      = data(:,2)/max_f;
WP_sim      = (linspace(p(3),1000,100000));
SR_sim      = manzoni_model(WP_sim,p);

subplot(3,4,6);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('Lygra - Drought')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(0.01) log10(10^3.5)])
ylim([0 1])

load('nyngan_ambient_manzoni.mat')
data        = load("nyngan_ambient.txt");
WP_obs      = data(:,1);  
max_f       = max(data(:,2)); % maximum respiration
SR_obs      = data(:,2)/max_f;
WP_sim      = (linspace(p(3),1000,100000));
SR_sim      = manzoni_model(WP_sim,p);

subplot(3,4,7);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('Nyngan - Ambient')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(0.01) log10(10^3.5)])
ylim([0 1])

load('nyngan_drought_manzoni.mat')
data        = load("nyngan_drought.txt");
WP_obs      = data(:,1);  
max_f       = max(data(:,2)); % maximum respiration
SR_obs      = data(:,2)/max_f;
WP_sim      = (linspace(p(3),1000,100000));
SR_sim      = manzoni_model(WP_sim,p);

subplot(3,4,8);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('Nyngan - Drought')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(0.01) log10(10^3.5)])
ylim([0 1])

load('passogavia_ambient_manzoni.mat')
data        = load("passogavia_ambient.txt");
WP_obs      = data(:,1);  
max_f       = max(data(:,2)); % maximum respiration
SR_obs      = data(:,2)/max_f;
WP_sim      = (linspace(p(3),1000,100000));
SR_sim      = manzoni_model(WP_sim,p);

subplot(3,4,9);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('Passogavia - Ambient')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(0.01) log10(10^3.5)])
ylim([0 1])

load('passogavia_drought_manzoni.mat')
data        = load("passogavia_drought.txt");
WP_obs      = data(:,1);  
max_f       = max(data(:,2)); % maximum respiration
SR_obs      = data(:,2)/max_f;
WP_sim      = (linspace(p(3),1000,100000));
SR_sim      = manzoni_model(WP_sim,p);

subplot(3,4,10);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('Passogavia - Drought')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(0.01) log10(10^3.5)])
ylim([0 1])

load('scruzl_ambient_manzoni.mat')
data        = load("scruzl_ambient.txt");
WP_obs      = data(:,1);  
max_f       = max(data(:,2)); % maximum respiration
SR_obs      = data(:,2)/max_f;
WP_sim      = (linspace(p(3),1000,100000));
SR_sim      = manzoni_model(WP_sim,p);

subplot(3,4,11);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('Scruzl - Ambient')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(0.01) log10(10^3.5)])
ylim([0 1])

load('scruzl_drought_manzoni.mat')
data        = load("scruzl_drought.txt");
WP_obs      = data(:,1);  
max_f       = max(data(:,2)); % maximum respiration
SR_obs      = data(:,2)/max_f;
WP_sim      = (linspace(p(3),1000,100000));
SR_sim      = manzoni_model(WP_sim,p);

subplot(3,4,12);
A = plot(log10(WP_sim),SR_sim,'Color', [17 17 17]/255);
hold on
B = plot(log10(WP_obs),SR_obs,"*");
C = xline(log10(p(3)),'-r');
D = xline(p(1),'-b');
% legend([A B C D],{'Simulations','Observations','Field capacity', ...
%     'Microbial stress threshold'})
title('Scruzl - Drought')
xlabel('Log10(Water Potential) [bars]')
ylabel('Normalized soil respiration')
xlim([log10(0.01) log10(10^3.5)])
ylim([0 1])

sgtitle('Sandy Loam soils')

%% Silty Loamy soils %%

load('Purdue_ambient_manzoni.mat')
data        = load("Purdue_ambient.txt");
WP_obs      = data(:,1);  
max_f       = max(data(:,2)); % maximum respiration
SR_obs      = data(:,2)/max_f;
WP_sim      = (linspace(p(3),1000,100000));
SR_sim      = manzoni_model(WP_sim,p);

fig = figure;
subplot(1,2,1);
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
xlim([log10(0.01) log10(10^3.5)])
ylim([0 1])

load('Purdue_drought_manzoni.mat')
data        = load("Purdue_drought.txt");
WP_obs      = data(:,1);  
max_f       = max(data(:,2)); % maximum respiration
SR_obs      = data(:,2)/max_f;
WP_sim      = (linspace(p(3),1000,100000));
SR_sim      = manzoni_model(WP_sim,p);

subplot(1,2,2);
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
xlim([log10(0.01) log10(10^3.5)])
ylim([0 1])

sgtitle('Silty Loamy soils')

%% Silty Clay Loam soils %%

load('Ayora_ambient_manzoni.mat')
data        = load("ayora_ambient.txt");
WP_obs      = data(:,1);  
max_f       = max(data(:,2)); % maximum respiration
SR_obs      = data(:,2)/max_f;
WP_sim      = (linspace(p(3),1000,100000));
SR_sim      = manzoni_model(WP_sim,p);

fig = figure;
subplot(1,2,1);
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
xlim([log10(0.01) log10(10^3.5)])
ylim([0 1])

load('Ayora_drought_manzoni.mat')
data        = load("ayora_drought.txt");
WP_obs      = data(:,1);  
max_f       = max(data(:,2)); % maximum respiration
SR_obs      = data(:,2)/max_f;
WP_sim      = (linspace(p(3),1000,100000));
SR_sim      = manzoni_model(WP_sim,p);

subplot(1,2,2);
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
xlim([log10(0.01) log10(10^3.5)])
ylim([0 1])

sgtitle('Silty Clay Loam soils')