function output_signal = sinuowm(N, f)
    % Υπολογισμός της γωνιακής συχνότητας
    w = 2*pi*f;
    
    % Δημιουργία του διανύσματος των δειγμάτων
    n = 0:N-1;
    
    % Υπολογισμός των τιμών sin(w*n)
    output_signal = sin(w*n);
end
