function D_t_y = tensor_SVT_general_transform(Y,L,rho)

    Y_dft = from_tensor_to_transform_domain(Y, L);
    [n_1, n_2, n_3] = size(Y);
    W_dft = zeros(n_1, n_2, n_3);
    
    for i = 1:ceil((n_3+1)/2)
             [U_i, S_i, V_i] = svd(Y_dft(:,:,i));
             V_i_conjtr = ctranspose(V_i);
    
             W_dft(:,:,i) = U_i * max(S_i - rho, 0) * V_i_conjtr; 
    
         if i > 1 && i ~= n_3-i+2
             W_dft(:,:,n_3-i+2) = conj(W_dft(:,:,i));
    
         end
    
    end
    
    D_t_y = from_transform_to_tensor_domain(W_dft, L);
