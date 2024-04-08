clear all
close all;
       
                    
datarate    = 1*1e9;
datapattern = [1 1 1 1 1 1 1 1 1 1 1 1];

Nsymbols    = length(datapattern);
Tsymbol     = 1/datarate;
SymbolSamples = 8;
Dt          = Tsymbol/SymbolSamples ;       % Sampling time
fsampling = 1/Dt ;


% Diansysma xrono prosomoiosis
tstart      = 0 ;           % Xronos enarxis promoiosis
tend        = Nsymbols*Tsymbol;            % Xronos lixis promoiosis
Time    = tend - tstart ;
t       =   [tstart+Dt:Dt:tend];   % plithos 



% diamorfosi tetragonikon palmon me basi to pattern
A       = 0.5;
s       = zeros(1, Nsymbols*SymbolSamples);

for symbol = 1:1:length(datapattern) 
    s((symbol-1)*SymbolSamples+1 : 1 : (symbol-1)*SymbolSamples+SymbolSamples) = ...
            (datapattern(symbol).*ones(1, SymbolSamples)).*...
            hmitono([0:1:SymbolSamples-1]*Dt, 1, 4*datarate, pi/2)    ;
%             squarepulse([0:1:SymbolSamples-1]*Dt, 0, Tsymbol, A)    ;
end


% Prosthiki thorybou 
% pkg load communications     % used in OCTAVE ONLY  (insert comment %)
noise_par       = 30;
s_withNoise    = awgn(s,noise_par, 10*log10( isxys(Dt, s))) ;
noise_time      = s_withNoise - s;






% Ypologismoi Metrikos Apodosi

Esignal = energia(Dt, s_withNoise); 
Psignal = isxys(Dt, s_withNoise) ;
SNR     = 10*log10(isxys(Dt, s_withNoise-noise_time) / isxys(Dt, noise_time)) ;
paprsignal    = PAPR(Dt, s_withNoise) ;

formatSpec = ' Energia is %4.2e J \n Power is %4.2f W \n SNR is %4.2f dB \n PAPR is %4.2f dB \n';
fprintf(formatSpec, Esignal, Psignal, SNR, paprsignal)




% koino plot of all waveforms 
figure
subplot (2,2,1)
plot(t, s_withNoise,'-', 'linewidth', 1);
hold on; plot(t, s_withNoise-noise_time,'-', 'linewidth', 3);
hold off
grid on
axis([tstart tend (min(s_withNoise)-0.2) (max(s_withNoise)+0.2)])
xlabel('Time in second')
ylabel('Signal m1');
legend('signal with noise','signal without noise')

subplot (2,2,2)
edges = linspace((min(s_withNoise)-0.2), (max(s_withNoise)+0.2)); 
histogram(s_withNoise, 'normalization', 'pdf', 'orientation','horizontal', 'BinEdges', edges);  % for users of MATLAB

% hist(s_withNoise);  % for users of OCTAVE
grid on



% Diagramm Ofthalmou
subplot (2,2,3)
hold on
for symbol = 2:1:length(datapattern)-1 
    plot([-1:1:SymbolSamples+1]*Dt, s_withNoise((symbol-1)*SymbolSamples : 1 : (symbol-1)*SymbolSamples+SymbolSamples+2), 'b-o');
end
hold off
grid on
xlabel('Time in second')
ylabel('Signal eye diagram');
legend('signal with noise','signal without noise')


%% Ypologismos Fasmatos - Fourier 
            m1      = s_withNoise;           % synartisi sto xrono gia to metasximatismo Fourier 
            N       = 2048 ;         % Simata sto fasma  
            M1      = abs(fft(m1,N))/N;
            M1      = fftshift(M1);
            f       = [-N/2:N/2-1] * (fsampling/N);

            subplot (2,2,4)
            plot(f, M1);
            grid on
            axis ([-max(f) max(f) 0 max(M1)+0.05])
            xlabel('Frequency in Hz')


            
            figure            
            plot(f, M1);
            grid on
            axis ([-max(f) max(f) 0 max(M1)+0.05])
            xlabel('Frequency in Hz')
%             
%             figure            
%             stem(f, M1);
%             grid on
%             axis ([-max(f) max(f) 0 max(M1)+0.05])
%             xlabel('Frequency in Hz')