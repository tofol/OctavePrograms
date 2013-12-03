function y = diodo2(V)
	C0 = 81e-12; fi = 0.6; gama = 0.44; Q= 1e-10;
	y = V*C0 -Q*(1+abs(V)/fi).^gama;
end