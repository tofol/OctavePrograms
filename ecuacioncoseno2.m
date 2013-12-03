function[] = ecuacioncoseno2()
	x = -1:0.1:6;
	num = 4*x-8;
	d = (8*x-2*x.^2).^2;
	den = sqrt(1-d);
	fun = num./den;
	clf();
	plot(x,fun)
	grid;
end