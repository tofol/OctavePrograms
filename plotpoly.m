% Ejemplo de uso plotpoly(-2,2,[2 0 -3 -1],'2x^3-3x^2-1')
function [] = plotpoly(a,b,p,funtitle)
 x = linspace(a,b);
 p1 = [ ];
 p1 = p;
 y = polyval(p1,x);
 plot(x,y)
 grid on;
 title('Grafica De La Funcion Polinomica');
 legend({funtitle},'location','northeast');