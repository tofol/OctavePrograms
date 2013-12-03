function [y w b] = horner(a,x)
  % Input a is the polynomial coefficient vector, x the value to be evaluated at.
  % The output y is the evaluated polynomial and b the divided coefficient vector.
  % horner([1,13,40],1)
  b(1) = a(1);
  
  for i = 2:length(a)
    b(i) = a(i)+x*b(i-1);
  end
  
  y = b(length(a));
  w = polyval(polyder(a),x)
  b = b(1:length(b)-1);
end