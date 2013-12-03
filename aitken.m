function [] =aitken(f,x0,epsilon,max1)
	X=zeros(1,max1+1);
	Z=zeros(1,max1+1);
	X(1)=x0;
	X(2)=feval('colebrook1',X(1));
	X(3)=feval('colebrook1',X(2));
	Z(3)=X(1)-(X(2)-X(1))^2/(X(3)-2*X(2)+X(1));
	for k=4:max1+1
		X(k)=feval('colebrook1',X(k-1));
		denom=X(k)-2*X(k-1)+X(k-2);
		if denom==0
		       'Lo siento, division por cero'
		       break;
		 else
		       Z(k)=X(k-2)-(X(k-1)-X(k-2))^2/denom;
		 endif
		 err=abs(Z(k-1)-Z(k));
		 relerr=err/(abs(Z(k-1))+epsilon);
		 if (err<epsilon) or (relerr<epsilon)
		 	break;
		 endif
	endfor
	
	printf ('La solucion es %.15f, y se ha alcanzado en %d iteraciones.\n',
             X(k), k);
	printf('Con error absoluto ');
	err
	printf('y error relativo ');
	relerr
	clear;
end
		 
		       	
	