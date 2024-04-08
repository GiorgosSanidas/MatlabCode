function output_signal = expuowm(N, f)
    % Υπολογισμός της γωνιακής συχνότητας
    w = 2*pi*f;
    
    % Δημιουργία του διανύσματος των δειγμάτων
    n = 0:N-1;
    
    % Υπολογισμός των τιμών exp(j*w*n)
    output_signal = exp(1i * w * n);
end
