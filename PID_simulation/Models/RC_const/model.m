function y_out = model(x, y)
	b(1) = 0.15;
	a(1) = 1;
	a(2) = 0.85;

	y_out = IIR_filter_single_sample(b, a, x, y);
endfunction	

