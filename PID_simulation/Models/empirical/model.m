function y_out = model(x, y)
	persistent B = load("impresp")/sum(	load("impresp")	);
	persistent last_samples = zeros(1, 170);
	
	last_samples = [x, last_samples(1 : 169)];
	y_out = sum(last_samples .* B);

endfunction
