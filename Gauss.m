function A = Gauss(A,b)
%  Gausssian elimination
%   Detailed explanation goes here
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
A = [A b] ;
for k = 1:(n-1)
    for i = (k+1):n
% ξεκινάει απο 2 γιατί θα αλλάξουν οι γραμμές 2,3,4 ,...,n αλλά όχι η γραμμή 1.
         L(i,k) = A(i,k)/A(k,k) ;
         for j = k:n+1
              A(i,j) = A(i,j)-L(i,k)*A(k,j) ;
         end
     end    
end         

else
    error('Wrong matrix dimensions');
end    

end

