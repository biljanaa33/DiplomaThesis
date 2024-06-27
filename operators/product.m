function C = product(A, B)
    
    A_dft = fft(A, [], 3);
    B_dft = fft(B, [], 3);
    [n_1, ~, n_3] = size(A);
    [~, n_2, ~] = size(B);
    C_dft = zeros(n_1, n_2, n_3);

    for i = 1:n_3
        C_dft(:,:,i) = A_dft(:,:,i) * B_dft(:,:,i);
    end

    C = ifft(C_dft, [], 3);

