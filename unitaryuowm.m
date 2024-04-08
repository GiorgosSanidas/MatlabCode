function output_signal = unitaryuowm(n_threshold, N)
    % Αρχικοποίηση του επιστρεφόμενου διανύσματος με μηδενικά
    output_signal = zeros(1, N);
    
    % Ορισμός των τιμών του σήματος
    for i = n_threshold:N-1
        output_signal(i+1) = 1; % Στο MATLAB η αρίθμηση ξεκινάει από το 1, άρα πρέπει να προσθέσουμε 1
    end
end