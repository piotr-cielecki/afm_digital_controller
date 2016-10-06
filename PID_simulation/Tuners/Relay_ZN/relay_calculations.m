function [Kp, Ki, Kd] = relay_calculations(relay_output, proc_output, PID_type)
	y = proc_output;
	relay_len = length(y);
	
	Y = abs(fft(y)); Y(1) = 0;
	Y = Y/relay_len;

	first_harmonic = f_first_harmonic = 0;
	
	for m = 10 : relay_len/2,
		if(Y(m) > first_harmonic)
			first_harmonic = Y(m);
			f_first_harmonic = m;	
		endif	
	endfor

	plot((0:length(Y)-1)/length(Y), Y);

	pause;

	Tcrit = relay_len/f_first_harmonic+1;
	disp(Tcrit);
	printf("fc = %f\tTc = %f\n", f_first_harmonic, Tcrit);
	
	relay_min = relay_max = mean(relay_output);
	for m = relay_len/2 : relay_len/2 + Tcrit,
		if(relay_output(m) > relay_max)
			relay_max = relay_output(m);
		elseif(relay_output(m) < relay_min)
			relay_min = relay_output(m);
		endif	
	endfor

	relay_ampl = relay_max - relay_min;

	proc_min= proc_max = mean(proc_output);
	
	for m = relay_len/2 : relay_len/2 + Tcrit,
		if(proc_output(m) > proc_max)
			proc_max = proc_output(m);
		elseif(proc_output(m) < proc_min)
			proc_min = proc_output(m);
		endif	
	endfor

	proc_ampl = proc_max - proc_min;

	Kcrit = 4*relay_ampl / (proc_ampl * pi);

	printf("proc_amplitude = %f\tKc = %f\n", proc_ampl, Kcrit);

	Kp = Ki = Kd = 0;

	if(PID_type == 0)
		Kp = 0.5*Kcrit;

	elseif(PID_type == 1)
		Kp = 0.40 * Kcrit;
		Ki = Kp/ (0.8*Tcrit);
		
	else
		Kp = 0.6*Kcrit;
		Ki = Kp / (0.5*Tcrit);
		Kd = Kp * 0.125*Tcrit;	
	endif 
endfunction
