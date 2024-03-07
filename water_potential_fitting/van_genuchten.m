function [theta] = van_genuchten(x,p)

% Variables 

psi     = x; % Water pontential [Kpa]

% Parameters

theta_r = p(1); % Residual soil water content [g/g]
theta_s = p(2); % Saturated soil moisture content [g/g]
n       = p(3); % Curve shape parameters [-]
alpha   = p(4); % Scaling parameter [1/cm]   

% Functions

m = 1 - 1/n; % Shapre parameter

% Gravimetric water content [g/g]

theta = theta_r + (theta_s - theta_r)./((1 + (alpha.*abs(psi)).^n)).^m;

end