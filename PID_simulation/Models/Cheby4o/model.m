function [out] = model(in)
	persistent order = 4;
	persistent rip = 1;
	persistent Wc = 0.05;
	persistent last_in_buf= zeros(1, order+1);	
	persistent last_out_buf = zeros(1, order);
%	[B, A] = cheby1(order, rip, Wc);
	[B,A] = butter(order, Wc);
	%B = [0.0222,0,0];
	A = A(2 : order+1);

 	last_in_buf = [in, last_in_buf(1 : order)];

	out = sum(B.*last_in_buf) - sum(A.*last_out_buf);
%	printf("%f = %f - %f\n", out, sum(B.*last_in_buf), sum(A.*last_out_buf));
	last_out_buf = [out, last_out_buf(1 : order-1)];
	
endfunction
