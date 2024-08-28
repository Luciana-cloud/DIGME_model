function [SR] = manzoni_model_new(x,p,q)

% X variable
psi = x; % Current matric potential (bar)

% Model parameters
psi_th = 10^p(1); % Microbial stress threshold (bar)
alpha  = p(2); % Shape parameter

% Fix parametesrs
psi_fc = q(1); % Soil field capacity (bar)

% Normalized activity

SR     = 1 - (log10(psi./psi_fc)./log10(psi_th/psi_fc)).^alpha;

end
