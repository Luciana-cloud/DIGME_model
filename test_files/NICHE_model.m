function [SR] = NICHE_model(x,p)

% X variable
theta = x;

% Parameters
R_max       = p(1);
theta_op    = p(2);
sigma       = p(3);
tau         = p(4);

% Function
SR = R_max .* exp(-((abs(theta-theta_op)./sigma)).^tau);

end