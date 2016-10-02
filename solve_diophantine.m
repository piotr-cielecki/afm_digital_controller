%	diophantine equation states: 
%
%	A*R' + B_n*S = A0*Am = Ac'
%	
%	where:
%
%	A  - process denominator
%	R' - controller denominator / B_c
%	B_n- non-cancellable process zeros
%	B_c- cancellable process zeros
%	S  - controller numerator
% 	A0 - sth weird for now
%	Am - model denominator
%	Ac'- characteristic polynomial / B_c

function [S, R] = solve_diophantine(B, A, Bm, Am, A0)
	critical_rel_damping=0.7;
	[B_n, B_c] = factor_B(B, critical_rel_damping);

	deg_A0		= deg(A)(2)-deg(B_c)(2)-1;
	deg_Ac_min 	= 2*deg(A)(2)-1;
	deg_R		= deg_Ac_min-deg(A)(2);
	deg_R_prime	= deg_R - deg(B_c)(2)

	A0		= ones(1,deg_A0+1);
	R_prime		= ones(1,deg_R_prime+1);

	A0		= make_monic(A0);
	R_prime		= make_monic(R_prime);

	S 		= (conv(A, R_prime) - conv(A0, Am)) ./B_n;


	R = conv(R_prime, B_c);	
end



function [B_n, B_c] = factor_B(B, crit_del_damping)
%	B_c is monic
	B_c = B/B(1);
	B_n=B(1);
end




