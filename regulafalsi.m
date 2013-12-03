function [] = regulafalsi (f,a,b,tol,maxiter)
	filename = 'regulafalsi.txt';
	fid = fopen(filename,'w');
	fprintf(fid,'k\t\tx (k)\t\t\t\t\t\t\tError\n');

	t = a:0.01:b;
	
	fx = inline(f);
	func = fx(t);
	
	fa = feval(fx,a);
	fb = feval(fx,b);
	if fa*fb > 0
	   disp('La funcion debe tener signo distinto en los extremos del intervalo.')
	   return
	 end
	 iter = 0;
	 x = a;
	 errores = [ ];
	 imagenes = [ ];
	 incr = b-a;
	 while incr > tol && iter < maxiter
	     c = (a*fb-b*fa)/(fb-fa);
	     x = [x,c];
	     fc = feval(fx,c);
	     if fc == 0
	         a = c; b = c;
	     elseif fa*fc < 0
	        b = c; fb = fc;
	      else
	        a=c; fa=fc;
	      end
	       incr = abs(x(end)-x(end-1));
	       errores =[errores,incr];
	       iter++;
	    end
	    iter2 = 1:1:iter;
	    fc1 = feval(fx,x);
	    imagenes = [imagenes,fc1];
	    sol = c;
	    if incr > tol
	      disp('Insuficientes iteraciones.')
	  else
	  	for k=1:iter
			fprintf(fid,'%.0f\t\t%.15f\t\t%.15f\n',iter2(k),x(k),errores(k));
		end
		fprintf (fid,'\nLa solución es %.15f.\nSe ha alcanzado en %d iteraciones.\nCon un error de %e',sol,iter,errores(end));
		fclose(fid);
		printf ('La solucion es %.15f, y se ha alcanzado en %d iteraciones.\nCon un error de %e\n',
             sol, iter,errores(end));
	    end

	clf();
	subplot(1,3,1);
	fplot(fx,[a-5,b+5])
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
	plot(t,func,x,imagenes,'*r')
	set (gca, 'xaxislocation', 'zero');
	set (gca, 'yaxislocation', 'zero');
	set(gca, 'box', 'off');
	grid;
	title('Metodo Regula Falsi');
 	legend({f,'Aproximaciones'},'location','southoutside');
 	legend boxon;
 	xlabel('y');
 	ylabel('x');
 	set (get (gca, 'ylabel'), 'rotation', 360);
	subplot(1,3,3);
	plot(iter2,errores,iter2,errores,'*r')
	set (gca, 'xaxislocation', 'bottom');
	set (gca, 'yaxislocation', 'right');
	set(gca, 'box', 'off');
	grid;
	title('Tendencia de errores en Regula Falsi');
 	legend({'Errores','Puntos Errores'},'location','southoutside');
 	legend boxon;
 	xlabel('Numero Iteraciones');
 	ylabel('Errores');
 	set (get (gca, 'ylabel'), 'rotation', 360);
end