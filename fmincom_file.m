
%%
p = [1.5 0.05 0.1];
% p = [1.5 0.05];

%%

ObjectiveFunction = @calibration_vg;

A = [];
b = [];
Aeq = [];
beq = [];

% ub = [5 10];  
% lb = [0.001 0.01];
ub = [5 10 1]; % *cedarsav.us 
lb = [0.001 0.01 0.33];

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
p = [1 0.5 0.101]; % 0.0501, 0.101
%%
ObjectiveFunction = @calibration_manzoni;

A = [];
b = [];
Aeq = [];
beq = [];

ub = [3 1e1 0.4];
lb = [-1 1e-2 0.1];

p0 = p;

nonlcon = [];
options = optimoptions(@fmincon,'MaxFunEvals',100000);

[p,fval,exitFlag,output] = fmincon(ObjectiveFunction,p0,A,b,Aeq,beq,lb,ub,nonlcon,options);

