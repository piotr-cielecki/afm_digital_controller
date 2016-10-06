dsp_utils
specifications

[S, T, R]=solve_diophantine(B,A,Bm,Am,1);


S
T
R

B
Bm


subplot(2,2,1);
plot(20*log(abs(fft(filter(S,R,[1, zeros(1,50)])))));
subplot(2,2,2);
plot(abs(fft(filter(Bm, Am, [1,zeros(1,50)]))));
subplot(2,2,3)
plot(20*log(abs(fft(filter(B,A,[1,zeros(1,50)])))));
plot(filter(B,A,[1,zeros(1,50)]));


