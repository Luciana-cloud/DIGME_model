p = [1 0.05 0.005];
%% 
ObjectiveFunction = @calibration_DAMM;

A = [];
b = [];
Aeq = [];
beq = [];

ub = [1e2 1e1 1e2];
lb = [1e-2 1e-5 1e-6];

p0 = p;

nonlcon = [];
options = optimoptions(@fmincon,'MaxFunEvals',100000);

[p,fval,exitFlag,output] = fmincon(ObjectiveFunction,p0,A,b,Aeq,beq,lb,ub,nonlcon,options);

%%

save('Ayora_ambient.mat','p')
save('Ayora_drought.mat','p')
save('brhill_ambient.mat','p')
save('brhill_drought.mat','p')
save('brookdale_ambient.mat','p')
save('brookdale_drought.mat','p')

%%
p = [0.5 0.5 0.01 1];
%%
ObjectiveFunction = @calibration_NICHE;

A = [];
b = [];
Aeq = [];
beq = [];

ub = [1e2 0.5 1e1 10];
lb = [1e-2 0.1 1e-3 0.5];

p0 = p;

nonlcon = [];
options = optimoptions(@fmincon,'MaxFunEvals',100000);

[p,fval,exitFlag,output] = fmincon(ObjectiveFunction,p0,A,b,Aeq,beq,lb,ub,nonlcon,options);

%%
save('Ayora_ambient_NICHE.mat','p')
save('Ayora_drought_NICHE.mat','p')
save('brhill_ambient_NICHE.mat','p')
save('brhill_drought_NICHE.mat','p')
save('brookdale_ambient_NICHE.mat','p')
save('brookdale_drought_NICHE.mat','p')

%%
p = [0.01 0.5 1.5 0.05];

%%

ObjectiveFunction = @calibration_vg;

A = [];
b = [];
Aeq = [];
beq = [];

% ub = [1 1 5 5]; % 0.85/1 (organic soils)
ub = [1 1.5 5 5]; % 0.85/1 (organic soils)
lb = [0.001 0.001 0.001 0.001];

% ub = [p(1) 0.85 5 p(4)]; % 0.85/1
% lb = [p(1) 0.001 0.001 p(4)];

p0 = p;

nonlcon = [];
options = optimoptions(@fmincon,'MaxFunEvals',100000);

[p,fval,exitFlag,output] = fmincon(ObjectiveFunction,p0,A,b,Aeq,beq,lb,ub,nonlcon,options);

%%
% save('nyngan_WP_ambient.mat','p')
% save('nyngan_WP_drought.mat','p')
% save('cowidrt_WP_ambient.mat','p')
% save('cowidrt_WP_drought.mat','p')
% save('hyide_WP_ambient.mat','p')
% save('hyide_WP_drought.mat','p')
% save('skotsvar_WP_ambient.mat','p')
% save('skotsvar_WP_drought.mat','p')
% save('GIG_A_7C_7_WP_ambient.mat','p')
% save('GIG_A_7C_7_WP_drought.mat','p')
% save('P13_A_7C_7_WP_ambient.mat','p')
% save('P13_A_7C_7_WP_drought.mat','p')
% save('laschilcas_WP_ambient.mat','p')
% save('laschilcas_WP_drought.mat','p')

%%
% save('Passogavia_WP_ambient.mat','p')
% save('Passogavia_WP_drought.mat','p')
% save('Dona_Ana_WP_ambient.mat','p')
% save('Dona_Ana_WP_drought.mat','p')
% save('Purdue_WP_ambient.mat','p')
% save('Purdue_WP_drought.mat','p')
% save('SGS_US_WP_ambient.mat','p')
% save('SGS_US_WP_drought.mat','p')
% save('Sev_Mix_WP_ambient.mat','p')
% save('Sev_Mix_WP_drought.mat','p')
% save('Horacg_WP_ambient.mat','p')
% save('Horacg_WP_drought.mat','p')
% save('PNE_Brazil_WP_ambient.mat','p')
% save('PNE_Brazil_WP_drought.mat','p')
% save('Ukulinga_WP_ambient.mat','p')
% save('Ukulinga_WP_drought.mat','p')
% save('Waqecha_WP_ambient.mat','p')
% save('Waqecha_WP_drought.mat','p')

%%
% save('rio_mayo_WP_ambient.mat','p')
% save('rio_mayo_WP_drought.mat','p')
% save('Scruzl_WP_ambient.mat','p')
% save('Scruzl_WP_drought.mat','p')
% save('Brhill_WP_ambient.mat','p')
% save('Brhill_WP_drought.mat','p')
% save('Cobar_WP_ambient.mat','p')
% save('Cobar_WP_drought.mat','p')
% save('Badlauch_WP_ambient.mat','p')
% save('Badlauch_WP_drought.mat','p')
% save('Savann_WP_ambient.mat','p')
% save('Savann_WP_drought.mat','p')
% save('Ayora_WP_ambient.mat','p')
% save('Ayora_WP_drought.mat','p')
% save('Brookdale_WP_ambient.mat','p')
% save('Brookdale_WP_drought.mat','p')
% save('Hoide_WP_ambient.mat','p')
% save('Hoide_WP_drought.mat','p')
% save('Lygra_WP_ambient.mat','p')
% save('Lygra_WP_drought.mat','p')
% save('P12_A_1C_WP_ambient.mat','p')
% save('P12_A_1C_WP_drought.mat','p')
