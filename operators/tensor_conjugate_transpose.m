function A_m_conj = tensor_conjugate_transpose(A_m)
% Izračun konjugirano transponiranega tenzorja
     
      % Konjugiramo in transponiramo vse frontalne rezine 
      % obrnemo vrstni red frontalnih rezin od 2 do n3
      [n_1,n_2,n_3] = size(A_m);
      A_m_conj = zeros(n_2,n_1,n_3);

      A_m_conj(:,:,1) = ctranspose(A_m(:,:,1));
      for i = 2:n_3
         
         A_m_conj(:,:,n_3-i+2) = ctranspose(A_m(:,:,i));
         
          
      end
