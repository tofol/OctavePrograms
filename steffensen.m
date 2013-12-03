function []=steffensen(fx,x0,a,b,tolx,nmax) 
        filename = 'steffensen.txt';
        fid = fopen(filename,'w');
        fprintf(fid,'k\t\tx (k)\t\t\t\t\t\t\tError\n');

        f = inline(fx);
        t = a:0.01:b;
        func = f(t);
        err=tolx+1; 
        x=x0; 
        phi=0;
        iter = 0; 
        errores = [ ];
        sol = [ ];
        imagenes = [ ];

        while iter < nmax && err > tolx
                xx=x; 
                fxk=feval(f,x); 
                tolf=tolx*abs(phi); 
                if abs(fxk)<=tolf 
                        break 
                end     
                fxk2=feval(f,x+fxk);
                phi=(fxk2-fxk)/fxk; 
                x=xx-fxk/phi; 
                err=abs(x-xx);
                errores =[errores,err];
                sol =  [sol,x];
                iter++; 
        end
        
        iter2 = 1:1:iter;
        fc1 = feval(f,sol);
        imagenes = [imagenes,fc1];

        for k=1:iter
            fprintf(fid,'%.0f\t\t%.15f\t\t%.15f\n',iter2(k),sol(k),errores(k));
        end
        fprintf (fid,'\nLa solución es %.15f.\nSe ha alcanzado en %d iteraciones.\nCon un error de %e',sol(end),iter,errores(end));
        fclose(fid);
        printf ('La solucion es %.15f, y se ha alcanzado en %d iteraciones.\n',
             sol(end),iter);
        
        clf();
        subplot(1,3,1);
        fplot(f,[a,b])
        set (gca, 'xaxislocation', 'zero');
        set (gca, 'yaxislocation', 'zero');
        set(gca, 'box', 'off');
        grid;
        title('La Funcion');
        legend({fx},'location', 'southoutside');
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
        title('Metodo Steffensen');
        legend({fx,'Aproximaciones'},'location','southoutside');
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
        title('Tendencia de errores en Steffensen');
        legend({'Errores', 'Puntos Errores'},'location','southoutside');
        legend boxon;
        xlabel('Numero Iteraciones');
        ylabel('Errores');
        set (get (gca, 'ylabel'), 'rotation', 360);
end