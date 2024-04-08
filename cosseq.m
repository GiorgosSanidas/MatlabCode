function [x, n] = cosseq(A, w0, theta0, n1, n2)
% Generates x(n) = Acos(w0n + theta0); n1 <= n <= n2
% --------------------------------------------------
% [x,n] = cosseq(A,w0,theta0,n1,n2)
n = [n1:n2];
x = A*cos(w0*n + theta0);
end
