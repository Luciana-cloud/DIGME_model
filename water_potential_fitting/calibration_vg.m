function [SSE] = calibration_vg(p)

% Calling Data

% Data        = load("water_pontential_conversion.txt");
% x           = Data(1:6,3);        % Rio Mayo Ambient
% x           = Data(7:12,3);       % Rio Mayo Drought
% x           = Data(13:18,3);      % Scruzl.us_A_1_10 Ambient
% x           = Data(19:24,3);      % Scruzl.us_A_1_10 Drought
% x           = Data(25:30,3);      % Brhill.au_A_1_7 Ambient
% x           = Data(31:36,3);      % Brhill.au_A_1_7 Drought
% x           = Data(37:42,3);      % Cobar.au_A_1_8 Ambient
% x           = Data(43:48,3);      % Cobar.au_A_1_8 Drought
% x           = Data(49:54,3);      % Badlauch_A_5_7 Ambient
% x           = Data(55:60,3);      % Badlauch_A_5_7 Drought
% x           = Data(61:66,3);      % Savann_CC_A_5_7 Ambient
% x           = Data(67:72,3);      % Savann_CC_A_5_7 Drought
% x           = Data(73:78,3);      % Ayora.es_A_1_7 Ambient
% x           = Data(79:84,3);      % Ayora.es_A_1_7 Drought
% x           = Data(85:90,3);      % Brookdale_A_3_7 Ambient
% x           = Data(91:96,3);      % Brookdale_A_3_7 Drought
% x           = Data(97:102,3);     % Hoide.de_A_1_7 Ambient
% x           = Data(103:108,3);    % Hoide.de_A_1_7 Drought
% x           = Data(109:114,3);    % Lygra.no_A_2_7 Ambient
% x           = Data(115:120,3);    % Lygra.no_A_2_7 Drought
% x           = Data(121:126,3);    % P12_A_1C_7 Ambient
% x           = Data(127:132,3);    % P12_A_1C_7 Drought

% Data        = load("water_pontential_trt_level.txt");
% x           = Data(1:6,2);          % Passogavia Ambient
% x           = Data(7:12,2);         % Passogavia Drought
% x           = Data(13:18,2);        % Dona Ana Ambient
% x           = Data(19:24,2);        % Dona Ana Drought
% x           = Data(25:30,2);        % Purdue Ambient
% x           = Data(31:36,2);        % Purdue Drought
% x           = Data(37:42,2);        % SGS US Ambient
% x           = Data(43:48,2);        % SGS US Drought
% x           = Data(49:54,2);        % Sev.Mix US Ambient
% x           = Data(55:60,2);        % Sev.Mix US Drought
% x           = Data(61:66,2);        % Horacg Costa Rica US Ambient
% x           = Data(67:72,2);        % Horacg Costa Rica US Drought
% x           = Data(73:78,2);        % PNE Brazil Ambient
% x           = Data(79:84,2);        % PNE Brazil Drought
% x           = Data(85:90,2);        % Ukulinga, ZA Ambient
% x           = Data(91:96,2);        % Ukulinga, ZA Drought
% x           = Data(97:99,2);        % Waqecha, PE Ambient
% x           = Data(100:102,2);      % Waqecha, PE Drought

% Data        = load("water_pontential_conversion_obs.txt");
% x           = Data(1:6,3);        % nyngan.au Ambient
% x           = Data(7:12,3);       % nyngan.au Drought
% x           = Data(13:18,3);      % cowidrt.ca Ambient
% x           = Data(19:24,3);      % cowidrt.ca Drought
% x           = Data(25:30,3);      % hyide.de Ambient
% x           = Data(31:36,3);      % hyide.de Drought
% x           = Data(37:40,3);      % skotsvar.no Ambient
% x           = Data(41:44,3);      % skotsvar.no Drought
% x           = Data(45:50,3);      % GIG_A_7C_7 Ambient
% x           = Data(51:56,3);      % GIG_A_7C_7 Drought
% x           = Data(57:62,3);      % P13_A_7C_7 Ambient
% x           = Data(63:68,3);      % P13_A_7C_7 Drought
% x           = Data(69:74,3);      % laschilcas.ar Ambient
% x           = Data(75:80,3);      % laschilcas.ar Drought

% Parameters

% p(1) = 0.01; % Residual soil water content (theta_r) [g/g]
% p(2) = 0.5;  % Saturated soil moisture content (theta_s) [g/g]
% p(3) = 1.5;  % Curve shape parameters (n) [-]
% p(4) = 0.05; % Scaling parameter (alpha) [1/KPa]   

% Simulations

WC_sim      = van_genuchten(x,p);

% Model Calibration

