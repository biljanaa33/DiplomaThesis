function A_tensordomain = from_transform_to_tensor_domain(A, L)
    
    L_inv = inv(L); 
    A_reshape = reshape(A, [], 3); 
    A_inversetransrfom = A_reshape * L_inv; 
    A_tensordomain = reshape(A_inversetransrfom, size(A)); 
