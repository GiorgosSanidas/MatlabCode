function [L,A] = myLU(A)
%  Gausssian elimination
%   Detailed explanation goes here
[m,n] = size(A) ;
if m == n 
% m==n ο πίνακας Α είναι τετραγωνικός
L = eye(n) ;
for k = 1:(n-1)
    for i = (k+1):n
         L(i,k) = A(i,k)/A(k,k) ;
         for j = k:n
              A(i,j) = A(i,j)-L(i,k)*A(k,j) ;
         end
     end    
end         
else
    error('Wrong matrix dimensions');
end    

end

