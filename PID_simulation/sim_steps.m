addpath Models/Motor
addpath Regulators/Custom
addpath utils

clear all;

N_acq = 1000;
Period = 500;
Delta = 0.5;

Ones_in_period = Period*Delta;
n = 0 : N_acq-1;

setpoint = zeros(1, N_acq);

for i = 1 : Period : N_acq-Period/2,
	setpoint(i : i+Ones_in_period-1) = ones(1,Ones_in_period); 
endfor

setpoint=[ones(1,N_acq/2), zeros(1, N_acq/2)];

[x, y] = regulation_loop(setpoint);

n = 0 : N_acq - 1;
plot(n, setpoint, color = "r", n, x, color = "g", n, y, "-ob", n, (setpoint - y), color = "k");
legend("setpoint", "regulator out", "system out", "error");

rmpath Models/Motor
rmpath Regulators/Custom
rmpath utils
