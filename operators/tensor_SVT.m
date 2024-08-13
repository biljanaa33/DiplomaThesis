function D_t_y = tensor_SVT(Y,rho)
% Izračun operator praga singularnih vrednosti tenzorja Y pri 
% Fourierjevi transformaciji

    Y_dft = fft(Y,[],3);
    [n_1, n_2, n_3] = size(Y);
    W_dft = zeros(n_1, n_2, n_3);
    
       
    % Zmanjševanje singularnih vrednosti frontalnih rezov
    for i = 1:ceil((n_3+1)/2)
             [U_i, S_i, V_i] = svd(Y_dft(:,:,i));
             V_i_conjtr = ctranspose(V_i);
    
             W_dft(:,:,i) = U_i * max(S_i - rho, 0) * V_i_conjtr; 
    
         if i > 1 && i ~= n_3-i+2
             W_dft(:,:,n_3-i+2) = conj(W_dft(:,:,i));
    
         end
    
    end
    
    D_t_y = ifft(W_dft,[],3); 
