function [SR_sim] = plotting_DAMM(x,p)

Data        = load("DIGME_mean.2.txt");
% Model  fixed parameters and model results
q(1)        = mean(Data(1:12,4));      % Bulk density [kg/m3]
q(2)        = 30.99430/100;                 % Clay content [%]
q(3)        = 1.5;                          % Cementation exponent
q(4)        = 2.5;                          % Saturation exponent
q(5)        = 0.2;                          % Empirical coefficient of water percolation threshold[-]
q(6)        = 0.1;                          % Empirical coefficient of air percolation threshold[-]
q(7)        = mean(Data(1:12,12))/1.72/100; % Concentration of SOC [%]
q(8)        = 1.9;                     % Particle density [kg/m3]

SR_sim      = DAMM_model(x,p,q); 
end


