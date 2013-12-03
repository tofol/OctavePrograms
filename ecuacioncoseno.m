function[] = ecuacioncoseno()
	x = -0.5:0.1:60;
	c = sqrt(2)/4;
	num = 8 + sin(x);
	den = sqrt(8*x-cos(x));
	fun = (c*num)./den;
	clf();
	plot(x,fun)
	grid;
end