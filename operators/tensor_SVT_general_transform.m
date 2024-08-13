function D_t_y = tensor_SVT_general_transform(Y,L,rho)
% Izračun operator praga singularnih vrednosti tenzorja Y pri transformaciji L
    
    % Transformacija z matriko L 
    Y_dft = from_tensor_to_transform_domain(Y, L);
    [n_1, n_2, n_3] = size(Y);
    W_dft = zeros(n_1, n_2, n_3);
    
    % Zmanjševanje singularnih vrednosti vsakega frontalnega reza
    for i = 1:ceil(n_3)
             [U_i, S_i, V_i] = svd(Y_dft(:,:,i));
             V_i_conjtr = V_i';
    
             W_dft(:,:,i) = U_i * max(S_i - rho, 0) * V_i_conjtr; 
    
    end
    
    % Transformacija nazaj v originalnega prostora
    D_t_y = from_transform_to_tensor_domain(W_dft, L);
