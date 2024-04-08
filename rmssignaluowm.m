function rms = rmssignaluowm(x)
    % Υπολογισμός της ενεργού τιμής (RMS) του σήματος
    rms = sqrt(mean(x.^2));
end