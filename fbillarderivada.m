function [dy] = fbillarderivada(t)
	P=[0.6,-0.3]; Q = [-0.6,-0.3];
	x = P(1);
	y = P(2);
	x1 = Q(1);
	y1 = Q(2);
	den1 = sqrt(1-2*(x*cos(t)+y*sin(t))+x^2+y^2);
	den2 = sqrt((1-2*(x*cos(t)+y*sin(t))+x^2+y^2).^3);

	num1 = x*cos(t)+y*sin(t);
	num2 = (x*sin(t)-y*cos(t)).^2;

	dy1 = num1/den1;
	dy2 = num2/den2;

	den11 = sqrt(1-2*(x1*cos(t)+y1.*sin(t))+x^2+y^2);
	den21 = sqrt((1-2*(x1*cos(t)+y1*sin(t))+x^2+y^2).^3);

	num11 = x1*cos(t)+y1*sin(t);
	num21 = (x1*sin(t)-y1*cos(t)).^2;

	dy3 = num11/den11;
	dy4 = num21/den21;

	dy = dy1 - dy2 + dy3 - dy4;
end