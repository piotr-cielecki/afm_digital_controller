function [yfin] = IIR_filter(b, a, x)
	N = length(x);
	Ma = length(b);
	Mb = length(a);
	y = [zeros(1, Mb), zeros(1, N)];
	x = [zeros(1, Ma), x];

	for n = 1 : N,
		for m = 0 : Ma-1,
			y(n+Mb) = y(n+Mb) + b(m+1)*x(n-m+Ma);
		endfor;

		for m = 1 :Mb-1,
			y(n+Mb) = y(n+Mb) + a(m+1)*y(n-m+Mb);
		endfor;
		
		if(a(1) != 0)	
			y = y/ a(1);	
		endif;
	endfor;

	for n = 1 : N,
		yfin(n) = y(n+Mb);
	endfor;
endfunction	
