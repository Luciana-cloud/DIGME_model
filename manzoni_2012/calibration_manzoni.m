function [SSE] = calibration_manzoni(p)

% Calling data

data        = load("data_manzoni_matlab.txt");

% x           = data(1:17,3); % Ayora.ES - Ambient
% x           = data(18:34,3); % Ayora.ES - Drought
% x           = data(35:58,3); % GIG - Ambient
% x           = data(59:82,3); % GIG - Drought
% x           = data(83:106,3); % P12 - Ambient
% x           = data(107:130,3); % P12 - Drought
% x           = data(131:154,3); % P13 - Ambient
% x           = data(155:178,3); % P13 - Drought
% x           = cat(1,data([179:183],3),data([185:196],3)); % PNE_unburned - Ambient
% x           = cat(1,data([197:207],3),data([209:214],3)); % PNE_unburned - Drought
% x           = data(215:238,3); % Purdue.us - Ambient
% x           = data(239:262,3); % Purdue.us - Drought
% x           = cat(1,data([263,269,271,273,275,276,285,288,289],3),data([265:267],3), ...
%     data([291:292],3)); % Sev.mix - Ambient
% x           = data([293,295,297,301,302,304,308,309,312,313,316,318,319,320],3); % Sev.mix - Drought
% x           = data(323:352,3); % baddrt.de - Ambient
% x           = data(353:381,3); % baddrt.de - Drought
% x           = data(382:399,3); % brhill.au - Ambient
% x           = data(400:417,3); % brhill.au - Drought
% x           = data(418:433,3); % brookdale.ca - Ambient
% x           = data(434:450,3); % brookdale.ca - Drought
% x           = data(451:479,3); % cedarsav.us - Ambient
% x           = cat(1,data([480:492],3),data([494:508],3)); % cedarsav.us - Drought
% x           = data(509:526,3); % cobar.au - Ambient
% x           = data(527:544,3); % cobar.au - Drought
% x           = data(545:559,3); % cowidrt.ca - Ambient
% x           = data(560:575,3); % cowidrt.ca - Drought
% x           = cat(1,data([578,579,596,597],3),data([581:584],3),data([591:594],3)); % dona.ana - Ambient
% x           = cat(1,data([602,608,610,614],3),data([604:606],3),data([616:620],3)); % dona.ana - Drought
% x           = data(624:640,3); % hoide.de - Ambient
% x           = data(641:656,3); % hoide.de - Drought
% x           = data(657:680,3); % horacg,cr - Ambient
% x           = data(681:704,3); % horacg,cr - Drought
% x           = cat(1,data([707,709,713,716],3)); % hyide.de - Ambient
% x           = cat(1,data([719,721,722,725,727,728,730,731],3)); % hyide.de - Drought
% x           = data(732:749,3); % lygra.no - Ambient
% x           = data(750:766,3); % lygra.no - Drought
% x           = data(767:784,3); % nyngan.au - Ambient
% x           = data(785:802,3); % nyngan.au - Drought
% x           = data(803:826,3); % passogavia.it - Ambient
% x           = data(827:850,3); % passogavia.it - Drought
% x           = cat(1,data([853,854,856,857,860,861,862],3)); % riomayo.ar - Ambient
% x           = cat(1,data([863:865,867:872,875:876],3)); % riomayo.ar - Drought
% x           = cat(1,data([878:885,887,889,891,893:896,898:901,904,906],3)); % scruzl.us - Ambient
% x           = cat(1,data([907:910,912,913,915,916,918,919,921,922,924:928,932,936],3)); % scruzl.us - Drought
% x           = data(937:960,3); % sgsdrt.us - Ambient
% x           = data(961:984,3); % sgsdrt.us - Drought
% x           = data(985:1001,3); % skotsvar.no - Ambient
% x           = data(1002:1019,3); % skotsvar.no - Drought
% x           = data(1020:1037,3); % ukulingadrt.za - Ambient
% x           = data(1038:1055,3); % ukulingadrt.za - Drought
% x           = data(1056:1073,3); % wayqe.re - Ambient
% x           = data(1074:1091,3); % wayqe.re - Drought

% Calling model
SR_sim      = manzoni_model(x,p);
% max_f       = max(data(1:17,4)); % Ayora.ES - Ambient - maximum respiration
% max_f       = max(data(18:34,4)); % Ayora.ES - Drought - maximum respiration
% max_f       = max(data(35:58,4)); % GIG - Ambient - maximum respiration
% max_f       = max(data(59:82,4)); % GIG - Drought - maximum respiration
% max_f       = max(data(83:106,4)); % P12 - Ambient - maximum respiration
% max_f       = max(data(107:130,4)); % P12 - Drought - maximum respiration
% max_f       = max(data(131:154,4)); % P13 - Ambient - maximum respiration
% max_f       = max(data(155:178,4)); % P13 - Drought - maximum respiration
% max_f       = max(cat(1,data([179:183],4),data([185:196],4))); % PNE_unburned - Ambient - maximum respiration
% max_f       = max(cat(1,data([197:207],4),data([209:214],4))); % PNE_unburned - Drought - maximum respiration
% max_f       = max(data(215:238,4)); % Purdue.us - Ambient - maximum respiration
% max_f       = max(data(239:262,4)); % Purdue.us - Drought - maximum respiration
% max_f       = max(cat(1,data([263,269,271,273,275,276,285,288,289],4),data([265:267],4), ...
    % data([291:292],4))); % Sev.mix - Drought - maximum respiration
