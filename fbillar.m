% Para que los metodos iterativos funcionen es  biseccion('fbillar(t)',1,2,1e-4,100)

function [y] = fbillar(t)
	P=[0.6,-0.3]; Q = [-0.6,-0.3];
	y1 = P(1)*sin(t)-P(2)*cos(t);
	y2 = Q(1)*sin(t)-Q(2)*cos(t);
	den1 = sqrt((cos(t)-P(1)).^2+(sin(t)-P(2)).^2);
	den2 = sqrt((cos(t)-Q(1)).^2+(sin(t)-Q(2)).^2);
	y1 = y1./den1;
	y2 = y2./den2;
	y = y1 + y2;
end