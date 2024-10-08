function [SSE] = calibration_DAMM(p)

% Calling Data
data        = load("data_manzoni_matlab.txt");

% Moisture Data
% x           = data(1:17,2); % Ayora.ES - Ambient
% x           = data(18:34,2);   % Ayora Drought
% x           = data(35:58,3); % GIG - Ambient
% x           = data(59:82,3); % GIG - Drought
% x           = data(83:106,3); % P12 - Ambient
% x           = data(107:130,3); % P12 - Drought
% x           = data(131:154,3); % P13 - Ambient
% x           = data(155:178,3); % P13 - Drought
% x           = data(179:196,3); % PNE_unburned - Ambient
% x           = data(197:214,3); % PNE_unburned - Drought
% x           = data(215:238,3); % Purdue.us - Ambient
% x           = data(239:262,3); % Purdue.us - Drought
% x           = data(263:292,3); % Sev.mix - Ambient
% x           = data(293:322,3); % Sev.mix - Drought
% x           = data(323:352,3); % baddrt.de - Ambient
% x           = data(353:381,3); % baddrt.de - Drought
% x           = data(382:399,3); % brhill.au - Ambient
% x           = data(400:417,3); % brhill.au - Drought
% x           = data(418:433,3); % brookdale.ca - Ambient
% x           = data(434:450,3); % brookdale.ca - Drought
% x           = data(451:469,3); % cedarsav.us - Ambient
% x           = data(470:484,3); % cedarsav.us - Drought
% x           = data(485:502,3); % cobar.au - Ambient
% x           = data(503:520,3); % cobar.au - Drought
% x           = data(521:535,3); % cowidrt.ca - Ambient
% x           = data(536:551,3); % cowidrt.ca - Drought
% x           = data(552:575,3); % dona.ana - Ambient
% x           = data(576:599,3); % dona.ana - Drought
% x           = data(600:616,3); % hoide.de - Ambient
% x           = data(617:632,3); % hoide.de - Drought
% x           = data(633:656,3); % horacg,cr - Ambient
% x           = data(657:680,3); % horacg,cr - Drought
% x           = data(681:694,3); % hyide.de - Ambient
% x           = data(695:707,3); % hyide.de - Drought
% x           = data(708:725,3); % lygra.no - Ambient
% x           = data(726:742,3); % lygra.no - Drought
% x           = data(743:760,3); % nyngan.au - Ambient
% x           = data(761:778,3); % nyngan.au - Drought
% x           = data(779:802,3); % passogavia.it - Ambient
% x           = data(803:826,3); % passogavia.it - Drought
% x           = data(827:838,3); % riomayo.ar - Ambient
% x           = data(839:852,3); % riomayo.ar - Drought
% x           = data(853:882,3); % scruzl.us - Ambient
% x           = data(883:912,3); % scruzl.us - Drought
% x           = data(913:936,3); % sgsdrt.us - Ambient
% x           = data(937:960,3); % sgsdrt.us - Drought
% x           = data(961:977,3); % skotsvar.no - Ambient
% x           = data(978:995,3); % skotsvar.no - Drought
% x           = data(996:1013,3); % ukulingadrt.za - Ambient
% x           = data(1014:1031,3); % ukulingadrt.za - Drought
% x           = data(1032:1049,3); % wayqe.re - Ambient
% x           = data(1050:1067,3); % wayqe.re - Drought

% Model  fixed parameters and model results
q(1)        = 1.008598957;                  % Bulk density [kg/m3] Ayora
q(2)        = 30.99430/100;                 % Clay content [%] Ayora
q(3)        = 1.5;                          % Cementation exponent
q(4)        = 2.5;                          % Saturation exponent
q(5)        = 0.2;                          % Empirical coefficient of water percolation threshold[-]
q(6)        = 0.1;                          % Empirical coefficient of air percolation threshold[-]
q(7)        = 0.0832;                       % Concentration of SOC [%] Ayora
q(8)        = 2.0375;                       % Particle density [kg/m3] Ayora
% rho_b       = q(1); % Bulk density [kg/m3]
% pd          = q(8); % Particle density [kg/m3]
% phi         = 1 - (rho_b/pd);
% x_1         = phi - x_1;

SR_sim      = DAMM_model(x,p,q); 

% max_f

