function x = lin_sys1(A,b)
%  Finds the solution of the system Ax=b
%   
[ma,na] = size(A) ;
[mb,nb] = size(b) ;
if ma==na & ma==mb & nb == 1
% ma==na � ������� � ����� ������������
% ma==mb � �������������� ��� � �� ��� �������� x �� ����� �������� �� ma
%                �������
% nb == 1 �� �������� ������ ������ b �� ���� ��� ����� ����
% ���� � ���� ����� ���� ������� ��������� na x 1
n = ma ;
% ����� n=ma=na=mb

% Gaussian elimination
A = [A b] ;
for k = 1:(n-1)
    for i = (k+1):n
% �������� ��� 2 ����� �� �������� �� ������� 2,3,4 ,...,n ���� ��� � ������ 1.
         L(i,k) = A(i,k)/A(k,k) ;
         A(i,k:n+1) = A(i,k:n+1) - L(i,k)*A(k,k:n+1) ;
    end    
end         
b = A(:,n+1) ;  % ������� ��� ������ �� ������ �� ����� ��� ������� 24 ��� 25 !!!!
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