% max_f       = max(data([293,295,297,301,302,304,308,309,312,313,316,318,319,320],4)); % Sev.mix - Drought - maximum respiration
% max_f       = max(data(323:352,4)); % baddrt.de - Ambient - maximum respiration
% max_f       = max(data(353:381,4)); % baddrt.de - Drought - maximum respiration
% max_f       = max(data(382:399,4)); % brhill.au - Ambient - maximum respiration
% max_f       = max(data(400:417,4)); % brhill.au - Drought - maximum respiration
% max_f       = max(data(418:433,4)); % brookdale.ca - Ambient - maximum respiration
% max_f       = max(data(434:450,4)); % brookdale.ca - Drought - maximum respiration
% max_f       = max(data(451:479,4)); % cedarsav.us - Ambient - maximum respiration
% max_f       = max(cat(1,data([480:492],4),data([494:508],4))); % cedarsav.us - Drought - maximum respiration
% max_f       = max(data(509:526,4)); % cobar.au - Ambient - maximum respiration
% max_f       = max(data(527:544,4)); % cobar.au - Drought - maximum respiration
% max_f       = max(data(545:559,4)); % cowidrt.ca - Ambient - maximum respiration
% max_f       = max(data(560:575,4)); % cowidrt.ca - Drought - maximum respiration
% max_f       = max(cat(1,data([578,579,596,597],4),data([581:584],4),data([591:594],4))); % dona.ana - Ambient - maximum respiration
% max_f       = max(cat(1,data([602,608,610,614],4),data([604:606],4),data([616:620],4))); % dona.ana - Drought - maximum respiration
% max_f       = max(data(624:640,4)); % hoide.de - Ambient - maximum respiration
% max_f       = max(data(641:656,4)); % hoide.de - Drought - maximum respiration
% max_f       = max(data(657:680,4)); % horacg,cr - Ambient - maximum respiration
% max_f       = max(data(681:704,4)); % horacg,cr - Drought - maximum respiration
% max_f       = max(cat(1,data([707,709,713,716],4))); % hyide.de - Ambient - maximum respiration
% max_f       = max(cat(1,data([719,721,722,725,727,728,730,731],4))); % hyide.de - Drought - maximum respiration
% max_f       = max(data(732:749,4)); % lygra.no - Ambient - maximum respiration
% max_f       = max(data(750:766,4)); % lygra.no - Drought - maximum respiration
% max_f       = max(data(767:784,4)); % nyngan.au - Ambient - maximum respiration
% max_f       = max(data(785:802,4)); % nyngan.au - Drought - maximum respiration
% max_f       = max(data(803:826,4)); % passogavia.it - Ambient - maximum respiration
% max_f       = max(data(827:850,4)); % passogavia.it - Drought - maximum respiration
% max_f       = max(cat(1,data([853,854,856,857,860,861,862],4))); % riomayo.ar - Ambient - maximum respiration
% max_f       = max(cat(1,data([863:865,867:872,875:876],4))); % riomayo.ar - Drought - maximum respiration
% max_f       = max(cat(1,data([878:885,887,889,891,893:896,898:901,904,906],4))); % scruzl.us - Ambient - maximum respiration
% max_f       = max(cat(1,data([907:910,912,913,915,916,918,919,921,922,924:928,932,936],4))); % scruzl.us - Drought - maximum respiration
% max_f       = max(data(937:960,4)); % sgsdrt.us - Ambient - maximum respiration
% max_f       = max(data(961:984,4)); % sgsdrt.us - Drought - maximum respiration
% max_f       = max(data(985:1001,4)); % skotsvar.no - Ambient - maximum respiration
% max_f       = max(data(1002:1019,4)); % skotsvar.no - Drought - maximum respiration
% max_f       = max(data(1020:1037,4)); % ukulingadrt.za - Ambient - maximum respiration
% max_f       = max(data(1038:1055,4)); % ukulingadrt.za - Drought - maximum respiration
% max_f       = max(data(1056:1073,4)); % wayqe.re - Ambient - maximum respiration
% max_f       = max(data(1074:1091,4)); % wayqe.re - Drought - maximum respiration

