function out = IIR_filter_single_sample(b, a, x, y)
	out = 0;
	Ma = length(b);
	Mb = length(a);

	for m = 0 : Ma-1,
		out = out + b(m+1)*x(Ma-m);
	endfor;

	for m = 1 :Mb-1,
		out = out + a(m+1)*y(Mb-m);
	endfor;

	if(a(1) != 0)
		out = out/a(1);
	endif
	
endfunction	
