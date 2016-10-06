function [b] = sinc_gen(fc, M, wnd)
	w = zeros(1, M);
	b = zeros(1, M);
	
	if(wnd == 0),
		for k = 0 : M-1,
			w(k+1) = 0.42 - 0.5*cos(2*pi*k/(M-1)) + 0.08*cos(4*pi*k/(M-1));
		endfor;			
	elseif(wnd == 1),
		for k = 0 : M-1,
			w(k+1) = 0.54 - 0.46*cos(2*pi*k/(M-1));	
		endfor;
	else
		w = ones(1, M);
	endif;

	for k = 0 : M-1,
		
		if(k == (M-1)/2),
		%	b(k+1) = 2*pi*fc* w(k+1);
		else
			b(k+1) = (sin(2*pi*fc*(k-(M-1)/2)))/(2*pi*fc*(k-(M-1)/2)) * w(k+1); % normalizacja wzgledem fs = 1		
		endif;
	endfor;
	
	b = b/sum(b);
endfunction
