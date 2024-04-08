function u = bimatiki(t, tstep)
% Synartisi gia tin ataskeyi / Dhmiorgia bimatikis synartisis
% Ta input pou pairnei :
% t (diansyma xroon / samples)
% tstep (xroniki stigmi allagis)
% epistrefei to dianysma u
for i=1:length(t)
    if t(i)>=tstep
        u(i) = 1;
    else
        u(i) = 0;
    end
end
end

