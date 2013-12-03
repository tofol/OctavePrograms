function [] = mullergrafico(f)
x0 = 0.5;
x1 = -0.5;
x2 = 0;
x = -3:0.1:3;

fx = inline(f);
color = ['r','c','g','m'];
clf();
hold on;
for i=1:4
	fx0 = feval(fx,x0);
	fx1 = feval(fx,x1);
	fx2 = feval(fx,x2);

	delta1 = fx0-fx2;
	delta2 = fx1-fx2;
	delta3 = (x0-x1)*(x0-x2)*(x1-x2);

	a = (delta1*(x1-x2)-delta2*(x0-x2))/delta3;
	b = (delta2*(x0-x2)^2-delta1*(x1-x2)^2)/delta3;
	c = fx2;

	P = a*(x-x2).^2+b*(x-x2).^2+c;

	plot(x,P,color(i))

	x3 = x2 - (2*c)/(b+sign(b)*sqrt(b^2-4*a*c))

	x0 = x1; x1 = x2; x2 = x3;
end


fplot(fx,[-1.5,1.5],'b','linewidth=3')
legend({'P1(x)','P2(x)','P3(x)','P4(x)','f(x)'});

legend boxon;
set (gca, 'xaxislocation', 'zero');
set (gca, 'yaxislocation', 'zero');
set(gca, 'box', 'off');
xlabel('y');
ylabel('x');
set (get (gca, 'ylabel'), 'rotation', 360);
grid;
hold off;

end