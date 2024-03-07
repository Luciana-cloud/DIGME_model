function [SSE] = calibration_NICHE(p)

% Calling Data
Data        = load("DIGME_mean.2.txt");

% Moisture Data
% x_1         = Data(1:6,2);    % Ayora Ambient
% x_1         = Data(7:12,2);   % Ayora Drought
% x_1         = Data(13:18,2);  % brhill Ambient
% x_1         = Data(19:24,2);  % brhill Drought
% x_1         = Data(25:30,2);  % brookdale Ambient
x_1         = Data(31:36,2);  % brookdale Drought

[SR_sim] = NICHE_model(x_1,p);

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
SR_obs      = Data(31:36,8);
SR_sd       = Data(31:36,9);

SSE_1       = (sum(((SR_obs-SR_sim)./SR_sd).^2))./length(SR_sim);
SSE         = SSE_1^0.5

plot(SR_obs,SR_sim,"o")

end