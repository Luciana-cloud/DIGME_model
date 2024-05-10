function [SSE] = calibration_manzoni(p)

% Calling data
% data        = load("ayora_ambient.txt");
% data        = load("ayora_drought.txt");
% data        = load("Badlauch_ambient.txt");
% data        = load("Badlauch_drought.txt");
% data        = load("Brhill_ambient.txt");
% data        = load("Brhill_drought.txt");
% data        = load("Brookdale_ambient.txt");
% data        = load("Brookdale_drought.txt");
% data        = load("Savann_ambient.txt");
% data        = load("Savann_drought.txt");
% data        = load("cobar_ambient.txt");
% data        = load("cobar_drought.txt");
% data        = load("cowidrt_ambient.txt");
% data        = load("cowidrt_drought.txt");
% data        = load("dona_ambient.txt");
% data        = load("dona_drought.txt");
data        = load("GIG_ambient.txt");
% data        = load("GIG_drought.txt");
% data        = load("Hoide_ambient.txt");
% data        = load("Hoide_drought.txt");
% data        = load("Horacg_ambient.txt");
% data        = load("Horacg_drought.txt");
% data        = load("hyide_ambient.txt");
% data        = load("hyide_drought.txt");
% data        = load("Lygra_ambient.txt");
% data        = load("Lygra_drought.txt");
% data        = load("nyngan_ambient.txt");
% data        = load("nyngan_drought.txt");
% data        = load("P12_ambient.txt");
% data        = load("P12_drought.txt");
% data        = load("P13_ambient.txt");
% data        = load("P13_drought.txt");
% data        = load("passogavia_ambient.txt");
% data        = load("passogavia_drought.txt");
% data        = load("PNE_ambient.txt");
% data        = load("PNE_drought.txt");
% data        = load("Purdue_ambient.txt");
% data        = load("Purdue_drought.txt");
% data        = load("riomayo_ambient.txt");
% data        = load("riomayo_drought.txt");
% data        = load("scruzl_ambient.txt");
% data        = load("scruzl_drought.txt");
% data        = load("sev_mix_ambient.txt"); 
% data        = load("sev_mix_drought.txt");
% data        = load("sgsdrt_ambient.txt");
% data        = load("sgsdrt_drought.txt");
% data        = load("skotsvar_ambient.txt");
% data        = load("skotsvar_drought.txt");
% data        = load("ukulingadrt_ambient.txt");
% data        = load("ukulingadrt_drought.txt");
% data        = load("wayqe_ambient.txt");
% data        = load("wayqe_drought.txt");

x           = data(:,1);

% Calling model
SR_sim      = manzoni_model(x,p);
max_f       = max(data(:,2)); % maximum respiration

% Objective function
SR_obs      = data(:,2)/max_f;
SSE_1       = (sum(((SR_obs-SR_sim)).^2));
SSE         = SSE_1^0.5

% fig = figure;
plot(log10(x),SR_sim,"*");
hold on
plot(log10(x),SR_obs,"o");
xline(log10(p(3)),'-r');
xline(p(1),'-b');

% fig = figure;
% scatter(SR_obs,SR_sim)
end