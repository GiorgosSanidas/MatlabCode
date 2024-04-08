function shifted_signal = time_shift(signal, n_0)
    % Χρονική μετατόπιση του σήματος κατά n_0
    shifted_signal = zeros(size(signal));
    n = 1:length(signal);
    shifted_signal(n + n_0) = signal(n);
end