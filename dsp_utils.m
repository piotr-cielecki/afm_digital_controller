% util files to save some characters in syntax:-)
1;

function db=lin2db(lin)
	db=20*log10(lin);	
end


function X=make_monic(X)
	if(0 == deg(X))
		X = 1;
	end
end


