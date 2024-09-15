function [theta] = Brook_Corey(x,p)

psi     = x; % Water pontential [Bar]

% Parameters

n       = p(1); % Curve shape parameters [-]
alpha   = p(2); % Scaling parameter [1/cm]
theta_s = p(3); % Saturated soil moisture content [%] % *cedarsav.us,hyide.de
theta_r = p(4); % Residual soil water content [%]

% Constants

% theta_s = q(1); % Saturated soil moisture content [%]
% theta_r = q(2); % Residual soil water content [%]

% Gravimetric water content [%]

theta = theta_r + (theta_s - theta_r)./(alpha.*abs(psi)).^n;

end