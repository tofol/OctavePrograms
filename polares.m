function [] = polares(z,n)
	% Introducimos z como el complejo y n el grado del polinomio.

	for k=0:n
		theta(k+1)=((arg(z)+2*k*pi)/n); %Calculamos todos los argumentos
		rho(k+1)=abs(z); %Establecemos los radios que son siempre el mismo
	end
    %El bucle for es necesario que acabe en n para que al dibujar el poligono,
    %se una el último punto con el primer punto

	eopen('polar.eps'); %Con epstk es necesario crear un fichero eps
	clf;
	eglobpar; %Accedemos a los parámetros globales de epstk para poder modificarlos.
	ePlotTitleDistance = 25; %Modificamos este parámetro por cuestiones de estética
	titulo = sprintf('Raices %d - esimas',n); %Creamos el titulo de la imagen
	ePlotTitleText = titulo; %Establecemos el título en epstk
	eaxespol([0 0.4 abs(z)],[0 round(180/n) 360]); %Especificamos los intervalos de los ejes polares
	%En el primero el intervalo del radio y en el segundo el de los grados.
	ePolarRadiusGridColor = [1 0 0]; %Ponemos en rojo la malla de los radios polares
	ePolarAngleGridColor = [0 0 1]; %Ponemos en azul la malla de los grados polares
	%Formateamos correctamente el texto de la leyenda, según el complejo sea real, imaginario puro,
	% o su parte real e imaginaria sean no nulas
	if(imag(z)==0) 
		leyenda = sprintf('Poligono Regular %d lados de z = %.2f',n,real(z));
	elseif(real(z)==0)
		leyenda = sprintf('Poligono Regular %d lados de z = %.2f i',n,imag(z));
	else
		leyenda = sprintf('Poligono Regular %d lados de z = %.2f + %.2f i',n,real(z),imag(z));
	end
	epolar(theta,rho,leyenda,0,[0 0 1],1.25); %Dibujamos el polígono con nuestra leyenda.
	epolar;
	eclose; %Cerramos nuestro fichero eps, es obligatorio.
	eview;  %Visualizamos la imagen.
	clear;  %Limpiamos todo para cuando volvamos a ejecutar nuestra función no se solapen imágenes anteriores.
end