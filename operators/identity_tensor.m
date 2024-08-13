function I = identity_tensor(n, n_3)
% Identični tenzor z uporabo Fourierovo transformacijo 
    
    % Prvi frontalni rez je identiteta
    % Ostali frontalni rezi so ničle
    I = zeros(n, n, n_3);
    I(:, :, 1) = eye(n);

