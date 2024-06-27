function A_transformdomain = from_tensor_to_transform_domain(A, L)

    A_reshape = reshape(A, [], 3);
    A_transformed = A_reshape * L; 
    A_transformdomain = reshape(A_transformed, size(A)); 
    
