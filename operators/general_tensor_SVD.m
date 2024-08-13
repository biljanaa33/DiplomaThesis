function [U, S, V] = general_tensor_SVD(A,L)
% Izračun tenzroskega razcepa singularnih vrednosti

    % Pretvorba tenzorja iz originalnega prostora v transformiranega
    A = from_tensor_to_transform_domain(A, L);
    
    [n_1, n_2, n_3] = size(A); 
    U_t = zeros(n_1,n_1,n_3);
    S_t = zeros(n_1,n_2,n_3);
    V_t = zeros(n_2,n_2,n_3);

    % Izračun razcepa singularnih vrednosti vseh frontalnih rezin
    for i = 1:n_3

        A_i = A(:,:,i); 
        [U_i, S_i, V_i] = svd(A_i);

        U_t(:,:,i) = U_i; 
        S_t(:,:,i) = S_i; 
        V_t(:,:,i) = V_i; 

    end
        
     % Pretvortba tenzorja nazaj v originalni prostor
     U = from_transform_to_tensor_domain(U_t, L);
     V = from_transform_to_tensor_domain(V_t, L);
     S = from_transform_to_tensor_domain(S_t, L);

     % Izračun vlakenskega ranga tenzorja 
     r = nnz(diag(S(:,:,1)));

     % Odrezanje do ranga r 
     U = U(:,1:r,:); 
     S = S(1:r, 1:r, :); 
     V = V(:,1:r,:);
