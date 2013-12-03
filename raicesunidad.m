% PARA QUE FUNCIONE HAY QUE TENER INSTALADO EL PAQUETE GEOMETRY DE OCTAVE-SOURCEFORGE
% ESTA EN LA WEB http://octave.sourceforge.net/geometry/index.html
% ANTES DE EJECUTAR EL CODIGO DESDE OCTAVE EJECUTA LA ORDEN 
% pkg load all

clear;
clf();
hold on; axis equal; 
axis ([-1.5, 1.5,-1.5,1.5], 'square');
grid;
n=11;

for k =1:11
	h(k)=0;
end

for k=0:10
	x(k+1)=cos(((2*k+1)*pi)/n);
	y(k+1)=sin(((2*k+1)*pi)/n);
	if(x(k+1)>0 && y(k+1)>0 || x(k+1)>0 && y(k+1)<0)
		h(k+1) = drawLabels(x(k+1)+0.1,y(k+1)+0.1,['\omega_' num2str(k)]);
	else
		h(k+1) = drawLabels(x(k+1)-0.25,y(k+1)+0.1,['\omega_' num2str(k)]);
	end
end

for k = 8:11 
	delete(h(k));
end

drawLabels(x(8)-0.25,y(8),'\omega_{7}');
drawLabels(x(9),y(9)-0.1,'\omega_{8}');
drawLabels(x(10),y(10)-0.1,'\omega_{9}');
drawLabels(x(11)+0.1,y(11),'\omega_{10}');

p1 = [1 0];
p2 = [0 1];
p3 = [-1 0];
origin = [0 0];

circle = createCircle(p1, p2,p3);

drawCircle (circle,'r','LineWidth',2);
patch(x,y,'b','EdgeColor','b','Marker','o','MarkerFaceColor','flat','MarkerSize',8,'LineWidth',2,'FaceAlpha',0.15);

for k=0:10
	edge = [0 0 x(k+1) y(k+1)]; 	
	drawEdge(edge, 'linewidth', 1.15,'color','b');
end

title('Raices onceavas de la unidad');

