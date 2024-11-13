function [SSE] = calibration_manzoni_new_cal(p)

% Calling data
% 
data        = load("data_manzoni_matlab.txt");

% x           = data(1:18,3); % Ayora.ES - Ambient
% x           = data(19:36,3); % Ayora.ES - Drought
% x           = data(37:60,3); % GIG - Ambient
% x           = data(61:84,3); % GIG - Drought
% x           = data(85:108,3); % P12 - Ambient
% x           = data(109:132,3); % P12 - Drought
% x           = data(133:156,3); % P13 - Ambient
% x           = cat(1,data(157:163,3),data(165:180,3)); % P13 - Drought
% x           = data(181:198,3); % PNE_unburned - Ambient***
% x           = data(199:216,3); % PNE_unburned - Drought
% x           = data(217:240,3); % Purdue.us - Ambient
% x           = data(241:264,3); % Purdue.us - Drought
% x           = data(265:294,3); % Sev.mix - Ambient
% x           = data(295:324,3); % Sev.mix - Drought
% x           = data(325:354,3); % baddrt.de - Ambient
% x           = data(355:383,3); % baddrt.de - Drought
% x           = data(384:401,3); % brhill.au - Ambient
% x           = data(402:419,3); % brhill.au - Drought
% x           = data(420:437,3); % brookdale.ca - Ambient
% x           = data(438:455,3); % brookdale.ca - Drought
% x           = data(456:481,3); % cedarsav.us - Ambient
% x           = data(482:507,3); % cedarsav.us - Drought
% x           = data(508:524,3); % cobar.au - Ambient
% x           = data(525:541,3); % cobar.au - Drought
% x           = data(542:565,3); % cowidrt.ca - Ambient
% x           = data(566:589,3); % cowidrt.ca - Drought
% x           = data(590:612,3); % dona.ana - Ambient
% x           = data(613:636,3); % dona.ana - Drought
% x           = data(637:654,3); % hoide.de - Ambient
% x           = data(655:672,3); % hoide.de - Drought
% x           = data(673:696,3); % horacg,cr - Ambient
% x           = data(697:720,3); % horacg,cr - Drought
% x           = data(721:737,3); % hyide.de - Ambient
% x           = data(738:755,3); % hyide.de - Drought
% x           = data(756:773,3); % lygra.no - Ambient
% x           = data(774:791,3); % lygra.no - Drought
% x           = data(792:809,3); % nyngan.au - Ambient
% x           = data(810:827,3); % nyngan.au - Drought
% x           = data(828:851,3); % passogavia.it - Ambient
% x           = data(852:875,3); % passogavia.it - Drought
% x           = cat(1,data(876:884,3),data(886:890,3)); % riomayo.ar - Ambient
% x           = cat(1,data(891:899,3),data(901:907,3)); % riomayo.ar - Drought
% x           = data(908:937,3); % scruzl.us - Ambient
% x           = data(938:967,3); % scruzl.us - Drought
% x           = data(968:990,3); % sgsdrt.us - Ambient
% x           = data(991:1014,3); % sgsdrt.us - Drought
% x           = data(1015:1032,3); % skotsvar.no - Ambient
% x           = data(1033:1050,3); % skotsvar.no - Drought
% x           = data(1051:1068,3); % ukulingadrt.za - Ambient
% x           = data(1069:1086,3); % ukulingadrt.za - Drought
% x           = data(1087:1104,3); % wayqe.re - Ambient
x           = data(1105:1122,3); % wayqe.re - Drought

%% Field Capacity

