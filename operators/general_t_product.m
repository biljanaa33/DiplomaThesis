function C = general_t_product(A, B, L)

    A_transformdomain = from_tensor_to_transform_domain(A, L); 
    B_transformdomain = from_tensor_to_transform_domain(B, L);
  
    [n1, n2, n3] = size(A);

    C_transform = zeros(n1, n2, n3); 

    for i = 1:n3
        C_i = A_transformdomain(:,:,i) * B_transformdomain(:,:,i);
        C_transform(:,:,i) = C_i;
    end

    C = from_transform_to_tensor_domain(C_transform, L);

