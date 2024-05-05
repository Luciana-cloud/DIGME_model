function [SSE] = calibration_manzoni(p)

% Calling data
% data        = load("ayora_ambient.txt");
data        = load("ayora_drought.txt");
x           = data(:,1);

% Model fixed parameters
q(1) = 0.033; % Soil field capacity (ψfc = 33 KPa)

% Calling model
SR_sim      = manzoni_model(x,p,q);
max_f       = max(data(:,2)); % maximum respiration

% Objective function
SR_obs      = data(:,2)/max_f;
SSE_1       = (sum(((SR_obs-SR_sim)).^2));
SSE         = SSE_1^0.5

% fig = figure;
plot(log10(x),SR_sim,"*");
hold on
plot(log10(x),SR_obs,"o");
xline(log10(q(1)),'-r');
xline(p(1),'-b');

% fig = figure;
% scatter(SR_obs,SR_sim)
end