% Rio Mayo ambient
% WC_obs      = Data(1:6,1);
% WC_sd       = Data(1:6,2);
% Rio Mayo drought
% WC_obs      = Data(7:12,1);
% WC_sd       = Data(7:12,2);
% Scruzl.us_A_1_10 ambient
% WC_obs      = Data(13:18,1);
% WC_sd       = Data(13:18,2);
% Scruzl.us_A_1_10 drought
% WC_obs      = Data(19:24,1);
% WC_sd       = Data(19:24,2);
% Brhill.au_A_1_7 ambient
% WC_obs      = Data(25:30,1);
% WC_sd       = Data(25:30,2);
% Brhill.au_A_1_7 drought
% WC_obs      = Data(31:36,1);
% WC_sd       = Data(31:36,2);
% Cobar.au_A_1_8 ambient
% WC_obs      = Data(37:42,1);
% WC_sd       = Data(37:42,2);
% Cobar.au_A_1_8 drought
% WC_obs      = Data(43:48,1);
% WC_sd       = Data(43:48,2);
% Badlauch_A_5_7 ambient
% WC_obs      = Data(49:54,1);
% WC_sd       = Data(49:54,2);
% Badlauch_A_5_7 drought
% WC_obs      = Data(55:60,1);
% WC_sd       = Data(55:60,2);
% Savann_CC_A_5_7 ambient
% WC_obs      = Data(61:66,1);
% WC_sd       = Data(61:66,2);
% Savann_CC_A_5_7 drought
% WC_obs      = Data(67:72,1);
% WC_sd       = Data(67:72,2);
% Ayora.es_A_1_7 ambient
% WC_obs      = Data(73:78,1);
% WC_sd       = Data(73:78,2);
% Ayora.es_A_1_7 drought
% WC_obs      = Data(79:84,1);
% WC_sd       = Data(79:84,2);
% Brookdale_A_3_7 ambient
% WC_obs      = Data(85:90,1);
% WC_sd       = Data(85:90,2);
% Brookdale_A_3_7 drought
% WC_obs      = Data(91:96,1);
% WC_sd       = Data(91:96,2);
% Hoide.de_A_1_7 ambient
% WC_obs      = Data(97:102,1);
% WC_sd       = Data(97:102,2);
% Hoide.de_A_1_7 drought
% WC_obs      = Data(103:108,1);
% WC_sd       = Data(103:108,2);
% Lygra.no_A_2_7 ambient
% WC_obs      = Data(109:114,1);
% WC_sd       = Data(109:114,2);
% Lygra.no_A_2_7 drought
% % WC_obs      = Data(115:120,1);
% % WC_sd       = Data(115:120,2);
% P12_A_1C_7 ambient
% WC_obs      = Data(121:126,1);
% WC_sd       = Data(121:126,2);
% P12_A_1C_7 drought
% WC_obs      = Data(127:132,1);
% WC_sd       = Data(127:132,2);

% Observations with some concerns
% nyngan.au ambient
% WC_obs      = Data(1:6,1);
% WC_sd       = Data(1:6,2);
% nyngan.au drought
% WC_obs      = Data(7:12,1);
% WC_sd       = Data(7:12,2);
% cowidrt.ca ambient
% WC_obs      = Data(13:18,1);
% WC_sd       = Data(13:18,2);
% cowidrt.ca drought
% WC_obs      = Data(19:24,1);
% WC_sd       = Data(19:24,2);
% hyide.de ambient
% WC_obs      = Data(25:30,1);
% WC_sd       = Data(25:30,2);
% hyide.de drought
% WC_obs      = Data(31:36,1);
% WC_sd       = Data(31:36,2);
% skotsvar.no ambient
% WC_obs      = Data(37:40,1);
% WC_sd       = Data(37:40,2);
% skotsvar.no drought
% WC_obs      = Data(41:44,1);
% WC_sd       = Data(41:44,2);
% GIG_A_7C_7 ambient
% WC_obs      = Data(45:50,1);
% WC_sd       = Data(45:50,2);
% GIG_A_7C_7 drought
% WC_obs      = Data(51:56,1);
% WC_sd       = Data(51:56,2);
% P13_A_7C_7 ambient
% WC_obs      = Data(57:62,1);
% WC_sd       = Data(57:62,2);
% P13_A_7C_7 drought
% WC_obs      = Data(63:68,1);
% WC_sd       = Data(63:68,2);
% laschilcas.ar ambient
% WC_obs      = Data(69:74,1);
% WC_sd       = Data(69:74,2);
% laschilcas.ar drought
% WC_obs      = Data(75:80,1);
% WC_sd       = Data(75:80,2);

% SSE_1       = (sum(((WC_obs-WC_sim)./WC_sd).^2))./length(WC_sim);

% WC_obs           = Data(1:6,1);          % Passogavia Ambient
% WC_obs           = Data(7:12,1);         % Passogavia Drought
% WC_obs           = Data(13:18,1);        % Dona Ana Ambient
% WC_obs           = Data(19:24,1);        % Dona Ana Drought
% WC_obs           = Data(25:30,1);        % Purdue Ambient
% WC_obs           = Data(31:36,1);        % Purdue Drought
% WC_obs           = Data(37:42,1);        % SGS US Ambient
% WC_obs           = Data(43:48,1);        % SGS US Drought
% WC_obs           = Data(49:54,1);        % Sev.Mix US Ambient
% WC_obs           = Data(55:60,1);        % Sev.Mix US Drought
% WC_obs           = Data(61:66,1);        % Horacg Costa Rica US Ambient
% WC_obs           = Data(67:72,1);        % Horacg Costa Rica US Drought
% WC_obs           = Data(73:78,1);        % PNE Brazil Ambient
% WC_obs           = Data(79:84,1);        % PNE Brazil Drought
% WC_obs           = Data(85:90,1);        % Ukulinga, ZA Ambient
% WC_obs           = Data(91:96,1);        % Ukulinga, ZA Drought
% WC_obs           = Data(97:99,1);        % Waqecha, PE Ambient
% WC_obs           = Data(100:102,1);      % Waqecha, PE Drought

% SSE_1       = (sum(((WC_obs-WC_sim)).^2))./length(WC_sim);

SSE         = SSE_1^0.5

scatter(WC_obs,WC_sim);

end