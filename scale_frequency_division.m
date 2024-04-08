function scaled_frequency_division = scale_frequency_division(signal, N)
    % Κλιμάκωση στο χρόνο με διαίρεση συχνότητας
    scaled_frequency_division = signal(1:N:end);
end