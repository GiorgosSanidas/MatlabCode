function [A1,b1] = Gauss1(A,b)
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
A1 = zeros(n) ;
A1(1,:) = A(1,:) ;
b1 = zeros(n,1);
b1(1) = b(1);
for i = 2:n
% �������� ��� 2 ����� �� �������� �� ������� 2,3,4 ,...,n ���� ��� � ������ 1.
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

