function y = model(x)
	persistent fc = 0.1;
	persistent M = 20;
	persistent wnd = 0
	persistent b = sinc_gen(fc, M, wnd);
	persistent last_input_samples = zeros(1, M);
	
	b(3:5) = 0.2;
	b(7) = 4;
	b = b ./ sum(b);
	last_input_samples = [x, last_input_samples(1 : M-1)];

	y = sum( b .* last_input_samples);
endfunction 
