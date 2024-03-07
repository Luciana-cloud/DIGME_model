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

ub = [1 1 5 25];
lb = [0.001 0.001 0.001 0.1];

p0 = p;

nonlcon = [];
options = optimoptions(@fmincon,'MaxFunEvals',100000);

[p,fval,exitFlag,output] = fmincon(ObjectiveFunction,p0,A,b,Aeq,beq,lb,ub,nonlcon,options);

%%