function [] = pfijo(g,f,a,b,x1,tol,maxiter)
	filename = 'puntofijo.txt';
	fid = fopen(filename,'w');
	fprintf(fid,'k\t\tx (k)\t\t\t\t\t\t\tError\n');

	t = a:0.01:b;
	
	fx = inline(f);
	gx = inline(g);
	func = fx(t);
	
	iter = 1;
	x = x1;
	incr = tol+1;
	errores = incr;
	imagenes = [ ];
	while incr > tol && iter <= maxiter
		x(iter+1) = feval(gx,x(iter));
		incr = abs(x(iter+1)-x(iter));
		errores =[errores,incr];
		iter++;
	end

	iter2 = 1:iter;
	fc1 = feval(fx,x);
	imagenes = [imagenes,fc1];

	e = abs(diff(x));
    	tcl = e(2:end) ./ e(1:end-1); %Tasa de convergencia lineal
    	tcc = e(2:end) ./ e(1:end-1).^2; %Tasa de convergencia cuadratica
    	%tccubica = e(3:end)./e(1:end-1).^3; %Tasa de convergencia cubica

    	XR = x(2:end);
    	XL = x(1:end-1);
    	format free;
    	dg = diff(XR)./diff(XL);

	if incr > tol
		sol = [ ];
		disp('Insuficientes iteraciones');
	else
		sol = x(end);
		for k=1:iter
			fprintf(fid,'%.0f\t\t%.15f\t\t%.15f\n',iter2(k),x(k),errores(k));
		end
		fprintf (fid,'\nLa solución es %.15f.\nSe ha alcanzado en %d iteraciones.\nCon un error de %e',sol,iter,errores(end));
		%fprintf(fid,'\n\nTasa De Convergencia Cubica\n%.15f',tccubica');
		fclose(fid);
		printf ('La solucion es %.15f, y se ha alcanzado en %d iteraciones.\n',
             sol, iter);
	end
	clf();
	figure(1),
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
	title('Metodo Punto Fijo');
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
	title('Tendencia de errores en el Punto Fijo');
 	legend({'Errores','Puntos Errores'},'location','southoutside');
 	legend boxon;
 	xlabel('Numero Iteraciones');
 	ylabel('Errores');
 	set (get (gca, 'ylabel'), 'rotation', 360);

 	 figure(2);
 	       subplot(1,2,1);
	       plot(iter2(1:length(tcl)),tcl)
	       set (gca, 'xaxislocation', 'bottom');
	       set (gca, 'yaxislocation', 'right');
	       set(gca, 'box', 'off');
	       grid;
	       title('Tasa Convergencia Lineal Punto Fijo');
	       legend({'T.C.L.'},'location','southoutside');
	       legend boxon;
	       xlabel('Numero Iteraciones');
	       ylabel('tcl');
	       subplot(1,2,2);
	       plot(iter2(1:length(tcc)),tcc)
	       set (gca, 'xaxislocation', 'bottom');
	       set (gca, 'yaxislocation', 'right');
	       set(gca, 'box', 'off');
	       grid;
	       title('Tasa Convergencia Cuadratica Newton');
	       legend({'T.C.C.'},'location','southoutside');
	       legend boxon;
	       xlabel('Numero Iteraciones');
	       ylabel('tcc');
end