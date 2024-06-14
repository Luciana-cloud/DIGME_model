function [theta] = van_genuchten(x,p)

% Variables 

psi     = x; % Water pontential [Kpa]

% Parameters

n       = p(1); % Curve shape parameters [-]
alpha   = p(2); % Scaling parameter [1/cm]
theta_s = p(3); % Saturated soil moisture content [g/g] % *cedarsav.us,hyide.de
theta_r = p(4); % Residual soil water content [g/g]

% Constants

% theta_s = q(1); % Saturated soil moisture content [g/g]
% theta_r = q(2); % Residual soil water content [g/g]

% Functions

m = 1 - 1/n; % Shapre parameter

% Gravimetric water content [g/g]

theta = theta_r + (theta_s - theta_r)./((1 + (alpha.*abs(psi)).^n)).^m;

end