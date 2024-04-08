function r = epiklinis(t, tstep)
% Synartisi gia tin kataskeyi / Dhmiorgia 
% tis synartisis rampas i allios epiklinis synartisi
% Ta input pou pairnei :
% t (diansyma xrono / samples)
% tstep (xroniki stigmi allagis)
% epistrefei to dianysma u
for i=1:length(t)
    if t(i)>=tstep
        r(i) = t(i) - tstep;
    else
        r(i) = 0;
    end
end