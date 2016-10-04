% util files to save some characters in syntax:-)
1;

function db=lin2db(lin)
	db=20*log10(lin);	
end

function deg_X=deg(X)
	for i=[1:size(X)(2)]
		if(X(i) != 0)
			deg_X=i;
		endif
	endfor

	if(0 != deg_X)
		deg_X=deg_X-1;
	endif
end


function X=make_monic(X)
	if(0 == deg(X))
		X = 1;
	end
end


