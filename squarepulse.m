
function u = squarepulse (t,tpulse,tduration,A)
% Synartisi gia tin kataskeyi / dhmioyrgia palmou synartisis
% ta input pou pairnei :
% t (dianysma xrono / samples)
% tpulse (xroniki stigmi allagis)
% tduration
% A platos palmou
% epistrefei to dianysma u

for i=1:length(t)
  if t(i)<tpulse
    u(i) = 0;
  elseif t(i)<tpulse+tduration
    u(i) = A;
  else
    u(i) = 0;
  end
end
 