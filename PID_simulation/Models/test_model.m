addpath Motor  

N_samples = 200;

step = [zeros(1, 10), ones(1, N_samples-10)];
out = zeros(1, N_samples);

for sample = 1 : N_samples,
	out(sample) = model(step(sample));
end

N = 0 : N_samples-1;

[B,A] = butter(4, 0.05);

y = filter(B,A,step);


subplot(2,1,1)
plot(N, step, "-or", N, out, "-og", N, y);
subplot(2,1,2)
plot(abs(fft(filter(B,A,[1, zeros(1,50)]))));


rmpath Motor
