function [regulator_out] = regulate(system_out, setpoint)
	persistent kp = 0 
	persistent ki = 0;
	persistent kd = 0;	
	persistent once = 0;
	
	if(once == 0)	
		addpath Regulators/PID
		load "Regulators/PID/coefs.txt"
		once = 1;

		printf("Loaded:\n Kp = %f\nKi = %f\nKd = \n", kp, ki, kd);
	endif 


	persistent sum_err = 0;
	persistent last_err = 0;

	regulator_out_max = 2;
	regulator_out_min = -2;

	err = system_out - setpoint;
	sum_err += err;
	difference_err = err - last_err;
	

	regulator_out = kp * err + ki * sum_err + kd * difference_err ;	

	%if(regulator_out > regulator_out_max)
	%	regulator_out = regulator_out_max;
	%elseif(regulator_out < regulator_out_min)
	%	regulator_out = regulator_out_min;
	%endif;
	
	last_err = err;
	
endfunction