% max_f       = max(data(1:17,4)); % Ayora.ES - Ambient - maximum respiration
% max_f       = max(data(18:34,4)); % Ayora.ES - Drought - maximum respiration
% max_f       = max(data(35:58,4)); % GIG - Ambient - maximum respiration
% max_f       = max(data(59:82,4)); % GIG - Drought - maximum respiration
% max_f       = max(data(83:106,4)); % P12 - Ambient - maximum respiration
% max_f       = max(data(107:130,4)); % P12 - Drought - maximum respiration
% max_f       = max(data(131:154,4)); % P13 - Ambient - maximum respiration
% max_f       = max(data(155:178,4)); % P13 - Drought - maximum respiration
% max_f       = max(data(179:196,4)); % PNE_unburned - Ambient - maximum respiration
% max_f       = max(data(197:214,4)); % PNE_unburned - Drought - maximum respiration
% max_f       = max(data(215:238,4)); % Purdue.us - Ambient - maximum respiration
% max_f       = max(data(239:262,4)); % Purdue.us - Drought - maximum respiration
% max_f       = max(data(263:292,4)); % Sev.mix - Drought - maximum respiration
% max_f       = max(data(293:322,4)); % Sev.mix - Drought - maximum respiration
% max_f       = max(data(323:352,4)); % baddrt.de - Ambient - maximum respiration
% max_f       = max(data(353:381,4)); % baddrt.de - Drought - maximum respiration
% max_f       = max(data(382:399,4)); % brhill.au - Ambient - maximum respiration
% max_f       = max(data(400:417,4)); % brhill.au - Drought - maximum respiration
% max_f       = max(data(418:433,4)); % brookdale.ca - Ambient - maximum respiration
% max_f       = max(data(434:450,4)); % brookdale.ca - Drought - maximum respiration
% max_f       = max(data(451:469,4)); % cedarsav.us - Ambient - maximum respiration
% max_f       = max(data(470:484,4)); % cedarsav.us - Drought - maximum respiration
% max_f       = max(data(485:502,4)); % cobar.au - Ambient - maximum respiration
% max_f       = max(data(503:520,4)); % cobar.au - Drought - maximum respiration
% max_f       = max(data(521:535,4)); % cowidrt.ca - Ambient - maximum respiration
% max_f       = max(data(536:551,4)); % cowidrt.ca - Drought - maximum respiration
% max_f       = max(data(552:575,4)); % dona.ana - Ambient - maximum respiration
% max_f       = max(data(576:599,4)); % dona.ana - Drought - maximum respiration
% max_f       = max(data(600:616,4)); % hoide.de - Ambient - maximum respiration
% max_f       = max(data(617:632,4)); % hoide.de - Drought - maximum respiration
% max_f       = max(data(633:656,4)); % horacg,cr - Ambient - maximum respiration
% max_f       = max(data(657:680,4)); % horacg,cr - Drought - maximum respiration
% max_f       = max(data(681:694,4)); % hyide.de - Ambient - maximum respiration
% max_f       = max(data(695:707,4)); % hyide.de - Drought - maximum respiration
% max_f       = max(data(708:725,4)); % lygra.no - Ambient - maximum respiration
% max_f       = max(data(726:742,4)); % lygra.no - Drought - maximum respiration
% max_f       = max(data(743:760,4)); % nyngan.au - Ambient - maximum respiration
% max_f       = max(data(761:778,4)); % nyngan.au - Drought - maximum respiration
% max_f       = max(data(779:802,4)); % passogavia.it - Ambient - maximum respiration
% max_f       = max(data(803:826,4)); % passogavia.it - Drought - maximum respiration
% max_f       = max(data(827:838,4)); % riomayo.ar - Ambient - maximum respiration
% max_f       = max(data(839:852,4)); % riomayo.ar - Drought - maximum respiration
% max_f       = max(data(853:882,4)); % scruzl.us - Ambient - maximum respiration
% max_f       = max(data(883:912,4)); % scruzl.us - Drought - maximum respiration
% max_f       = max(data(913:936,4)); % sgsdrt.us - Ambient - maximum respiration
% max_f       = max(data(937:960,4)); % sgsdrt.us - Drought - maximum respiration
% max_f       = max(data(961:977,4)); % skotsvar.no - Ambient - maximum respiration
% max_f       = max(data(978:995,4)); % skotsvar.no - Drought - maximum respiration
% max_f       = max(data(996:1013,4)); % ukulingadrt.za - Ambient - maximum respiration
% max_f       = max(data(1014:1031,4)); % ukulingadrt.za - Drought - maximum respiration
% max_f       = max(data(1032:1049,4)); % wayqe.re - Ambient - maximum respiration
% max_f       = max(data(1050:1067,4)); % wayqe.re - Drought - maximum respiration

