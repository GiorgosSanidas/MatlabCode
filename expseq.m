function [x,n] = expseq(sigma, omega0, n1, n2)
n = [n1:n2];
x = exp((sigma + 1i*omega0).*n);


