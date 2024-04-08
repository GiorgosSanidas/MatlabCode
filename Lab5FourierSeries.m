% Fourier series coefficients
% check syntelestes
 
clear all;
clc; 
close all;

% pkg load symbolic %%%  enable/uncomment this command for octave users only
syms x      
pi  = 3.14; 
sum = 0;  

% function you want 
y  = x  ; 
% ##y  = 2*x ; 
% ##y  = exp(x/3);
% ##y  = cos(x);

a0  = (1/pi)*int(y,x,-pi,pi); 

            figure
            ezplot(x,y,[-pi,pi]); 
            hold on; grid on;
            ezplot(x,a0/2,[-pi,pi]); 
sum = sum+a0/2 ;
for n=1:4
     %finding the coefficients 
    an=(1/pi)*int(y*cos(n*x),x,-pi,pi); 
    bn=(1/pi)*int(y*sin(n*x),x,-pi,pi);    
    sum=sum+(an*cos(n*x)+bn*sin(n*x));  
            ezplot(x,sum,[-pi,pi]); 
end 
            hold off, legend('Real','DC term','First term','Second term...')


figure
ezplot(x,y,[-pi,pi]); 
grid on;hold on;  
ezplot(x,sum,[-pi,pi]); 
hold off



