function [x_out, y_out] = regulation_loop(setpoint)

	Update_regulator_each_N_samples = 1;
	x_padding = 1;
	y_padding = 1;
	y_MAX = 10;

	N_acq = length(setpoint);
	Regulator_update_ctr = 1;

	x = [zeros(1, x_padding-1), zeros(1, N_acq)];
	y = [zeros(1, y_padding-1), zeros(1, N_acq)];

	next_input_val = 0;

	for n = 1 : N_acq-1,
		x(n+x_padding) = next_input_val;

		y(n+y_padding) = model(x(n+x_padding-1), y(n+y_padding-1));%		x(n-x_padding+1:n)	, 		y(n-y_padding+1:n)	);
		if(y(n+y_padding) > y_MAX)
			y(n+y_padding)=y_MAX;
		elseif(y(n+y_padding) < -y_MAX)
			y(n+y_padding)=-y_MAX;
		endif

		if(Regulator_update_ctr == Update_regulator_each_N_samples)
			next_input_val = regulate(	y(n), setpoint(n)	);
			if(next_input_val > y_MAX)
				next_input_val = y_MAX;
			elseif(next_input_val < -y_MAX)
				next_input_val = -y_MAX;
			endif
	
			Regulator_update_ctr = 1;
		else
			Regulator_update_ctr = Regulator_update_ctr + 1;
		endif
	
		
	endfor

	for n = 1 : N_acq,
		y_out(n) = y(n+y_padding-1);
		x_out(n) = x(n+x_padding-1);
	endfor

endfunction
