pkg load signal
dsp_utils
specifications

%zplane(roots(B), roots(A));

% B, A polynomials indicing frequency response

[model_freq_resp,freq]=freqz(B,A,1000);
[process_freq_resp,freq]=freqz(Bm,Am,1000);


%plot(freq, abs(model_freq_resp), freq, abs(process_freq_resp));
subplot(2,2,1);
plot(freq, lin2db(abs(model_freq_resp) ), "or"		);
subplot(2,2,2);
plot(freq, lin2db(abs(process_freq_resp))		);
subplot(2,2,3);
plot(freq, (abs(ifft((model_freq_resp))) ), "or"	);
subplot(2,2,4);
plot(freq, (abs(ifft((process_freq_resp))))		);


