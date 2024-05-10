function [SR] = manzoni_model(x,p)

% X variable
matric = x; % Current matric potential (bar)

% Model parameters
psi_th = 10^p(1); % Microbial stress threshold (bar)
alpha  = p(2); % Shape parameter
psi_fc = p(3); % Soil field capacity (bar)

% Normalized activity

SR     = 1 - (log10(x./psi_fc)./log10(psi_th/psi_fc)).^alpha;

end
