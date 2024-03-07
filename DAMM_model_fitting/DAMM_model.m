function [SR] = DAMM_model(x,p,q)
% X variable
theta = x;

% Model parameters
V_max       = p(1); % Maximum velocity of the enzymatic reaction
K_S         = p(2); % Michaelis constant (S)
K_O         = p(3); % Michaelis constant (O)

% Model fixed parameters
rho_b       = q(1); % Bulk density [kg/m3]
clay        = q(2); % Clay content [g/g]
m           = q(3); % Cementation exponent
n           = q(4); % saturation exponent
alpha_th    = q(5); % Empirical coefficient of water percolation threshold[-]
alpha_e     = q(6); % Empirical coefficient of air percolation threshold[-]
SOC         = q(7); % Concentration of SOC [%]
pd          = q(8); % Particle density [kg/m3]

% Water percolation threshold [m3/m3]
theta_th = alpha_th * rho_b * ((clay/2.7) + SOC);
% theta_th = 0;

% Porosity 
phi      = 1 - (rho_b/pd);

% Gas percolation threshold [m3/m3]
ep_th    = alpha_e * phi;

% Local air content
ep       = phi - theta;

% Gas diffusivity, (normalized to diffusivity in free air, Do,g)
O_A = phi.^m .* ((ep - ep_th)./(phi - ep_th)).^n; 

%Solute diffusivity, (normalized to the diffusivity in pure water, Do,s)
S_A = (phi - theta_th).^m .* ((theta - theta_th)./(phi - theta_th)).^n;

% Modeling the effect of soil properties on soil respiration
SR = V_max .* (S_A.*(K_S+S_A).^(-1)) .* (O_A.*(K_O+O_A).^(-1));
end