% Observations
% SR_obs      = data(1:17,4)/max_f; % Ayora.ES - Ambient
% SR_obs      = data(18:34,4)/max_f; % Ayora.ES - Drought
% SR_obs      = data(35:58,4)/max_f; % GIG - Ambient
% SR_obs      = data(59:82,4)/max_f; % GIG - Drought
% SR_obs      = data(83:106,4)/max_f; % P12 - Ambient
% SR_obs      = data(107:130,4)/max_f; % P12 - Drought
% SR_obs      = data(131:154,4)/max_f; % P13 - Ambient
% SR_obs      = data(155:178,4)/max_f; % P13 - Drought
% SR_obs      = data(179:196,4)/max_f; % PNE_unburned - Ambient
% SR_obs      = data(197:214,4)/max_f; % PNE_unburned - Drought
% SR_obs      = data(215:238,4)/max_f; % Purdue.us - Ambient
% SR_obs      = data(239:262,4)/max_f; % Purdue.us - Drought
% SR_obs      = data(263:292,4)/max_f; % Sev.mix - Ambient
% SR_obs      = data(293:322,4)/max_f; % Sev.mix - Drought
% SR_obs      = data(323:352,4)/max_f; % baddrt.de - Ambient
% SR_obs      = data(353:381,4)/max_f; % baddrt.de - Drought
% SR_obs      = data(382:399,4)/max_f; % brhill.au - Ambient
% SR_obs      = data(400:417,4)/max_f; % brhill.au - Drought
% SR_obs      = data(418:433,4)/max_f; % brookdale.ca - Ambient
% SR_obs      = data(434:450,4)/max_f; % brookdale.ca - Drought
% SR_obs      = data(451:469,4)/max_f; % cedarsav.us - Ambient
% SR_obs      = data(470:484,4)/max_f; % cedarsav.us - Drought
% SR_obs      = data(485:502,4)/max_f; % cobar.au - Ambient
% SR_obs      = data(503:520,4)/max_f; % cobar.au - Drought
% SR_obs      = data(521:535,4)/max_f; % cowidrt.ca - Ambient
% SR_obs      = data(536:551,4)/max_f; % cowidrt.ca - Drought
% SR_obs      = data(552:575,4)/max_f; % dona.ana - Ambient
% SR_obs      = data(576:599,4)/max_f; % dona.ana - Drought
% SR_obs      = data(600:616,4)/max_f; % hoide.de - Ambient
% SR_obs      = data(617:632,4)/max_f; % hoide.de - Drought
% SR_obs      = data(633:656,4)/max_f; % horacg,cr - Ambient
% SR_obs      = data(657:680,4)/max_f; % horacg,cr - Drought
% SR_obs      = data(681:694,4)/max_f; % hyide.de - Ambient
% SR_obs      = data(695:707,4)/max_f; % hyide.de - Drought
% SR_obs      = data(708:725,4)/max_f; % lygra.no - Ambient
% SR_obs      = data(726:742,4)/max_f; % lygra.no - Drought
% SR_obs      = data(743:760,4)/max_f; % nyngan.au - Ambient
% SR_obs      = data(761:778,4)/max_f; % nyngan.au - Drought
% SR_obs      = data(779:802,4)/max_f; % passogavia.it - Ambient
% SR_obs      = data(803:826,4)/max_f; % passogavia.it - Drought
% SR_obs      = data(827:838,4)/max_f; % riomayo.ar - Ambient
% SR_obs      = data(839:852,4)/max_f; % riomayo.ar - Drought
% SR_obs      = data(853:882,4)/max_f; % scruzl.us - Ambient
% SR_obs      = data(883:912,4)/max_f; % scruzl.us - Drought
% SR_obs      = data(913:936,4)/max_f; % sgsdrt.us - Ambient
% SR_obs      = data(937:960,4)/max_f; % sgsdrt.us - Drought
% SR_obs      = data(961:977,4)/max_f; % skotsvar.no - Ambient
% SR_obs      = data(978:995,4)/max_f; % skotsvar.no - Drought
% SR_obs      = data(996:1013,4)/max_f; % ukulingadrt.za - Ambient
% SR_obs      = data(1014:1031,4)/max_f; % ukulingadrt.za - Drought
% SR_obs      = data(1032:1049,4)/max_f; % wayqe.re - Ambient
% SR_obs      = data(1050:1067,4)/max_f; % wayqe.re - Drought

