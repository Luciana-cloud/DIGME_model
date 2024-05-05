function [SR] = manzoni_model(x,p,q)

% X variable
matric = x; % Current matric potential (KPa)

% Model parameters
psi_th = 10^p(1); % Microbial stress threshold (KPa)
alpha  = p(2); % Shape parameter

% Model fixed parameters
psi_fc = q(1); % Soil field capacity (ψfc = 33 KPa)

% Normalized activity

SR     = 1 - (log10(x./psi_fc)./log10(psi_th/psi_fc)).^alpha;

end
