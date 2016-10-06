function process_out = model(process_in, last_process_out)
	a = [ 0.68192, 0.56797,-0.015538];
	b = [0.27903, 0.83708, 0.83708, 0.27903];
	order = 3;

	persistent past_y = zeros(1, order);
	persistent past_x = zeros(1, order+1);

	past_x = [process_in, past_x(1 : order)];
	past_y = [last_process_out, past_y(1 : order-1)];
	
	process_out = sum(a.*past_y) - sum(b.*past(x);


endfunction
