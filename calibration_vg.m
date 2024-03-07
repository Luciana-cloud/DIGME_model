function [SSE] = calibration_vg(p)

% Calling Data

Data        = load("water_pontential_conversion.txt");
x           = Data(:,3);

% Parameters

% p(1) = 0.01; % Residual soil water content (theta_r) [g/g]
% p(2) = 0.5;  % Saturated soil moisture content (theta_s) [g/g]
% p(3) = 1.5;  % Curve shape parameters (n) [-]
% p(4) = 0.05; % Scaling parameter (alpha) [1/KPa]   

% Simulations

WC_sim      = van_genuchten(x,p);

% Model Calibration

WC_obs      = Data(:,1);
WC_sd       = Data(:,2);

SSE_1       = (sum(((WC_obs-WC_sim)./WC_sd).^2))./length(WC_sim);
SSE         = SSE_1^0.5

end