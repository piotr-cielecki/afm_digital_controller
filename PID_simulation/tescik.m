addpath Models/RC_const
addpath utils

N = 100;
xpad = 2;
ypad = 2;

x = [zeros(1, xpad-1), ones(1, N)];
y = [zeros(1, ypad-1), zeros(1, N)];
yfin = zeros(1, N);

for n = 0 : N-1,
	y(n+1+ypad) = model(x(n+xpad), y(n+ypad));
endfor

for n = 0 : N-1,
	yfin(n+1) = y(n+ypad);
endfor

rmpath Models/RC_const
rmpath utils