a = load('C:\luciana_datos\UCI\Project_13 (DIGME)\DIGME_model\water_potential_fitting\calibrated_parameters\Ayora.mat');
a = load('C:\luciana_datos\UCI\Project_13 (DIGME)\DIGME_model\water_potential_fitting\calibrated_parameters\GIG.mat');
a = load('C:\luciana_datos\UCI\Project_13 (DIGME)\DIGME_model\water_potential_fitting\calibrated_parameters\P12.mat');
a = load('C:\luciana_datos\UCI\Project_13 (DIGME)\DIGME_model\water_potential_fitting\calibrated_parameters\P13.mat');
a = load('C:\luciana_datos\UCI\Project_13 (DIGME)\DIGME_model\water_potential_fitting\calibrated_parameters\PNE_unburned.mat');
a = load('C:\luciana_datos\UCI\Project_13 (DIGME)\DIGME_model\water_potential_fitting\calibrated_parameters\Purdue.us.mat');
a = load('C:\luciana_datos\UCI\Project_13 (DIGME)\DIGME_model\water_potential_fitting\calibrated_parameters\Sev.mix.mat');
a = load('C:\luciana_datos\UCI\Project_13 (DIGME)\DIGME_model\water_potential_fitting\calibrated_parameters\baddrt.de.mat');
a = load('C:\luciana_datos\UCI\Project_13 (DIGME)\DIGME_model\water_potential_fitting\calibrated_parameters\brhill.au.mat');
a = load('C:\luciana_datos\UCI\Project_13 (DIGME)\DIGME_model\water_potential_fitting\calibrated_parameters\brookdale.ca.mat');
a = load('C:\luciana_datos\UCI\Project_13 (DIGME)\DIGME_model\water_potential_fitting\calibrated_parameters\cedarsav.us.mat');
a = load('C:\luciana_datos\UCI\Project_13 (DIGME)\DIGME_model\water_potential_fitting\calibrated_parameters\cobar.au.mat');
a = load('C:\luciana_datos\UCI\Project_13 (DIGME)\DIGME_model\water_potential_fitting\calibrated_parameters\cowidrt.ca.mat');
a = load('C:\luciana_datos\UCI\Project_13 (DIGME)\DIGME_model\water_potential_fitting\calibrated_parameters\dona.ana.mat');
a = load('C:\luciana_datos\UCI\Project_13 (DIGME)\DIGME_model\water_potential_fitting\calibrated_parameters\hoide.de.mat');
a = load('C:\luciana_datos\UCI\Project_13 (DIGME)\DIGME_model\water_potential_fitting\calibrated_parameters\horacg.cr.mat');
a = load('C:\luciana_datos\UCI\Project_13 (DIGME)\DIGME_model\water_potential_fitting\calibrated_parameters\hyide.de.mat');
a = load('C:\luciana_datos\UCI\Project_13 (DIGME)\DIGME_model\water_potential_fitting\calibrated_parameters\lygra.no.mat');
a = load('C:\luciana_datos\UCI\Project_13 (DIGME)\DIGME_model\water_potential_fitting\calibrated_parameters\nyngan.au.mat');
a = load('C:\luciana_datos\UCI\Project_13 (DIGME)\DIGME_model\water_potential_fitting\calibrated_parameters\passogavia.it.mat');
a = load('C:\luciana_datos\UCI\Project_13 (DIGME)\DIGME_model\water_potential_fitting\calibrated_parameters\riomayo.ar.mat');
a = load('C:\luciana_datos\UCI\Project_13 (DIGME)\DIGME_model\water_potential_fitting\calibrated_parameters\scruzl.us.mat');
a = load('C:\luciana_datos\UCI\Project_13 (DIGME)\DIGME_model\water_potential_fitting\calibrated_parameters\sgsdrt.us.mat');
a = load('C:\luciana_datos\UCI\Project_13 (DIGME)\DIGME_model\water_potential_fitting\calibrated_parameters\skotsvar.no.mat');
a = load('C:\luciana_datos\UCI\Project_13 (DIGME)\DIGME_model\water_potential_fitting\calibrated_parameters\ukulingadrt.za.mat');
a = load('C:\luciana_datos\UCI\Project_13 (DIGME)\DIGME_model\water_potential_fitting\calibrated_parameters\wayqe.re.mat'); 

q(1) = 1/a.p(2);

%%
% Calling model
SR_sim      = manzoni_model_new(x,p,q);