% Observations
% SR_obs      = data(1:17,4)/max_f; % Ayora.ES - Ambient
% SR_obs      = data(18:34,4)/max_f; % Ayora.ES - Drought
% SR_obs      = data(35:58,4)/max_f; % GIG - Ambient
% SR_obs      = data(59:82,4)/max_f; % GIG - Drought
% SR_obs      = data(83:106,4)/max_f; % P12 - Ambient
% SR_obs      = data(107:130,4)/max_f; % P12 - Drought
% SR_obs      = data(131:154,4)/max_f; % P13 - Ambient
% SR_obs      = data(155:178,4)/max_f; % P13 - Drought
% SR_obs      = cat(1,data([179:183],4),data([185:196],4))/max_f; % PNE_unburned - Ambient
% SR_obs      = cat(1,data([197:207],4),data([209:214],4))/max_f; % PNE_unburned - Drought
% SR_obs      = data(215:238,4)/max_f; % Purdue.us - Ambient
% SR_obs      = data(239:262,4)/max_f; % Purdue.us - Drought
% SR_obs      = cat(1,data([263,269,271,273,275,276,285,288,289],4),data([265:267],4), ...
    % data([291:292],4))/max_f; % Sev.mix - Ambient
% SR_obs      = data([293,295,297,301,302,304,308,309,312,313,316,318,319,320],4)/max_f; % Sev.mix - Drought
% SR_obs      = data(323:352,4)/max_f; % baddrt.de - Ambient
% SR_obs      = data(353:381,4)/max_f; % baddrt.de - Drought
% SR_obs      = data(382:399,4)/max_f; % brhill.au - Ambient
% SR_obs      = data(400:417,4)/max_f; % brhill.au - Drought
% SR_obs      = data(418:433,4)/max_f; % brookdale.ca - Ambient
% SR_obs      = data(434:450,4)/max_f; % brookdale.ca - Drought
% SR_obs      = data(451:479,4)/max_f; % cedarsav.us - Ambient
% SR_obs      = cat(1,data([480:492],4),data([494:508],4))/max_f; % cedarsav.us - Drought
% SR_obs      = data(509:526,4)/max_f; % cobar.au - Ambient
% SR_obs      = data(527:544,4)/max_f; % cobar.au - Drought
% SR_obs      = data(545:559,4)/max_f; % cowidrt.ca - Ambient
% SR_obs      = data(560:575,4)/max_f; % cowidrt.ca - Drought
% SR_obs      = cat(1,data([578,579,596,597],4),data([581:584],4),data([591:594],4))/max_f; % dona.ana - Ambient
% SR_obs      = cat(1,data([602,608,610,614],4),data([604:606],4),data([616:620],4))/max_f; % dona.ana - Drought
% SR_obs      = data(624:640,4)/max_f; % hoide.de - Ambient
% SR_obs      = data(641:656,4)/max_f; % hoide.de - Drought
% SR_obs      = data(657:680,4)/max_f; % horacg,cr - Ambient
% SR_obs      = data(681:704,4)/max_f; % horacg,cr - Drought
% SR_obs      = cat(1,data([707,709,713,716],4))/max_f; % hyide.de - Ambient
% SR_obs      = cat(1,data([719,721,722,725,727,728,730,731],4))/max_f; % hyide.de - Drought
% SR_obs      = data(732:749,4)/max_f; % lygra.no - Ambient
% SR_obs      = data(750:766,4)/max_f; % lygra.no - Drought
% SR_obs      = data(767:784,4)/max_f; % nyngan.au - Ambient
% SR_obs      = data(785:802,4)/max_f; % nyngan.au - Drought
% SR_obs      = data(803:826,4)/max_f; % passogavia.it - Ambient
% SR_obs      = data(827:850,4)/max_f; % passogavia.it - Drought
% SR_obs      = cat(1,data([853,854,856,857,860,861,862],4))/max_f; % riomayo.ar - Ambient
% SR_obs      = cat(1,data([863:865,867:872,875:876],4))/max_f; % riomayo.ar - Drought
% SR_obs      = cat(1,data([878:885,887,889,891,893:896,898:901,904,906],4))/max_f; % scruzl.us - Ambient
% SR_obs      = cat(1,data([907:910,912,913,915,916,918,919,921,922,924:928,932,936],4))/max_f; % scruzl.us - Drought
% SR_obs      = data(937:960,4)/max_f; % sgsdrt.us - Ambient
% SR_obs      = data(961:984,4)/max_f; % sgsdrt.us - Drought
% SR_obs      = data(985:1001,4)/max_f; % skotsvar.no - Ambient
% SR_obs      = data(1002:1019,4)/max_f; % skotsvar.no - Drought
% SR_obs      = data(1020:1037,4)/max_f; % ukulingadrt.za - Ambient
% SR_obs      = data(1038:1055,4)/max_f; % ukulingadrt.za - Drought
% SR_obs      = data(1056:1073,4)/max_f; % wayqe.re - Ambient
% SR_obs      = data(1074:1091,4)/max_f; % wayqe.re - Drought

% Objective function - residual sum of squares
SSE_1       = (sum(((SR_obs-SR_sim)).^2));
% SSE         = SSE_1^0.5
SSE         = SSE_1

% fig = figure;
plot(log10(x),SR_sim,"*");
hold on
plot(log10(x),SR_obs,"o");
xline(log10(p(3)),'-r');
xline(p(1),'-b');

% fig = figure;
% scatter(SR_obs,SR_sim)
end