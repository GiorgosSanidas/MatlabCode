function py = Lagrange(x,f,y)
% Lagrange Interpolation
nx = length(x) ;
nf = length(f) ;

if  nx==nf
    n = nx ;
    py = 0 ;
    for i = 1:n
        L(i)  = 1 ; 
        for  j = 1:n
            if j ~= i 
               L(i) = L(i)*(y-x(j))/(x(i)-x(j)) ;
            end   
        end
        py = py + f(i)*L(i) ;
          
    end
else
    error('vectors x and f must have the same length') ;
end

end

