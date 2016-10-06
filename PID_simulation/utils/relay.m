function [x] = relay(error)
	
	threshold_max = 0;
	threshold_min = -0;
	x_max = 0.8; 
	x_min = 0.2;
	
	persistent last_x= 0;

	if(error > threshold_max)
		x = x_max;
	elseif(error < threshold_min)
		x = x_min;
	else
		x  = last_x;
	endif
	
	last_x= x; 
endfunction


	% Relay with hysteresis