% max_f       = max(data(1:18,4)); % Ayora.ES - Ambient - maximum respiration
% max_f       = max(data(19:36,4)); % Ayora.ES - Drought - maximum respiration
% max_f       = max(data(37:60,4)); % GIG - Ambient - maximum respiration
% max_f       = max(data(61:84,4)); % GIG - Drought - maximum respiration
% max_f       = max(data(85:108,4)); % P12 - Ambient - maximum respiration
% max_f       = max(data(109:132,4)); % P12 - Drought - maximum respiration
% max_f       = max(data(133:156,4)); % P13 - Ambient - maximum respiration
% max_f       = max(cat(1,data(157:163,4),data(165:180,4))); % P13 - Drought - maximum respiration
% max_f       = max(data(181:198,4)); % PNE_unburned - Ambient - maximum respiration
% max_f       = max(data(199:216,4)); % PNE_unburned - Drought - maximum respiration
% max_f       = max(data(217:240,4)); % Purdue.us - Ambient - maximum respiration
% max_f       = max(data(241:264,4)); % Purdue.us - Drought - maximum respiration
% max_f       = max(data(265:294,4)); % Sev.mix - Ambient - maximum respiration
% max_f       = max(data(295:324,4)); % Sev.mix - Drought - maximum respiration
% max_f       = max(data(325:354,4)); % baddrt.de - Ambient - maximum respiration
% max_f       = max(data(355:383,4)); % baddrt.de - Drought - maximum respiration
% max_f       = max(data(384:401,4)); % brhill.au - Ambient - maximum respiration
% max_f       = max(data(402:419,4)); % brhill.au - Drought - maximum respiration
% max_f       = max(data(420:437,4)); % brookdale.ca - Ambient - maximum respiration
% max_f       = max(data(438:455,4)); % brookdale.ca - Drought - maximum respiration
% max_f       = max(data(456:481,4)); % cedarsav.us - Ambient - maximum respiration
% max_f       = max(data(482:507,4)); % cedarsav.us - Drought - maximum respiration
% max_f       = max(data(508:524,4)); % cobar.au - Ambient - maximum respiration
% max_f       = max(data(525:541,4)); % cobar.au - Drought - maximum respiration
% max_f       = max(data(542:565,4)); % cowidrt.ca - Ambient - maximum respiration
% max_f       = max(data(566:589,4)); % cowidrt.ca - Drought - maximum respiration
% max_f       = max(data(590:612,4)); % dona.ana - Ambient - maximum respiration
% max_f       = max(data(613:636,4)); % dona.ana - Drought - maximum respiration
% max_f       = max(data(637:654,4)); % hoide.de - Ambient - maximum respiration
% max_f       = max(data(655:672,4)); % hoide.de - Drought - maximum respiration
% max_f       = max(data(673:696,4)); % horacg,cr - Ambient - maximum respiration
% max_f       = max(data(697:720,4)); % horacg,cr - Drought - maximum respiration
% max_f       = max(data(721:737,4)); % hyide.de - Ambient - maximum respiration
% max_f       = max(data(738:755,4)); % hyide.de - Drought - maximum respiration
% max_f       = max(data(756:773,4)); % lygra.no - Ambient - maximum respiration
% max_f       = max(data(774:791,4)); % lygra.no - Drought - maximum respiration
% max_f       = max(data(792:809,4)); % nyngan.au - Ambient - maximum respiration
% max_f       = max(data(810:827,4)); % nyngan.au - Drought - maximum respiration
% max_f       = max(data(828:851,4)); % passogavia.it - Ambient - maximum respiration
% max_f       = max(data(852:875,4)); % passogavia.it - Drought - maximum respiration
% max_f       = max(cat(1,data(876:884,4),data(886:890,4))); % riomayo.ar - Ambient - maximum respiration
% max_f       = max(cat(1,data(891:899,4),data(901:907,4))); % riomayo.ar - Drought - maximum respiration
% max_f       = max(data(908:937,4)); % scruzl.us - Ambient - maximum respiration
% max_f       = max(data(938:967,4)); % scruzl.us - Drought - maximum respiration
% max_f       = max(data(968:990,4)); % sgsdrt.us - Ambient - maximum respiration
% max_f       = max(data(991:1014,4)); % sgsdrt.us - Drought - maximum respiration
% max_f       = max(data(1015:1032,4)); % skotsvar.no - Ambient - maximum respiration
% max_f       = max(data(1033:1050,4)); % skotsvar.no - Drought - maximum respiration
% max_f       = max(data(1051:1068,4)); % ukulingadrt.za - Ambient - maximum respiration
% max_f       = max(data(1069:1086,4)); % ukulingadrt.za - Drought - maximum respiration
% max_f       = max(data(1087:1104,4)); % wayqe.re - Ambient - maximum respiration
max_f       = max(data(1105:1122,4)); % wayqe.re - Drought - maximum respiration

