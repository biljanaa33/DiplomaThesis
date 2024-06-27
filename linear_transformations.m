addpath('operators')

A = rand(4, 2, 3); 

% Obrnljiva matrika 
L = [2, -1, 0; -1, 2, -1; 0, -1, 2]; 

A_transformdomain = from_tensor_to_transform_domain(A, L);  
A_tensordomain = from_transform_to_tensor_domain(A_transformdomain, L); 

[U, S, V] = general_tensor_SVD(A, L);
V = tensor_conjugate_transpose_general(V); 
SV = general_t_product(S, V, L);
A_svd = general_t_product(U, SV, L);

disp("Originalna matrika: ")
disp(A)
disp("Linearna transformacija: ")
disp(A_tensordomain)
disp("SVD razcep")
disp(A_svd)


