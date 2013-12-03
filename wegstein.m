function[]=wegstein(f,x0,epsilon,max1)
fx = inline(f);
for k=1:max1
	x1=feval(fx,x0);
	y1=feval(fx,x1);
	delta=(y1-x1)/(x1-x0);
	alpha=1/(1-delta);
	x0=x1+alpha*(y1-x1);
	if abs(x1-x0)<epsilon
		break;
	endif
endfor
err=abs(x1-x0)/2;
printf ('La solucion es %.15f, y se ha alcanzado en %d iteraciones.\n',
             x0, k);
printf('Con un error de %.15e\n',err);
end