function [SSE] = calibration_vg(p)

% Calling Data

Data   = load("dona_ana.txt");
x      = Data(:,1); % Water pontential [Kpa]

% Constants

q(1)   = Data(1,3); % Saturated soil moisture content [g/g]
q(2)   = Data(6,4); % Residual soil water content [g/g]
% q(2)   = 0; % Residual soil water content [g/g]

% Simulations

WC_sim      = van_genuchten(x,p,q);

% Model Calibration

WC_obs      = Data(:,4);
WC_sd       = Data(:,5);

SSE_1       = (sum(((WC_obs-WC_sim)./WC_sd).^2))./length(WC_sim);

SSE         = SSE_1^0.5

scatter(WC_obs,WC_sim);

end