function [SSE] = calibration_vg(p)

% Calling Data

Data = load("WP_matlab.txt");
% x    = Data(1:6,4); % Ayora Water pontential [Bar]
% x    = Data(7:12,4); % GIG Water pontential [Bar]
% x    = Data(13:18,4); % P12 Water pontential [Bar]
% x    = Data(19:24,4); % P13 Water pontential [Bar]
% x    = Data(25:30,4); % PNE_unburned Water pontential [Bar]
% x    = Data(31:36,4); % Purdue.us Water pontential [Bar]
% x    = Data(37:42,4); % Sev.mix Water pontential [Bar]
% x    = Data(43:48,4); % baddrt.de Water pontential [Bar]
% x    = Data(49:53,4); % brhill.au Water pontential [Bar]
% x    = Data(55:60,4); % brookdale.ca Water pontential [Bar]
% x    = Data(61:66,4); % cedarsav.us Water pontential [Bar]
% x    = Data(67:72,4); % cobar.au Water pontential [Bar]
% x    = Data(73:78,4); % cowidrt.ca Water pontential [Bar]
% x    = Data(79:84,4); % dona.ana Water pontential [Bar]
% x    = Data(85:90,4); % hoide.de Water pontential [Bar]
% x    = Data(91:96,4); % horacg.cr Water pontential [Bar]
% x    = Data(97:102,4); % hyide.de Water pontential [Bar]
% x    = Data(103:108,4); % lygra.no Water pontential [Bar]
% x    = Data(109:114,4); % nyngan.au Water pontential [Bar]
% x    = Data(115:120,4); % passogavia.it Water pontential [Bar]
% x    = Data(121:126,4); % riomayo.ar Water pontential [Bar]
% x    = Data(127:132,4); % scruzl.us Water pontential [Bar]
% x    = Data(133:138,4); % sgsdrt.us Water pontential [Bar]
% x    = Data(139:142,4); % skotsvar.no Water pontential [Bar]
% x    = Data(145:150,4); % ukulingadrt.za Water pontential [Bar]
% x    = Data(151:153,4); % wayqe.re Water pontential [Bar]

% Constants

