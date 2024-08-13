function A_inv = tensor_inverse(A)
% Funkcija ki izračuna inverz tenzorja A

    % Fourierjeva transformacija 
    A_fft = fft(A, [], 3); 
    [n_1, n_2, n_3] = size(A); 

    A_dft_inv = zeros(n_2, n_1, n_3); 
    % Moore-Penroseov psevdoinverz vsake frontalne rezine
    for i = 1:n_3
        A_dft_inv(:,:,i) = pinv(A_fft(:,:,i));

    end
   % Izračun inverzne transformacije 
   A_inv = ifft(A_dft_inv,[],3);
