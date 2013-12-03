function [] = logisticadibujo()
	x=linspace(0,1,100);
	clf();
	for a=1:1:4
		plot(x,a*x.*(1-x))
		text(0.4 , 0.125, 'a=1');
		text(0.4 , 0.4, 'a=2');
		text(0.4 , 0.6, 'a=3');
		text(0.4 , 0.8, 'a=4');
		hold on
	end
end