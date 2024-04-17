function [A1,b1] = Gauss1(A,b)
%UNTITLED Summary of this function goes here
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
A1 = zeros(n) ;
A1(1,:) = A(1,:) ;
b1 = zeros(n,1);
b1(1) = b(1);
for i = 2:n
% ξεκινάει απο 2 γιατί θα αλλάξουν οι γραμμές 2,3,4 ,...,n αλλά όχι η γραμμή 1.
     L(i,1) = A(i,1)/A(1,1) ;
     for j = 1:n
         A1(i,j) = A(i,j)-L(i,1)*A(1,j) ;
     end
     b1(i) = b(i) -L(i,1)*b(1) ;
end    
         

else
    error('Wrong matrix dimensions');
end    

end

