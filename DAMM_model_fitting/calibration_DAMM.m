function [SSE] = calibration_DAMM(p)

% Calling Data
Data        = load("DIGME_mean.txt");

% Moisture Data
x_1         = Data(1:18,1);    % Ayora Ambient
% x_1         = Data(19:36,2);   % Ayora Drought

% Model Parameters
% p(1); % V_max - Maximum velocity of the enzymatic reaction*
% p(2); %K_S (ambient) - Michaelis constant (S)*
% p(3); % K_O (ambient) Michaelis constant (O)*
% p(4); %K_S (drought) - Michaelis constant (S)
% p(5); % K_O (drought) Michaelis constant (O)

% Model  fixed parameters and model results
q(1)        = 0.9974;           % Bulk density [kg/m3] Ayora
q(2)        = 30.99430/100;                 % Clay content [%] Ayora
q(3)        = 1.5;                          % Cementation exponent
q(4)        = 2.5;                          % Saturation exponent
q(5)        = 0.2;                          % Empirical coefficient of water percolation threshold[-]
q(6)        = 0.1;                          % Empirical coefficient of air percolation threshold[-]
q(7)        = 0.0832;  % Concentration of SOC [%] Ayora
q(8)        = 2.0375;                       % Particle density [kg/m3] Ayora

SR_sim      = DAMM_model(x_1,p,q); 
% Ayora Ambient
SR_obs      = Data(1:18,3);
% Ayora Drought
% SR_obs      = Data(19:36,3);

SSE_1       = (sum(((SR_obs-SR_sim)).^2))./length(SR_sim);
SSE         = SSE_1^0.5

plot(SR_obs,SR_sim,"o")

end