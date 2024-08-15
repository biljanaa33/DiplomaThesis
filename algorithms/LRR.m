function [Z, E] = LRR(X, A)
% Matrična predstavitev algoritma TLRR
% Algoritem LRR se izvede na vseh frontalnih rezinah tenzorja X z 
% uporabo slovarja A in vrne matriko Z, ki predstavlja podatke 
% z uporabo baz iz A, ter redko matriko E, ki predstavlja šum

   % Inicijalizacija potrebne parametre 
   [n_1,n_2,~] = size(X); 
   [~, n2_a, ~] = size(A); 
    
   % Inicializacija matrike koeficientov Z in J
   Z_prev = zeros(n2_a, n_2); 
   J_prev = zeros(n2_a, n_2);

   % Inicializacija Lagrangeovih multiplikatorjev
   Yk_1 = zeros(n2_a, n_2);
   E_prev = zeros(n_1,n_2);
   Yk_2= zeros(n_1,n_2);


   lambda = 1/sqrt(max(n_1,n_2));
   
   beta = 1e-5; 
   max_beta = 1e+8; 
   tol = 1e-8; 
   %rho = 1.1; 
   rho = 1.5;


   [U, S, V] = svd(A); 
   D = U * S;
   
   D_conj = D';
   D_1 = D_conj * D; 
   [~, n2, ~] = size(D_1);
   
   I = eye(n2); 
   G = D_1 + I;
   G_inv = pinv(G); 

   % Do konvergence 
   while true 

      Q1=Z_prev+Yk_1/beta;
      Q2=X-E_prev+Yk_2/beta;
      
      % Posodobitev matrike koeficientov J z uporabo matrik Z in
      % E ter vhodnih podatkov X
      J_next = G_inv * (Q1 + D_conj * Q2);

      % Posodobitev matrike koeficientov Z z uporabo operatorja 
      % singularnih vrednosti
      R1 = J_next-Yk_1/beta; 
      Z_next = matrix_SVT(R1, 1/beta);

      % Posodobitev redke matrike E z uporabo operatorja praga
      R2=X-D*J_next+Yk_2/beta;
      E_next = soft_thresholding( R2, lambda/beta );
    
      % Preverimo ali je dosežena optimalna rešitev 
      % oziroma ali ni velikih sprememb pri vseh aproksimacijah
      change_J = max(abs(J_next - J_prev), [], 'all'); 
      change_Z = max(abs(Z_next - Z_prev), [], 'all'); 
      change_E = max(abs(E_next - E_prev), [], 'all'); 
      change_JE = max(abs(J_next - Z_next), [], 'all');
      change_XJ = max(abs(X - D*J_next-E_next), [], 'all');
        
      change = max([change_J,change_Z,change_E,change_JE,change_XJ]);
      %disp(change)
       
      % Končamo če so izpolnjeni vsi pogoji 
      if change < tol
            break;
      end

      % Posodobitev lagrangeovih multiplikatorjev
      Yk_1 = Yk_1 + beta*(Z_next-J_next);
      Yk_2 = Yk_2 + beta*(X-D*J_next-E_next);

      % Posodobitev velikosti koraka 
      beta = min(beta*rho,max_beta);

      J_prev = J_next; 
      Z_prev = Z_next; 
      E_prev = E_next; 


   end

     % Končni rezultat sta matriki Z in E iz zadnje iteracije
     Z = V*Z_next; 
     E = E_next;





    
