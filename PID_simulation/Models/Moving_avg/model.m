function process_output = model(process_in)
	order = 20;
	
	persistent last_avg = 0;
	persistent past_samples_buf = zeros(1, order);

	past_samples_buf = [past_samples_buf(2 : order), process_in];
	
	process_output = mean(past_samples_buf);
	
endfunction