% Observations
% SR_obs      = data(1:18,4)/max_f; % Ayora.ES - Ambient
% SR_obs      = data(19:36,4)/max_f; % Ayora.ES - Drought
% SR_obs      = data(37:60,4)/max_f; % GIG - Ambient
% SR_obs      = data(61:84,4)/max_f; % GIG - Drought
% SR_obs      = data(85:108,4)/max_f; % P12 - Ambient
% SR_obs      = data(109:132,4)/max_f; % P12 - Drought
% SR_obs      = data(133:156,4)/max_f; % P13 - Ambient
% SR_obs      = cat(1,data(157:163,4),data(165:180,4))/max_f; % P13 - Drought
% SR_obs      = data(181:198,4)/max_f; % PNE_unburned - Ambient
% SR_obs      = data(199:216,4)/max_f; % PNE_unburned - Drought
% SR_obs      = data(217:240,4)/max_f; % Purdue.us - Ambient
% SR_obs      = data(241:264,4)/max_f; % Purdue.us - Drought
% SR_obs      = data(265:294,4)/max_f; % Sev.mix - Ambient
% SR_obs      = data(295:324,4)/max_f; % Sev.mix - Drought
% SR_obs      = data(325:354,4)/max_f; % baddrt.de - Ambient
% SR_obs      = data(355:383,4)/max_f; % baddrt.de - Drought
% SR_obs      = data(384:401,4)/max_f; % brhill.au - Ambient
% SR_obs      = data(402:419,4)/max_f; % brhill.au - Drought
% SR_obs      = data(420:437,4)/max_f; % brookdale.ca - Ambient
% SR_obs      = data(438:455,4)/max_f; % brookdale.ca - Drought
% SR_obs      = data(456:481,4)/max_f; % cedarsav.us - Ambient
% SR_obs      = data(482:507,4)/max_f; % cedarsav.us - Drought
% SR_obs      = data(508:524,4)/max_f; % cobar.au - Ambient
% SR_obs      = data(525:541,4)/max_f; % cobar.au - Drought
% SR_obs      = data(542:565,4)/max_f; % cowidrt.ca - Ambient
% SR_obs      = data(566:589,4)/max_f; % cowidrt.ca - Drought
% SR_obs      = data(590:612,4)/max_f; % dona.ana - Ambient
% SR_obs      = data(613:636,4)/max_f; % dona.ana - Drought
% SR_obs      = data(637:654,4)/max_f; % hoide.de - Ambient
% SR_obs      = data(655:672,4)/max_f; % hoide.de - Drought
% SR_obs      = data(673:696,4)/max_f; % horacg,cr - Ambient
% SR_obs      = data(697:720,4)/max_f; % horacg,cr - Drought
% SR_obs      = data(721:737,4)/max_f; % hyide.de - Ambient
% SR_obs      = data(738:755,4)/max_f; % hyide.de - Drought
% SR_obs      = data(756:773,4)/max_f; % lygra.no - Ambient
% SR_obs      = data(774:791,4)/max_f; % lygra.no - Drought
% SR_obs      = data(792:809,4)/max_f; % nyngan.au - Ambient
% SR_obs      = data(810:827,4)/max_f; % nyngan.au - Drought
% SR_obs      = data(828:851,4)/max_f; % passogavia.it - Ambient
% SR_obs      = data(852:875,4)/max_f; % passogavia.it - Drought
% SR_obs      = cat(1,data(876:884,4),data(886:890,4))/max_f; % riomayo.ar - Ambient
% SR_obs      = cat(1,data(891:899,4),data(901:907,4))/max_f; % riomayo.ar - Drought
% SR_obs      = data(908:937,4)/max_f; % scruzl.us - Ambient
% SR_obs      = data(938:967,4)/max_f; % scruzl.us - Drought
% SR_obs      = data(968:990,4)/max_f; % sgsdrt.us - Ambient
% SR_obs      = data(991:1014,4)/max_f; % sgsdrt.us - Drought
% SR_obs      = data(1015:1032,4)/max_f; % skotsvar.no - Ambient
% SR_obs      = data(1033:1050,4)/max_f; % skotsvar.no - Drought
% SR_obs      = data(1051:1068,4)/max_f; % ukulingadrt.za - Ambient
% SR_obs      = data(1069:1086,4)/max_f; % ukulingadrt.za - Drought
% SR_obs      = data(1087:1104,4)/max_f; % wayqe.re - Ambient
SR_obs      = data(1105:1122,4)/max_f; % wayqe.re - Drought

