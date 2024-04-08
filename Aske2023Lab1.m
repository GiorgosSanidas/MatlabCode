clear all
clc
close all

Pt = [20*1e1 1*1e1 100*1e-3 1*1e-3 300*1e-6 1*1e-6 30*1e-9 10*1e-12]; % 100 mW isxys ekpimpis sta 2.4GHz symfona me tous kanonismous tis EET 
PtdB = 10*log10(Pt/(1e-3))  % Isxys se dB tou Access Point

figure
plot(Pt, PtdB, 'LineWidth',2);
grid on
set(gca,'FontSize',14)
xlabel('Power in Watt')
ylabel('Power in dBm')
title('Absolute Power in Watt versus Power in dBm')

figure
semilogx(Pt, PtdB,'LineWidth',2)
grid on
set(gca,'FontSize',14)
xlabel('Power in Watt')
ylabel('Power in dBm')
title('Absolute Power in Watt versus Power in dBm')
