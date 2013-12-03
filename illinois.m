function []=illinois(f,a,b,delta,epsilon,max1)
%a,b extremos del intervalo que enmarca la raiz
%a=
%b=
%delta es la tolerancia para la raiz y epsilon para el valor de la funcion
%delta=
%epsilon=
%max1=
% max1 es el numero maximo de tolerancias
fx = inline(f);
ya=feval(fx,a);
yb=feval(fx,b);
%Evalua la funcion en los extremos del intervalo donde presuntamente se
%encuentra la raiz.
if ya*yb>0
    disp('¡Ojo!: f(a)*f(b)>0')
    break,
end
%Aqui no hay raiz en el intervalo en estudio.
for k=1:max1
    dx=yb*(b-a)/(yb-ya);
    c=b-dx;
%Se define la abcisa del punto c interseccion de la secante por
%(a,ya),(b,yb) con el eje x
    ac=c-a;
    yc=feval(fx,c);
%y se evalua su ordenada sobre la curva.
    if yc==0
       break;
%ya tenemos la solucion
elseif  yb*yc>0
%una vez que sabemos que no es la raiz debemos saber en que intervalo (a,c)
%o (c,b) esta la raiz buscada, luego estudiamos los signos de yb*yc y de
%ya*yc
    b=c;
    ya=(0.5)*ya;
    yb=yc;
%en este caso el nuevo intervalo (a,c) y multiplicamos la ya por 0.5
    else
        a=c;
        ya=yc;
        yb=(0.5)*yb;
    end
%aqui el nuevo intervalo es (c,b)
dx=min(abs(dx),ac);
if abs(dx)<delta
      break;
end
if abs(yc)<epsilon
    break;
end
end
err=abs(b-a)/2;
yc=feval(fx,c);
printf ('La solucion es %.15f, y se ha alcanzado en %d iteraciones.\n',c, k);
printf ('Con un error de %e\n',err);
printf('Con f(raiz)=%e\n',yc);
clear;
end