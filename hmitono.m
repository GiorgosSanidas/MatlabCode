function s = hmitono(t, A, freq, phi)
% Synartisi gia tin kataskeyi / Dhmiorgia 
% tis synartisis hmitonou tou mathimatos
% Ta input pou pairnei :
% t (diansyma xrono / samples)
% A (polatos hmitonou)
% freq (syxnotita)
% phi (strofi fasis arxiki)
wmega = 2*pi*freq;
for i=1:length(t)
    s = A*sin(wmega.*t + phi);
end