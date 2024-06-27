function A_m_conj = tensor_conjugate_transpose(A_m)
% By definition conjugate transpose each of the fronal slices
% reverse the order, of transposed frontal slices 2 trough n3
     
      [n_1,n_2,n_3] = size(A_m);
      A_m_conj = zeros(n_2,n_1,n_3);

      A_m_conj(:,:,1) = ctranspose(A_m(:,:,1));
      for i = 2:n_3
         
         A_m_conj(:,:,n_3-i+2) = ctranspose(A_m(:,:,i));
          
      end
