function [out] = model(in)
	persistent last_in_buf= zeros(1, 2);	
	persistent last_out_buf = zeros(1, 2);

	persistent A=[-1.3205, 0.4966];
	persistent B=[0.1761, 0];

	%A=A(2:3);

 	%last_in_buf = [in, last_in_buf(1)];
	last_in_buf=[in, last_in_buf(1)];

	out = sum(B.*last_in_buf) - sum(A.*last_out_buf);
%	printf("%f = %f - %f\n", out, sum(B.*last_in_buf), sum(A.*last_out_buf));
	last_out_buf = [out, last_out_buf(1)];
	
endfunction
