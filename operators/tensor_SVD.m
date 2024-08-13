function [U, S, V, r] = tensor_SVD(A_m)
% Funkcija ki iračuna tenzorski razcep singularnih vrednosti tenrozja A_m 
% z uporabo Fourierjeve transformacije

        
      A_dft = fft(A_m, [], 3);
      [n_1,n_2,n_3] = size(A_m);
      U_t = zeros(n_1,n_1,n_3);
      S_t = zeros(n_1,n_2,n_3);
      V_t = zeros(n_2,n_2,n_3);

      % Itreacija čez prve polovice frontalnih rezov tenzorja 
      for i = 1:ceil((n_3+1)/2)
          
          A_i = A_dft(:,:,i);
          % Izvedba SVD na posameznih frontalnih rezov
          [U_i, S_i, V_i] = svd(A_i);
          
          U_i_con = conj(U_i);
          V_i_con = conj(V_i);
          U_t(:,:,i) = U_i;
          V_t(:,:,i) = V_i;
          S_t(:,:,i) = S_i;
            
          % Uporaba lastnost simetrije
          if i > 1
            U_t(:,:,n_3-i+2) = U_i_con;
            V_t(:,:,n_3-i+2) = V_i_con;
            S_t(:,:,n_3-i+2) = S_i;

          end
          
      end
        
      % Izračun vlakenskega ranga tenzorja
      threshold = 10e-8; 
      r = nnz(S_t(:,:,1) > threshold);
      disp(r);

      U = ifft(U_t,[],3);
      V = ifft(V_t,[],3);
      S = ifft(S_t,[],3);
        
      % Odrezanje do ranga r
      U = U(:,1:r,:); 
      S = S(1:r, 1:r, :); 
      V = V(:,1:r,:);
      
        
