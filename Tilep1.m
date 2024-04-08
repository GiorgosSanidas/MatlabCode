clear all
clc

Dt      = 0.1;          % Sampling Time
tstart  = -1;           % Xronos enarxis promoiosis
tend    = 3;            % Xronos lixis promoiosis
t = [tstart:Dt:tend];   % dianysma Xronou

plot(t); 
grid on; 
title('Lab 1 plot');

% Kataskeyi / Dhmiorgia bimatikis synartisis
for i=1:length(t)
    if t(i)>=0
        u(i) = 1;
    else
        u(i) = 0;
    end
end

plot(t, u);
grid on;
title('Bimatiki')
    



% Kataskeyi / Dhmiorgia epiklinis synartisis
for i=1:length(t)
    if t(i)>=0
        r(i) = t(i);
    else
        r(i) = 0;
    end
end

figure;
plot(t, r);
grid on; title('Epiklinis')
    
