close all
clear all
clc

% Diansysma xrono prosomoiosis
Dt      = 0.1;          % Sampling Time
tstart  = -1;           % Xronos enarxis promoiosis
tend    = 5;            % Xronos lixis promoiosis
t = [tstart:Dt:tend];   % dianysma Xronou


tstep = 2;
u = bimatiki(t, tstep);
u = 3*u;
 

    

tstep =2 ;
r = epiklinis(t, tstep);

plot(t, u);
grid on;
hold on
plot(t, r);
grid on; 
legend('Bimatiki','Epiklinis');
xlabel('Time in sec');  ylabel('Amplitude')
title('Koino Plot tis bimatikis kai tis Epiklinis')
hold off

y1 = hmitono(t, 10, 2, 0);
figure
plot(t, y1);
xlabel('Time in sec');  ylabel('Amplitude')
grid on; 


