function [y yd]=fun_muller(a,x)
	%y = 16*x^4-40*x^3+5*x^2+20*x+6;
	y = polyval(a,x);
	yd = polyval(polyder(a),x);