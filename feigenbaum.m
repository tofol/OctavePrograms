function feigenbaum
	p=0; q=4; % Rango de variacion del parametro
	r=0; s=1; % Intervalo de valores de la iteracion
	h = (q-p)/500;
	X = zeros(1,100001); Y=X;
	j = 1;
	for a = p:h:q % Parámetro
		x = 0.5; % Estimacion Inicial
		for k=1:400 % Iterados
			x = a*x*(1-x);
			if k>200 % Dibuja el punto
				X(j) = a;
				Y(j) = x;
				j++;
			end
		end
		j-1;
	end

	clf();
	plot(X,Y,'.r')
	axis([p,q,r,s])
end