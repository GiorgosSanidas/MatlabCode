clear all
clc
close all

for f1= [5]
Pt = 1e-3 ; % 100 mW isxys ekpimpis sta 2.4GHz symfona me tous kanonismous tis EET 
PtdBm = 10*log10(Pt/(1e-3))  % Isxys se dB tou Access Point

% f = 0.925*10^9 ;
f = f1*10^9 ;
c = 3*10^8; 
lamda = c./f;


d =[1:1:1000] ;    % distance shmeiou tou kinitou 
L = FreeSpacePathLossdB(d, f) ;

Pmob = PtdBm - L ;  % isxys pou ftaneis sto kinito tou dkti, diladi 
                % isxys pompou meion tis apoleies (free space path loss
                % model dB)

                
                
                
                
                
% plot(f, L);
% grid on 
% title('Apolies os pros ti syxnotita')



plot(d, Pmob,'LineWidth',3);
grid on 
title('Rx power (assuming 1W at the Tx output)');
grid on
set(gca,'FontSize',14)
xlabel('Distance from RRH')
ylabel('Received Power in dBm')
hold on



figure
semilogx(d, Pmob,'LineWidth',3)
grid on
set(gca,'FontSize',14)
xlabel('Distance in m')
ylabel('Received Power in dBm')
title('Semilog plot')

end









%%%%%% Orismos Local functions    
%%%%%% An doulevete se OCTAVE, kante to copy paste to parakato stin arxi tou kodika 
%%%%%% Sto OCTAVE oi functions orizonte stin arxi tou arxeiou, meta ta clear all

function L = FreeSpacePathLossdB (d, freq)
% Ypologizei tis apoleies isxyos 
% se apostasi d kai syxnotita f

c = 3*10^8 ;

arithmitis = 4*pi*d;
paronomastis = c./ freq;
L = 20*log10(arithmitis ./ paronomastis);
end