% Standard deviations
% SR_sd      = data(1:18,5)/max_f; % Ayora.ES - Ambient
% SR_sd      = data(19:36,5)/max_f; % Ayora.ES - Drought
% SR_sd      = data(37:60,5)/max_f; % GIG - Ambient
% SR_sd      = data(61:84,5)/max_f; % GIG - Drought
% SR_sd      = data(85:108,5)/max_f; % P12 - Ambient
% SR_sd      = data(109:132,5)/max_f; % P12 - Drought
% SR_sd      = data(133:156,5)/max_f; % P13 - Ambient
% SR_sd      = cat(1,data(157:163,5),data(165:180,5))/max_f; % P13 - Drought
% SR_sd      = data(181:198,5)/max_f; % PNE_unburned - Ambient
% SR_sd      = data(199:216,5)/max_f; % PNE_unburned - Drought
% SR_sd      = data(217:240,5)/max_f; % Purdue.us - Ambient
% SR_sd      = data(241:264,5)/max_f; % Purdue.us - Drought
% SR_sd      = data(265:294,5)/max_f; % Sev.mix - Ambient
% SR_sd      = data(295:324,5)/max_f; % Sev.mix - Drought
% SR_sd      = data(325:354,5)/max_f; % baddrt.de - Ambient
% SR_sd      = data(355:383,5)/max_f; % baddrt.de - Drought
% SR_sd      = data(384:401,5)/max_f; % brhill.au - Ambient
% SR_sd      = data(402:419,5)/max_f; % brhill.au - Drought
% SR_sd      = data(420:437,5)/max_f; % brookdale.ca - Ambient
% SR_sd      = data(438:455,5)/max_f; % brookdale.ca - Drought
% SR_sd      = data(456:481,5)/max_f; % cedarsav.us - Ambient
% SR_sd      = data(482:507,5)/max_f; % cedarsav.us - Drought
% SR_sd      = data(508:524,5)/max_f; % cobar.au - Ambient
% SR_sd      = data(525:541,5)/max_f; % cobar.au - Drought
% SR_sd      = data(542:565,5)/max_f; % cowidrt.ca - Ambient
% SR_sd      = data(566:589,5)/max_f; % cowidrt.ca - Drought
% SR_sd      = data(590:612,5)/max_f; % dona.ana - Ambient
% SR_sd      = data(613:636,5)/max_f; % dona.ana - Drought
% SR_sd      = data(637:654,5)/max_f; % hoide.de - Ambient
% SR_sd      = data(655:672,5)/max_f; % hoide.de - Drought
% SR_sd      = data(673:696,5)/max_f; % horacg,cr - Ambient
% SR_sd      = data(697:720,5)/max_f; % horacg,cr - Drought
% SR_sd      = data(721:737,5)/max_f; % hyide.de - Ambient
% SR_sd      = data(738:755,5)/max_f; % hyide.de - Drought
% SR_sd      = data(756:773,5)/max_f; % lygra.no - Ambient
% SR_sd      = data(774:791,5)/max_f; % lygra.no - Drought
% SR_sd      = data(792:809,5)/max_f; % nyngan.au - Ambient
% SR_sd      = data(810:827,5)/max_f; % nyngan.au - Drought
% SR_sd      = data(828:851,5)/max_f; % passogavia.it - Ambient
% SR_sd      = data(852:875,5)/max_f; % passogavia.it - Drought
% SR_sd      = cat(1,data(876:884,5),data(886:890,5))/max_f; % riomayo.ar - Ambient
% SR_sd      = cat(1,data(891:899,5),data(901:907,5))/max_f; % riomayo.ar - Drought
% SR_sd      = data(908:937,5)/max_f; % scruzl.us - Ambient
% SR_sd      = data(938:967,5)/max_f; % scruzl.us - Drought
% SR_sd      = data(968:990,5)/max_f; % sgsdrt.us - Ambient
% SR_sd      = data(991:1014,5)/max_f; % sgsdrt.us - Drought
% SR_sd      = data(1015:1032,5)/max_f; % skotsvar.no - Ambient
% SR_sd      = data(1033:1050,5)/max_f; % skotsvar.no - Drought
% SR_sd      = data(1051:1068,5)/max_f; % ukulingadrt.za - Ambient
% SR_sd      = data(1069:1086,5)/max_f; % ukulingadrt.za - Drought
% SR_sd      = data(1087:1104,5)/max_f; % wayqe.re - Ambient
SR_sd      = data(1105:1122,5)/max_f; % wayqe.re - Drought

%%
% Objective function - residual sum of squares
SSE_1       = sum(((log(SR_obs) - log(SR_sim)).^2)./(log(SR_sd)).^2);
% SSE         = SSE_1^0.5
SSE         = SSE_1

% fig = figure;
plot(log10(x),SR_sim,"*");
hold on
plot(log10(x),SR_obs,"o");
xline(log10(q(1)),'-r');
xline(p(1),'-b');

% fig = figure;
% scatter(SR_obs,SR_sim)
end