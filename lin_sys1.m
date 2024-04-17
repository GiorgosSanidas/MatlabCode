function x = lin_sys1(A,b)
%  Finds the solution of the system Ax=b
%   
[ma,na] = size(A) ;
[mb,nb] = size(b) ;
if ma==na & ma==mb & nb == 1
% ma==na ο πίνακας Α είναι τετραγωνικός
% ma==mb ο πολλαλπασιαμός του Α με ένα διάνυσμα x να δίνει διάνυσμα με ma
%                γραμμές
% nb == 1 το διάνυσμα δεξιού μέλους b να έχει μια στήλη μόνο
% τότε η λύση είναι ένας πίνακας διάστασης na x 1
n = ma ;
% είναι n=ma=na=mb

% Gaussian elimination
A = [A b] ;
for k = 1:(n-1)
    for i = (k+1):n
% ξεκινάει απο 2 γιατί θα αλλάξουν οι γραμμές 2,3,4 ,...,n αλλά όχι η γραμμή 1.
         L(i,k) = A(i,k)/A(k,k) ;
         A(i,k:n+1) = A(i,k:n+1) - L(i,k)*A(k,k:n+1) ;
    end    
end         
b = A(:,n+1) ;  % προσοχή δεν πρέπει να αλλάξω τη σειρά των γραμμών 24 και 25 !!!!
A = A(:,1:n) ;
% backward substitution
    x = zeros(n,1) ;
    for i = n:-1:1
          x(i) = (b(i) - A(i,i+1:n)*x(i+1:n))/A(i,i) ;
    end
else
    error('Wrong matrix dimensions');
end    

end

