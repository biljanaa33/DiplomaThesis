function [U, S, V, r] = tensor_SVD(A_m)
% skinny 
      A_dft = fft(A_m, [], 3);
      [n_1,n_2,n_3] = size(A_m);
      U_t = zeros(n_1,n_1,n_3);
      S_t = zeros(n_1,n_2,n_3);
      V_t = zeros(n_2,n_2,n_3);

      for i = 1:ceil((n_3+1)/2)
          
          A_i = A_dft(:,:,i);
          [U_i, S_i, V_i] = svd(A_i);
          
          U_i_con = conj(U_i);
          V_i_con = conj(V_i);
          U_t(:,:,i) = U_i;
          V_t(:,:,i) = V_i;
          S_t(:,:,i) = S_i;

          if i > 1
            U_t(:,:,n_3-i+2) = U_i_con;
            V_t(:,:,n_3-i+2) = V_i_con;
            S_t(:,:,n_3-i+2) = S_i;

          end
          
      end

      %r = tensor_tubal_rank(S); 
      threshold = 10e-8; 
      r = nnz(S_t(:,:,1) > threshold);
      disp(r);

      U = ifft(U_t,[],3);
      V = ifft(V_t,[],3);
      S = ifft(S_t,[],3);
        
      % Skinny t-SVD Ua = U(:,1:r,:) Sa = S(1:r, 1:r, :), Va = V(:,1:r,:)
      % r denotes tensor tubal rank
      U = U(:,1:r,:); 
      S = S(1:r, 1:r, :); 
      V = V(:,1:r,:);
      
        
