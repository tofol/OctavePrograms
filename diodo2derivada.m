function dy = diodo2derivada(V)
	C0 = 81e-12; fi = 0.6; gama = 0.44; Q= 1e-10;
	dy = C0-gama*Q/fi*(1+V).^(gama-1);
end