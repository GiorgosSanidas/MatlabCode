function scaled_frequency_multiplication = scale_frequency_multiplication(signal, N)
    % Πολλαπλασιασμός συχνότητας
    scaled_frequency_multiplication = zeros(1, length(signal) * N);
    scaled_frequency_multiplication(1:N:end) = signal;
end