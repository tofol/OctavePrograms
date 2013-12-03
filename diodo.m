function diodo(V)
	V = linspace(0,5);
	C0 = 81e-12; fi = 0.6; gama = 0.44;
	denom = (1+abs(V)/fi).^gama;
	num = V*C0;
	Q = num./denom;
	clf();
	grid;
	plot(V,Q)
end