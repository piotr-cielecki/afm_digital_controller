function [out] = model(in)
	persistent order = 2;
	persistent last_in_buf= zeros(1, order+1);	
	persistent last_out_buf = zeros(1, order);
	persistent A = [-1.03485, 0.42929];
	persistent B = [0.093093, 0.1861185, 0.093093];

	last_in_buf = [in, last_in_buf(1 : order)];

	out = sum(B.*last_in_buf) - sum(A.*last_out_buf);

	last_out_buf = [out, last_out_buf(1 : order-1)];
	

	
endfunction
