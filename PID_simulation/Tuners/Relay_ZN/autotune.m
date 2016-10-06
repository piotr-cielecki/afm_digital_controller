function [kp, ki, kd] = autotune()

	relay_setp = 1000;
	PeriodOne = 20;

	RelayTest_Setpoint = [ones(1, PeriodOne), 0.5*ones(1, relay_setp- PeriodOne)];

	N_acq = relay_setp;

	n = 0 : N_acq-1;
	[x, y] = relay_loop(RelayTest_Setpoint);

	plot(n, RelayTest_Setpoint, "-or", n, x, "-og", n, y, "-ob", n, (RelayTest_Setpoint - y), "-ok");
	legend("setpoint", "relay out", "system out", "error");

	input();

	[kp, ki, kd] = relay_calculations(x, y, 1);



endfunction