% q(1)   = Data(1,5); % Ayora Saturated soil moisture content [-]*
% q(2)   = Data(6,2); % Ayora Residual soil water content [-]
% q(1)   = Data(7,5); % GIG Saturated soil moisture content [-]*
% q(2)   = Data(12,2); % GIG Residual soil water content [-]
% q(1)   = Data(13,5); % P12 Saturated soil moisture content [-]*
% q(2)   = Data(18,2); % P12 Residual soil water content [-]
% q(1)   = Data(19,5); % P13 Saturated soil moisture content [-]*
% q(2)   = Data(24,2); % P13 Residual soil water content [-]
% q(1)   = Data(25,5); % PNE_unburned Saturated soil moisture content [-]*
% q(2)   = Data(30,2); % PNE_unburned Residual soil water content [-]
% q(1)   = Data(31,5); % Purdue.us Saturated soil moisture content [-]*
% q(2)   = Data(36,2); % Purdue.us Residual soil water content [-]
% q(1)   = Data(37,5); % Sev.mix Saturated soil moisture content [-]*
% q(2)   = Data(42,2); % Sev.mix Residual soil water content [-]
% q(1)   = Data(43,5); % baddrt.de Saturated soil moisture content [-]*
% q(2)   = Data(48,2); % baddrt.de Residual soil water content [-]
% q(1)   = Data(49,5); % brhill.au Saturated soil moisture content [-]*
% q(2)   = Data(53,2); % brhill.au Residual soil water content [-]
% q(1)   = Data(55,5); % brookdale.ca Saturated soil moisture content [-]*
% q(2)   = Data(60,2); % brookdale.ca Residual soil water content [-]
% q(1)   = Data(61,5); % cedarsav.us Saturated soil moisture content [-]*
% q(2)   = Data(66,2); % cedarsav.us Residual soil water content [-]
% q(1)   = Data(67,5); % cobar.au Saturated soil moisture content [-]
% q(2)   = Data(72,2); % cobar.au Residual soil water content [-]
% q(1)   = Data(73,5); % cowidrt.ca Saturated soil moisture content [-]*
% q(2)   = Data(78,2); % cowidrt.ca Residual soil water content [-]
% q(1)   = Data(79,5); % dona.ana Saturated soil moisture content [-]*
% q(2)   = Data(84,2); % dona.ana Residual soil water content [-]
% q(1)   = Data(85,5); % hoide.de Saturated soil moisture content [-]*
% q(2)   = Data(90,2); % hoide.de Residual soil water content [-]
% q(1)   = Data(91,5); % horacg.cr Saturated soil moisture content [-]*
% q(2)   = Data(96,2); % horacg.cr Residual soil water content [-]
% q(1)   = Data(97,5); % hyide.de Saturated soil moisture content [-]*
% q(2)   = Data(102,2); % hyide.de Residual soil water content [-]
% q(1)   = Data(103,5); % lygra.no Saturated soil moisture content [-]*
% q(2)   = Data(108,2); % lygra.no Residual soil water content [-]
% q(1)   = Data(109,5); % nyngan.au Saturated soil moisture content [-]*
% q(2)   = Data(114,2); % nyngan.au Residual soil water content [-]
% q(1)   = Data(115,5); % passogavia.it Saturated soil moisture content [-]*
% q(2)   = Data(120,2); % passogavia.it Residual soil water content [-]
% q(1)   = Data(121,5); % riomayo.ar Saturated soil moisture content [-]*
% q(2)   = Data(126,2); % riomayo.ar Residual soil water content [-]
% q(1)   = Data(127,5); % scruzl.us Saturated soil moisture content [-]*
% q(2)   = Data(132,2); % scruzl.us Residual soil water content [-]
% q(1)   = Data(133,5); % sgsdrt.us Saturated soil moisture content [-]*
% q(2)   = Data(138,2); % sgsdrt.us Residual soil water content [-]
% q(1)   = Data(139,5); % skotsvar.no Saturated soil moisture content [-]*
% q(2)   = Data(142,2); % skotsvar.no Residual soil water content [-]
% q(1)   = Data(145,5); % ukulingadrt.za Saturated soil moisture content [-]*
% q(2)   = Data(150,2); % ukulingadrt.za Residual soil water content [-]
% q(1)   = Data(151,5); % wayqe.re Saturated soil moisture content [-]*
% q(2)   = Data(153,2); % wayqe.re Residual soil water content [-]

q(2)   = 0; % Residual soil water content [-]*

% Simulations

WC_sim      = van_genuchten(x,p,q);

% Model Calibration

