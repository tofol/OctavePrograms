function [] = newton(f,df,x1,a,b,tol,maxiter)
  
    filename = 'newtonraphson.txt';
    fid = fopen(filename,'w');
    fprintf(fid,'k\t\tx (k)\t\t\t\t\t\t\tError\n');

    tic;
    fx = inline(f);
    dfx = inline(df);
    t = x1-5:0.01:x1+5;
    
    func = fx(t);

	k = 1;
	x = x1;
	incr = tol+1;
    sol = [ ];
    errores = incr;
    imagenes = [ ];
	while incr > tol && k <= maxiter
		delta = -feval(fx,x(k))/feval(dfx,x(k));
		x(k+1) = x(k) + delta;
		incr = abs(delta);
		errores =[errores,incr];
                        sol =  [sol,x];
		k = k+1;
	end

   display('El algoritmo tiene un coste en tiempo de: ')
   toc;
   iter2 = 1:k;
    fc1 = feval(fx,sol);
    imagenes = [imagenes,fc1];

    e = abs(diff(x));
    tcl = e(2:end) ./ e(1:end-1); %Tasa de convergencia lineal
    tcc = e(2:end) ./ e(1:end-1).^2; %Tasa de convergencia cuadratica

	if incr > tol
		sol = [ ];
		disp('Diverge o insuficientes iteraciones');
	else
		sol = x(end);
        for m=1:k
            fprintf(fid,'%.0f\t\t%.15f\t\t%.15f\n',iter2(m),x(m),errores(m));
        end
        fprintf (fid,'\nLa solución es %.15f.\nSe ha alcanzado en %d iteraciones.\nCon un error de %e\n\n',sol(end),k,errores(end));
        printf ('La solucion es %.15f, y se ha alcanzado en %d iteraciones.\n',
             sol,k);
	end
       fprintf(fid,'Tasa de convergencia lineal = %f \n',tcl);
       fprintf(fid,'Tasa de convergencia cuadratica = %f \n',tcc);
       fclose(fid);

        clf();
        figure(1);
        subplot(1,3,1);
        fplot(fx,[a,b]);
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
        plot(t,func,sol,imagenes,'*r')
        set (gca, 'xaxislocation', 'zero');
        set (gca, 'yaxislocation', 'zero');
        set(gca, 'box', 'off');
        grid;
        title('Metodo Newton Raphson');
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
       title('Tendencia de errores en Newton');
       legend({'Errores', 'Puntos Errores'},'location','southoutside');
       legend boxon;
       xlabel('Numero Iteraciones');
       ylabel('Errores');

       figure(2);
       subplot(1,2,1);
       plot(iter2(1:length(tcl)),tcl)
       set (gca, 'xaxislocation', 'bottom');
       set (gca, 'yaxislocation', 'right');
       set(gca, 'box', 'off');
       grid;
       title('Tasa Convergencia Lineal Newton');
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