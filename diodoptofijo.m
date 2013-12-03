function y = diodoptofijo(V)
	C0 = 81e-12; fi = 0.6; gama = 0.44; Q= 1e-10;
	y = (Q/C0 )*(1+abs(V)/fi).^gama;
end