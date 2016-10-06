function [x_out, y_out, kp, ki] = relay_loop(relay_setpoint)

	x_padding = 1;
	y_padding = 1;

	N_acq = length(relay_setpoint);
	x_out = zeros(1, N_acq);	y_out = zeros(1, N_acq);
	x = [zeros(1, x_padding), zeros(1, N_acq)];
	y = [zeros(1, y_padding), zeros(1, N_acq)];



	for n = 1 : N_acq-1,

		x(n+x_padding) = relay( relay_setpoint(n) - y(n+x_padding-1) );

		y(n+y_padding) = model(x(n+x_padding), y(n+y_padding-1));%		x(n-x_padding+1:n)	, 		y(n-y_padding+1:n)	);
	endfor

	for n = 1 : N_acq-1,
		y_out(n) = y(n+y_padding);
		x_out(n) = x(n+x_padding);
	endfor
	
	ki = kp = 0;

endfunction