% Standard deviations
% SR_sd      = data(1:17,5)/max_f; % Ayora.ES - Ambient
% SR_sd      = data(18:34,5)/max_f; % Ayora.ES - Drought
% SR_sd      = data(35:58,5)/max_f; % GIG - Ambient
% SR_sd      = data(59:82,5)/max_f; % GIG - Drought
% SR_sd      = data(83:106,5)/max_f; % P12 - Ambient
% SR_sd      = data(107:130,5)/max_f; % P12 - Drought
% SR_sd      = data(131:154,5)/max_f; % P13 - Ambient
% SR_sd      = data(155:178,5)/max_f; % P13 - Drought
% SR_sd      = data(179:196,5)/max_f; % PNE_unburned - Ambient
% SR_sd      = data(197:214,5)/max_f; % PNE_unburned - Drought
% SR_sd      = data(215:238,5)/max_f; % Purdue.us - Ambient
% SR_sd      = data(239:262,5)/max_f; % Purdue.us - Drought
% SR_sd      = data(263:292,5)/max_f; % Sev.mix - Ambient
% SR_sd      = data(293:322,5)/max_f; % Sev.mix - Drought
% SR_sd      = data(323:352,5)/max_f; % baddrt.de - Ambient
% SR_sd      = data(353:381,5)/max_f; % baddrt.de - Drought
% SR_sd      = data(382:399,5)/max_f; % brhill.au - Ambient
% SR_sd      = data(400:417,5)/max_f; % brhill.au - Drought
% SR_sd      = data(418:433,5)/max_f; % brookdale.ca - Ambient
% SR_sd      = data(434:450,5)/max_f; % brookdale.ca - Drought
% SR_sd      = data(451:469,5)/max_f; % cedarsav.us - Ambient
% SR_sd      = data(470:484,5)/max_f; % cedarsav.us - Drought
% SR_sd      = data(485:502,5)/max_f; % cobar.au - Ambient
% SR_sd      = data(503:520,5)/max_f; % cobar.au - Drought
% SR_sd      = data(521:535,5)/max_f; % cowidrt.ca - Ambient
% SR_sd      = data(536:551,5)/max_f; % cowidrt.ca - Drought
% SR_sd      = data(552:575,5)/max_f; % dona.ana - Ambient
% SR_sd      = data(576:599,5)/max_f; % dona.ana - Drought
% SR_sd      = data(600:616,5)/max_f; % hoide.de - Ambient
% SR_sd      = data(617:632,5)/max_f; % hoide.de - Drought
% SR_sd      = data(633:656,5)/max_f; % horacg,cr - Ambient
% SR_sd      = data(657:680,5)/max_f; % horacg,cr - Drought
% SR_sd      = data(681:694,5)/max_f; % hyide.de - Ambient
% SR_sd      = data(695:707,5)/max_f; % hyide.de - Drought
% SR_sd      = data(708:725,5)/max_f; % lygra.no - Ambient
% SR_sd      = data(726:742,5)/max_f; % lygra.no - Drought
% SR_sd      = data(743:760,5)/max_f; % nyngan.au - Ambient
% SR_sd      = data(761:778,5)/max_f; % nyngan.au - Drought
% SR_sd      = data(779:802,5)/max_f; % passogavia.it - Ambient
% SR_sd      = data(803:826,5)/max_f; % passogavia.it - Drought
% SR_sd      = data(827:838,5)/max_f; % riomayo.ar - Ambient
% SR_sd      = data(839:852,5)/max_f; % riomayo.ar - Drought
% SR_sd      = data(853:882,5)/max_f; % scruzl.us - Ambient
% SR_sd      = data(883:912,5)/max_f; % scruzl.us - Drought
% SR_sd      = data(913:936,5)/max_f; % sgsdrt.us - Ambient
% SR_sd      = data(937:960,5)/max_f; % sgsdrt.us - Drought
% SR_sd      = data(961:977,5)/max_f; % skotsvar.no - Ambient
% SR_sd      = data(978:995,5)/max_f; % skotsvar.no - Drought
% SR_sd      = data(996:1013,5)/max_f; % ukulingadrt.za - Ambient
% SR_sd      = data(1014:1031,5)/max_f; % ukulingadrt.za - Drought
% SR_sd      = data(1032:1049,5)/max_f; % wayqe.re - Ambient
% SR_sd      = data(1050:1067,5)/max_f; % wayqe.re - Drought

SSE_1       = sum(((SR_obs - SR_sim).^2)./(SR_sd).^2);
SSE         = SSE_1

plot(SR_obs,SR_sim,"o")

end