function A = Gauss1new(A,b)
%UNTITLED Summary of this function goes here
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
for i = 2:n
% �������� ��� 2 ����� �� �������� �� ������� 2,3,4 ,...,n ���� ��� � ������ 1.
     L(i,1) = A(i,1)/A(1,1) ;
     for j = 1:n+1
         A(i,j) = A(i,j)-L(i,1)*A(1,j) ;
     end
end    
         

else
    error('Wrong matrix dimensions');
end    

end

