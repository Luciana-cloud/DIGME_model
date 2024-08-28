
%%
% p = [1.5 1000 0.4];
p = [1.5 1000];

%%
% a = p(3);
ObjectiveFunction = @calibration_vg;

A = [];
b = [];
Aeq = [];
beq = [];

ub = [1e2 1e4];  
lb = [1e-2 1e-2];
% ub = [1e2 1e4 1]; % *cedarsav.us 
% lb = [1e-2 1e-2 0];

p0 = p;

nonlcon = [];
options = optimoptions(@fmincon,'MaxFunEvals',100000);

[p,fval,exitFlag,output] = fmincon(ObjectiveFunction,p0,A,b,Aeq,beq,lb,ub,nonlcon,options);

%%
save('Ayora.mat','p')
save('GIG.mat','p')
save('P12.mat','p')
save('P13.mat','p')
save('PNE_unburned.mat','p')
save('Purdue.us.mat','p')
save('Sev.mix.mat','p')
save('baddrt.de.mat','p')
save('brhill.au.mat','p')
save('brookdale.ca.mat','p')
save('cobar.au.mat','p')
save('cowidrt.ca.mat','p')
save('dona.ana.mat','p')
save('hoide.de.mat','p')
save('horacg.cr.mat','p')
save('nyngan.au.mat','p')
save('riomayo.ar.mat','p')
save('scruzl.us.mat','p')
save('sgsdrt.us.mat','p')
save('ukulingadrt.za.mat','p')
save('wayqe.re.mat','p')
save('cedarsav.us.mat','p')
save('hyide.de.mat','p')
save('lygra.no.mat','p')
save('passogavia.it.mat','p')
save('skotsvar.no.mat','p')

%%
p = [1.3 1 0.0101]; % 0.0101; 0.00101; 0.000101
%%
ObjectiveFunction = @calibration_manzoni;

A = [];
b = [];
Aeq = [];
beq = [];

ub = [1.5 1e2 0.8]; % 1e2
lb = [-1 1e-2 0.5]; % 0.01; 0.001; 0.00001 

p0 = p;

nonlcon = [];
options = optimoptions(@fmincon,'MaxFunEvals',100000);

[p,fval,exitFlag,output] = fmincon(ObjectiveFunction,p0,A,b,Aeq,beq,lb,ub,nonlcon,options);

%%
% save('Ayora_ambient.mat','p')
% save('Ayora_drought.mat','p')
% save('GIG_ambient.mat','p')
% save('GIG_drought.mat','p')
% save('P12_ambient.mat','p')
% save('P12_drought.mat','p')
% save('P13_ambient.mat','p')
% save('P13_drought.mat','p')
% save('PNE_unburned_ambient.mat','p')
% save('PNE_unburned_drought.mat','p')
% save('Purdue.us_ambient.mat','p')
% save('Purdue.us_drought.mat','p')
% save('Sev.mix_ambient.mat','p')
% save('Sev.mix_drought.mat','p')
% save('baddrt.de_ambient.mat','p')
% save('baddrt.de_drought.mat','p')
% save('brhill.au_ambient.mat','p')
% save('brhill.au_drought.mat','p')
% save('brookdale.ca_ambient.mat','p')
% save('brookdale.ca_drought.mat','p')
% save('cedarsav.us_ambient.mat','p')
% save('cedarsav.us_drought.mat','p')
% save('cobar.au_ambient.mat','p')
% save('cobar.au_drought.mat','p')
% save('cowidrt.ca_ambient.mat','p')
% save('cowidrt.ca_drought.mat','p')
% save('dona.ana_ambient.mat','p')
% save('dona.ana_drought.mat','p')
% save('hoide.de_ambient.mat','p')
% save('hoide.de_drought.mat','p')
% save('horacg.cr_ambient.mat','p')
% save('horacg.cr_drought.mat','p')
% save('hyide.de_ambient.mat','p')
% save('hyide.de_drought.mat','p')
% save('lygra.no_ambient.mat','p')
% save('lygra.no_drought.mat','p')
% save('nyngan.au_ambient.mat','p')
% save('nyngan.au_drought.mat','p')
% save('passogavia.it_ambient.mat','p')
% save('passogavia.it_drought.mat','p')
% save('riomayo.ar_ambient.mat','p')
% save('riomayo.ar_drought.mat','p')
% save('scruzl.us_ambient.mat','p')
% save('scruzl.us_drought.mat','p')
% save('sgsdrt.us_ambient.mat','p')
% save('sgsdrt.us_drought.mat','p')
% save('skotsvar.no_ambient.mat','p')
% save('skotsvar.no_drought.mat','p')
% save('ukulingadrt.za_ambient.mat','p')
% save('ukulingadrt.za_drought.mat','p')
% save('wayqe.re_ambient.mat','p')
% save('wayqe.re_drought.mat','p')

