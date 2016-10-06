function [regulator_out] = regulate(system_out, setpoint)
	persistent last_in_buf= zeros(1, 2);	
	persistent last_sp_buf= zeros(1, 2);	
	persistent last_out_buf = zeros(1, 2);

	persistent S=[2.68545, -1.03192];
	persistent T=[1.65352,0];
	persistent R=[1,0.84695];

 	last_in_buf = [system_out, last_in_buf(1)];
 	last_sp_buf = [setpoint, last_sp_buf(1)];

	regulator_out = -sum(S.*last_in_buf) - sum(R.*last_out_buf) + sum(T.*last_sp_buf);
%	printf("%f = %f - %f\n", out, sum(B.*last_in_buf), sum(A.*last_out_buf));
	last_out_buf = [regulator_out, last_out_buf(1)];
	
endfunction

