function x = bsub(A,b)
% performs backward substitution
% A upper triangular
[ma,na] = size(A) ;
[mb,nb] = size(b) ;
if ma == na & na == mb  & nb == 1
    n = ma ;
    x = zeros(n,1) ;
    
    for i = n:-1:1
         x(i) = b(i) ;
         for j = i+1:n
              x(i) = x(i) - A(i,j)*x(j) ;
         end
         x(i) = x(i)/A(i,i) ;
    end
    
else
    error('matrix dimensions do not agree');
end    

end

