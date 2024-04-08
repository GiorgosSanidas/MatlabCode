close all
clear all
clc

% Diansysma xrono prosomoiosis
Dt      = 0.1;          % Sampling Time
tstart  =0 ;           % Xronos enarxis promoiosis
tend    =6;            % Xronos lixis promoiosis
t = [tstart:Dt:tend];   % dianysma Xronou

tpulse    = 0;
tduration = 1;
A         = 1;

s1=squarepulse(t,tpulse+1,tduration,A*2);
s2=squarepulse(t,tpulse+4,tduration+1,A);
%
s=s1+s2;

figure
plot(t, s1);
hold on
plot(t, s2);
%
plot(t,s);
xlabel('Time in sec');  ylabel('Amplitude')
grid on; % den vgeni tetragono dioti to sampling time Dt den ine arketa 

energy1=energia(Dt,s1)
energy=energia(Dt,s)
dclevel1=Dclevel(Dt,s1)
dclevel=Dclevel(Dt,s)