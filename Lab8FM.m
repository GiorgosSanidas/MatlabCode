clear all
close all;
N       =   1*1024;      % Mikos DFT, sampling rate 
                    % =size(Y), to plithos ton stoixeion tou FFT. Eina apisi kai to plithos ton stoixeion tou ifft, 
                    %  diladi tou exagomenou sxedon-real sima.  ==> ara oso to plithops ton deigamton ston xrono.
                    
tstart  = 0;  
tstop   = 0.5;	
Time    = tstop - tstart ;
Tsampling = Time/N ;     
Dt      = Tsampling;    
fsampling = 1/Tsampling ;

t       =   [tstart:Tsampling:tstop];   % plithos 



%%%%%% Ergastiriou 8  - Analogikes DIAMORFOSeis
fc      = 100 ;   % syxnotita ferontos
Ac      = 2 ;   % platos ferontos
feron   = Ac*cos(2*pi*t*fc);  % sima diamorfosis - pliroforia

fdata   = 2 ;  % syxnotita dedomenon / dedomenon
Amt     = 1  ;  % platos pliroforias / dedomenon
mt      = Amt*cos(2*pi*t*fdata);  % sima diamorfosis - pliroforia


%%%  Phase Modulation 
Kp      = 1;    % euaisthisia fasis tou diamorfoti
y1      = Ac*cos(2*pi*fc*t + Kp*mt);

%%%  Frequency Modulation 
Kf      = 1;    % euaisthisia tis syxnotitas tou diamorfoti
y2      = Ac*cos(2*pi*(fc+ Kf*mt).*t);
%%%  Single Sideband Amplitude Modulation 

s = y2;  % bothitiki metabliti simatos gia tin analysi 
% Prosthiki thorybou 
% pkg load communications     % used in OCTAVE ONLY  (insert comment %)
noise_par       = 30;
s_withNoise    = awgn(s, noise_par, 10*log10(isxys(Dt, s))) ;
noise_time      = s_withNoise - s;


% Ypologismoi Metrikos Apodosi
Esignal = energia(Dt, s_withNoise); 
Psignal = isxys(Dt, s_withNoise) ;
SNR     = 10*log10(isxys(Dt, s_withNoise-noise_time) / isxys(Dt, noise_time)) ;
paprsignal    = PAPR(Dt, s_withNoise) ;

formatSpec = ' Energia is %4.2e J \n Power is %4.2f W \n SNR is %4.2f dB \n PAPR is %4.2f dB \n';
fprintf(formatSpec, Esignal, Psignal, SNR, paprsignal)

% bothitiki synartisi gia tin analysis sto xrono kai gia to metasximatismo Fourier 
m1      = s_withNoise ; 
M1      = abs(fft(m1,N))/N;
M1      = fftshift(M1);
f       = [-N/2:N/2-1] * (fsampling/N);



% koino plot of all waveforms 
subplot (2,1,1)
hold on 
plot(t, feron, '--');
plot(t, mt, 'g--'); 
plot(t, m1,'r-');
hold off
axis([tstart tstop (min(m1)-1) (max(m1)+1)])
grid on
legend('Feron','Arxiki Pliroforia','Diamorfomeno Sima')
xlabel('Time in second')
ylabel('Signal m1');

subplot (2,1,2)
plot(f, M1);
grid on
axis ([-max(f) max(f) 0 max(M1)+0.2])
xlabel('Frequency in Hz')

