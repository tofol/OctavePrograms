function [] = secante(f,x1,x2,tol,maxiter)
	filename = 'secante.txt';
    fid = fopen(filename,'w');
    fprintf(fid,'k\t\tx (k)\t\t\t\t\t\t\tError\n');

	t = x1:0.01:x2;
	fx = inline(f);
	x = [x1,x2];
	y = feval(fx,x);
	func = fx(t);

	k = 2;

	sol = [ ];
	errores = [ ];
	incr = tol + 1;
	delta = x2 - x1;
	while incr > tol && k < maxiter
		m = (y(k) - y(k-1))/delta;
		delta = -y(k)/m;
		x(k+1) = x(k) + delta;
		y(k+1) = feval(fx,x(k+1));
		sol =  [sol,x];
		incr = abs(delta);
		errores =[errores,incr];
		k++;
	end
	
	iter = 1:k-2;

	if incr > tol
		sol = [ ];
		disp('Diverge o insuficientes iteraciones.')
	else
		sol = x(end);
		for m=1:k-2
            fprintf(fid,'%.0f\t\t%.15f\t\t%.15f\n',iter(m),x(m),errores(m));
        end
        fprintf (fid,'\nLa solución es %.15f.\nSe ha alcanzado en %d iteraciones.\nCon un error de %e',sol(end),k-2,errores(end));
        fclose(fid);
		printf ('La solucion es %.15f, y se ha alcanzado en %d iteraciones.\n',
             sol,k-2);
	end
		clf();
		subplot(1,3,1);
		fplot(fx,[x1-5,x1+5])
		set (gca, 'xaxislocation', 'zero');
        set (gca, 'yaxislocation', 'zero');
        set(gca, 'box', 'off');
        grid;
        title('La Funcion');
        legend({f},'location', 'southoutside');
        legend boxon;
        xlabel('y');
        ylabel('x');
        set (get (gca, 'ylabel'), 'rotation', 360);
        subplot(1,3,2);
        plot(t,func,x,y,'*r')
		set (gca, 'xaxislocation', 'zero');
		set (gca, 'yaxislocation', 'zero');
		set(gca, 'box', 'off');
		grid;
		title('Metodo Secante');
	 	legend({f,'Aproximaciones'},'location','southoutside');
	 	legend boxon;
	 	xlabel('y');
	 	ylabel('x');
	 	set (get (gca, 'ylabel'), 'rotation', 360);
	 	subplot(1,3,3);
	 	plot(iter,errores,iter,errores,'*r')
		set (gca, 'xaxislocation', 'bottom');
		set (gca, 'yaxislocation', 'right');
		set(gca, 'box', 'off');
		grid;
		title('Tendencia de errores en Secante');
	 	legend('Errores','location','southoutside');
	 	legend boxon;
	 	xlabel('Numero Iteraciones');
	 	ylabel('Errores');
	 	set (get (gca, 'ylabel'), 'rotation', 360);
end