function output_signal = cosuowm(N, f)
    % Υπολογισμός της γωνιακής συχνότητας
    w = 2*pi*f;
    
    % Δημιουργία του διανύσματος των δειγμάτων
    n = 0:N-1;
    
    % Υπολογισμός των τιμών cos(w*n)
    output_signal = cos(w*n);
end
