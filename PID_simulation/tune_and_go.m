addpath Models/Motor
addpath Regulators/Custom
addpath Tuners/Relay_ZN
addpath utils

[kp, ki, kd] = autotune();

printf("kp = %f\tki = %f\tkd = %f\n\n", kp, ki, kd);


save "Regulators/PID/coefs.txt" kp ki kd;

clear all;
steps();


rmpath Models/Motor
rmpath Regulators/Custom
rmpath Tuners/Relay_ZN
rmpath utils


