function A = Gauss(A,b)
%  Gausssian elimination
%   Detailed explanation goes here
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
A = [A b] ;
for k = 1:(n-1)
    for i = (k+1):n
% �������� ��� 2 ����� �� �������� �� ������� 2,3,4 ,...,n ���� ��� � ������ 1.
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

