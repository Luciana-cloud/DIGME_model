function [SSE] = calibration_DAMM(p)

% Calling Data
Data        = load("DIGME_mean.2.txt");

% Moisture Data
% x_1         = Data(1:6,2);    % Ayora Ambient
% x_1         = Data(7:12,2);   % Ayora Drought
% x_1         = Data(13:18,2);  % brhill Ambient
% x_1         = Data(19:24,2);  % brhill Drought
% x_1         = Data(25:30,2);  % brookdale Ambient
% x_1         = Data(31:36,2);  % brookdale Drought

% Model Parameters
% p(1); % V_max - Maximum velocity of the enzymatic reaction*
% p(2); %K_S (ambient) - Michaelis constant (S)*
% p(3); % K_O (ambient) Michaelis constant (O)*
% p(4); %K_S (drought) - Michaelis constant (S)
% p(5); % K_O (drought) Michaelis constant (O)

% Model  fixed parameters and model results
q(1)        = mean(Data(1:12,4));      % Bulk density [kg/m3]
q(2)        = 30.99430/100;                 % Clay content [%]
q(3)        = 1.5;                          % Cementation exponent
q(4)        = 2.5;                          % Saturation exponent
q(5)        = 0.2;                          % Empirical coefficient of water percolation threshold[-]
q(6)        = 0.1;                          % Empirical coefficient of air percolation threshold[-]
q(7)        = mean(Data(1:12,12))/1.72/100; % Concentration of SOC [%]
q(8)        = 1.9;                     % Particle density [kg/m3]

SR_sim      = DAMM_model(x_1,p,q); 
% Ayora Ambient
% SR_obs      = Data(1:6,8);
% SR_sd       = Data(1:6,9);
% Ayora Drought
% SR_obs      = Data(7:12,8);
% SR_sd       = Data(7:12,9);
% brhill Ambient
% SR_obs      = Data(13:18,8);
% SR_sd       = Data(13:18,9);
% brhill Drought
% SR_obs      = Data(19:24,8);
% SR_sd       = Data(19:24,9);
% brookdale Ambient
% SR_obs      = Data(25:30,8);
% SR_sd       = Data(25:30,9);
% brookdale Drought
% SR_obs      = Data(31:36,8);
% SR_sd       = Data(31:36,9);

SSE_1       = (sum(((SR_obs-SR_sim)./SR_sd).^2))./length(SR_sim);
SSE         = SSE_1^0.5

plot(SR_obs,SR_sim,"o")

end