% Probar con muller('fun_muller',-1,-0.5,0,0.00001,30)
function []=muller(f,p0,p1,p2,tol,maxiter)
    a = p0;
    b = p2;
    fx = inline(f);
    fplot(fx,[a-3,b+3])
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

    fx = inline(f);
    
    h1=p1-p0;
    h2=p2-p1;

    d1=(feval(fx,p1)-feval(fx,p0))/h1;
    d2=(feval(fx,p2)-feval(fx,p1))/h2;
    d=(d2-d1)/(h2+h1);
    count=3;
    h=1;

    while count < maxiter && abs(h)>tol
        b=d2+h2*d;
        D=sqrt(b^2-4*feval(fx,p2)*d);
        if abs(b-D)<abs(b+D)
            E=b+D;
        else
            E=b-D;
        end
        h=-2*feval(fx,p2)/E;
        sol=p2+h;
        
        if abs(h)>tol
            p0=p1;
            p1=p2;
            p2=sol;
            h1=p1-p0;
            h2=p2-p1;
            d1=(feval(fx,p1)-feval(fx,p0))/h1;
            d2=(feval(fx,p2)-feval(fx,p1))/h2;
            d=(d2-d1)/(h2+h1);
            count++;
        end
    end
     printf ('La solucion es %s.\nY su solucion conjugada es %s\nSe ha alcanzado en %d iteraciones.\n',num2str(sol),num2str(conj(sol)),count);
end