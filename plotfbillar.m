	t = 0:0.1:2*pi;
	y = fbillar(t);
	plot(t,y)
	grid;
	title('Funcion Billar Circular');
 	legend('Billar','location','northeast');
 	biseccion('fbillar(t)',1,2,1e-4,100)
 	regulafalsi('fbillar(t)',1,2,1e-4,100)
 	secante('fbillar(t)',1,2,1e-4,100)