% WC_obs      = Data(1:6,2); % Ayora Water pontential (mean) [-]
% WC_sd       = Data(1:6,3); % Ayora Water pontential (sd) [-]
% WC_obs      = Data(7:12,2); % GIG Water pontential (mean) [-]
% WC_sd       = Data(7:12,3); % GIG Water pontential (sd) [-]
% WC_obs      = Data(13:18,2); % P12 Water pontential (mean) [-]
% WC_sd       = Data(13:18,3); % P12 Water pontential (sd) [-]
% WC_obs      = Data(19:24,2); % P13 Water pontential (mean) [-]
% WC_sd       = Data(19:24,3); % P13 Water pontential (sd) [-]
% WC_obs      = Data(25:30,2); % PNE_unburned Water pontential (mean) [-]
% WC_sd       = Data(25:30,3); % PNE_unburned Water pontential (sd) [-]
% WC_obs      = Data(31:36,2); % Purdue.us Water pontential (mean) [-]
% WC_sd       = Data(31:36,3); % Purdue.us Water pontential (sd) [-]
% WC_obs      = Data(37:42,2); % Sev.mix Water pontential (mean) [-]
% WC_sd       = Data(37:42,3); % Sev.mix Water pontential (sd) [-]
% WC_obs      = Data(43:48,2); % baddrt.de Water pontential (mean) [-]
% WC_sd       = Data(43:48,3); % baddrt.de Water pontential (sd) [-]
% WC_obs      = Data(49:53,2); % brhill.au Water pontential (mean) [-]
% WC_sd       = Data(49:53,3); % brhill.au Water pontential (sd) [-]
% WC_obs      = Data(55:60,2); % brookdale.ca Water pontential (mean) [-]
% WC_sd       = Data(55:60,3); % brookdale.ca Water pontential (sd) [-]
% WC_obs      = Data(61:66,2); % cedarsav.us Water pontential (mean) [-]
% WC_sd       = Data(61:66,3); % cedarsav.us Water pontential (sd) [-]
% WC_obs      = Data(67:72,2); % cobar.au Water pontential (mean) [-]
% WC_sd       = Data(67:72,3); % cobar.au Water pontential (sd) [-]
% WC_obs      = Data(73:78,2); % cowidrt.ca Water pontential (mean) [-]
% WC_sd       = Data(73:78,3); % cowidrt.ca Water pontential (sd) [-]
% WC_obs      = Data(79:84,2); % dona.ana Water pontential (mean) [-]
% WC_sd       = Data(79:84,3); % dona.ana Water pontential (sd) [-]
% WC_obs      = Data(85:90,2); % hoide.de Water pontential (mean) [-]
% WC_sd       = Data(85:90,3); % hoide.de Water pontential (sd) [-]
% WC_obs      = Data(91:96,2); % horacg.cr Water pontential (mean) [-]
% WC_sd       = Data(91:96,3); % horacg.cr Water pontential (sd) [-]
% WC_obs      = Data(97:102,2); % hyide.de Water pontential (mean) [-]
% WC_sd       = Data(97:102,3); % hyide.de Water pontential (sd) [-]
% WC_obs      = Data(103:108,2); % lygra.no Water pontential (mean) [-]
% WC_sd       = Data(103:108,3); % lygra.no Water pontential (sd) [-]
% WC_obs      = Data(109:114,2); % nyngan.au Water pontential (mean) [-]
% WC_sd       = Data(109:114,3); % nyngan.au Water pontential (sd) [-]
% WC_obs      = Data(115:120,2); % passogavia.it Water pontential (mean) [-]
% WC_sd       = Data(115:120,3); % passogavia.it Water pontential (sd) [-]
% WC_obs      = Data(121:126,2); % riomayo.ar Water pontential (mean) [-]
% WC_sd       = Data(121:126,3); % riomayo.ar Water pontential (sd) [-]
% WC_obs      = Data(127:132,2); % scruzl.us Water pontential (mean) [-]
% WC_sd       = Data(127:132,3); % scruzl.us Water pontential (sd) [-]
% WC_obs      = Data(133:138,2); % sgsdrt.us Water pontential (mean) [-]
% WC_sd       = Data(133:138,3); % sgsdrt.us Water pontential (sd) [-]
% WC_obs      = Data(139:142,2); % skotsvar.no Water pontential (mean) [-]
% WC_sd       = Data(139:142,3); % skotsvar.no Water pontential (sd) [-]
% WC_obs      = Data(145:150,2); % ukulingadrt.za Water pontential (mean) [-]
% WC_sd       = Data(145:150,3); % ukulingadrt.za Water pontential (sd) [-]
% WC_obs      = Data(151:153,2); % wayqe.re Water pontential (mean) [-]
% WC_sd       = Data(151:153,3); % wayqe.re Water pontential (sd) [-]

SSE_1       = (sum(((WC_obs-WC_sim)./WC_sd).^2))./length(WC_sim);

SSE         = SSE_1^0.5

scatter(WC_obs,WC_sim);

end