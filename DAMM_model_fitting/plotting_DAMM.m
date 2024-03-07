function [SR_sim] = plotting_DAMM(x,p,q)

Data        = load("DIGME_mean.2.txt");
% Model  fixed parameters and model results
q(3)        = 1.5;                          % Cementation exponent
q(4)        = 2.5;                          % Saturation exponent
q(5)        = 0.2;                          % Empirical coefficient of water percolation threshold[-]
q(6)        = 0.1;                          % Empirical coefficient of air percolation threshold[-]

SR_sim      = DAMM_model(x,p,q); 
end


