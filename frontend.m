dsp_utils
specifications

[S, T, R]=solve_diophantine(B,A,Bm,Am,1);


S
T
R

B
Bm


subplot(1,2,1);
plot(filter(S,R,[1, zeros(1,50)]));
subplot(2,2,1);
plot(abs(fft(filter(Bm, Am, [1,zeros(1,50)]))));