%%
log10(max(x))
min(x)
%%
p = [1.3 1]; % 0.0101; 0.00101; 0.000101
%%
ObjectiveFunction = @calibration_manzoni_new_cal;

A = [];
b = [];
Aeq = [];
beq = [];

ub = [3.1 1e2]; % 1e2
lb = [-1 1e-2]; % 0.01; 0.001; 0.00001 

p0 = p;

nonlcon = [];
options = optimoptions(@fmincon,'MaxFunEvals',100000);

[p,fval,exitFlag,output] = fmincon(ObjectiveFunction,p0,A,b,Aeq,beq,lb,ub,nonlcon,options);

%%
% save('Ayora_ambient_new.mat','p')
% save('Ayora_drought_new.mat','p')
% save('GIG_ambient_new.mat','p')
% save('GIG_drought_new.mat','p')
% save('P12_ambient_new.mat','p')
% save('P12_drought_new.mat','p')
% save('P13_ambient_new.mat','p')
% save('P13_drought_new.mat','p')
% save('PNE_unburned_ambient_new.mat','p')
% save('PNE_unburned_drought_new.mat','p')
% save('Purdue.us_ambient_new.mat','p')
% save('Purdue.us_drought_new.mat','p')
% save('Sev.mix_ambient_new.mat','p')
% save('Sev.mix_drought_new.mat','p')
% save('baddrt.de_ambient_new.mat','p')
% save('baddrt.de_drought_new.mat','p')
% save('brhill.au_ambient_new.mat','p')
% save('brhill.au_drought_new.mat','p')
% save('brookdale.ca_ambient_new.mat','p')
% save('brookdale.ca_drought_new.mat','p')
% save('cedarsav.us_ambient_new.mat','p')
% save('cedarsav.us_drought_new.mat','p')
% save('cobar.au_ambient_new.mat','p')
% save('cobar.au_drought_new.mat','p')
% save('cowidrt.ca_ambient_new.mat','p')
% save('cowidrt.ca_drought_new.mat','p')
% save('dona.ana_ambient_new.mat','p')
% save('dona.ana_drought_new.mat','p')
% save('hoide.de_ambient_new.mat','p')
% save('hoide.de_drought_new.mat','p')
% save('horacg.cr_ambient_new.mat','p')
% save('horacg.cr_drought_new.mat','p')
% save('hyide.de_ambient_new.mat','p')
% save('hyide.de_drought_new.mat','p')
% save('lygra.no_ambient_new.mat','p')
% save('lygra.no_drought_new.mat','p')
% save('nyngan.au_ambient_new.mat','p')
% save('nyngan.au_drought_new.mat','p')
% save('passogavia.it_ambient_new.mat','p')
% save('passogavia.it_drought_new.mat','p')
% save('riomayo.ar_ambient_new.mat','p')
% save('riomayo.ar_drought_new.mat','p')
% save('scruzl.us_ambient_new.mat','p')
% save('scruzl.us_drought_new.mat','p')
% save('sgsdrt.us_ambient_new.mat','p')
% save('sgsdrt.us_drought_new.mat','p')
% save('skotsvar.no_ambient_new.mat','p')
% save('skotsvar.no_drought_new.mat','p')
% save('ukulingadrt.za_ambient_new.mat','p')
% save('ukulingadrt.za_drought_new.mat','p')
% save('wayqe.re_ambient_new.mat','p')
% save('wayqe.re_drought_new.mat','p')
