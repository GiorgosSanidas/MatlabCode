clear all
clc
close all

for f1= [0.9]
Pt = 1 ; % 100 mW isxys ekpimpis sta 2.4GHz symfona me tous kanonismous tis EET 
PtdBm = 10*log10(Pt/1e-3)  ; % Isxys se dB tou Access Point

% f = 0.925*10^9 ;
f = f1*10^9 ;
c = 3*10^8; 
lamda = c./f;


d =[1:1:1000] ;    % distance shmeiou tou kinitou 
d_freespace = 10;       % apostasi anaforas pou theoreitai free space
napolion    = 4;      % syntelestis apolion
sigma       = 4;        % diaspora kanonikis katanomis paragonta Xs    

L = GenLog_Lossmodel_n(f, d_freespace, d, napolion, sigma); 

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












%%%%% Trito thema

%%%%%%%%%%%%%%%% DEytero kommati
%%%% Polles Metriseis sto IDIO shmeio
distance = 500;
Nsamples = 10000;
L2samples= zeros(1, Nsamples); 
Prsamples= zeros(1, Nsamples); 

for i=1:1:Nsamples
    L2samples(i) =  GenLog_Lossmodel_n(f, d_freespace, distance, napolion, sigma); 
    Prsamples(i) = Pt - L2samples(i);
end


% koino plot of all waveforms 
figure
plot([1:1:Nsamples], Prsamples) ; 
xlabel('Measurement Sample');
ylabel('Received Power [dBm]')
grid on 

figure
subplot (2,1,1)
hist(L2samples); 
xlabel('Measured Losses [dBm]');
ylabel('Number of Measurements')
grid on  

subplot (2,1,2)
hist(Prsamples); 
xlabel('Measured Received Power [dBm]');
ylabel('Probability Distribution')
grid on  















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



function y = GenLog_Lossmodel_n(freq, do_ref, distance, n, sigma)
%  se apolites times to Preceived os pros to Ptransmitted stin apostasi
%  anaforas
%  freq = syxnotita leitourgias
%  do_ref = i apostosi apo keraia pou isyxei free space loss
%  distance = apostasi tou dekti
%  n paragontas apolion (times p.x. 2.5 - 4.5)


%%%% oti kai sto FreeSpaceLosss (8a mporousame na bazame y=FreeSpaceLosss)
%%%% allaan mono oi syntelestes apo se do_ref
c = 3*10^8;  % taxytita tou fotos
arithmitis  = 4*pi*do_ref ;
paronomastis= c/freq ;
LFreeSpace_ref =  20*log10( arithmitis / paronomastis) ;

y = zeros(1, length(distance));
    for i=1:1:length(distance)
        if (distance(i)<do_ref)
            y(i) = FreeSpacePathLossdB(freq, distance(i));
            
        else
            Oros_napolion = 10*n*log10(distance(i)/do_ref);
            XorosNormal       = sigma*randn(1) ;
            
            Apolies = LFreeSpace_ref + Oros_napolion + + XorosNormal; 
            y(i) = Apolies ;
        end
    end
    
end