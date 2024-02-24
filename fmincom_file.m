p = [1 0.05 0.005];
%% 
ObjectiveFunction = @calibration_DAMM;

A = [];
b = [];
Aeq = [];
beq = [];

ub = [1e2 5e1 5e2];
lb = [1e-2 5e-5 5e-6];

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
