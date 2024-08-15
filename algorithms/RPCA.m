function [L,E] = RPCA(X)
% Matrična predstavitev algoritma TRPCA
% Algoritem RPCA se izvede na vseh frontalnih rezinah tenzorja X, 
% funkcija vrne matriko nizkega ranga L, ki predstavlja rekonstruirane podatke, 
% ter redko matriko E, ki predstavlja šum


    % Inicijalizacija potrebne parametre
    [n1, n2] = size(X);
    % mu = n1 * n2 / (4 * sum(abs(X(:))));
    lambda = 1/sqrt(max(n1,n2));
    thresh = 1e-7; 

    %ro = 1.1; 
    ro = 1.5;
    mi_k = 1e-5 ; 
    mi_max = 1e10; 
    Y = zeros(size(X));

    E_prev = zeros(size(X));
    L_prev = zeros(size(X));
    count = 0;

    % Do konvergence
    while true

      % Posodobitev matrike koeficientov L z uporabo operatorja 
      % singularnih vrednosti
      L_next = matrix_SVT(X - E_prev + ( 1/mi_k )*Y, 1/mi_k);

      % Posodobitev redekega tenzorja E z uporabo operatorja praga, 
      % kjer uporabljamo fourierovo transformacijo

      % Posodobitev redke matrike E z uporabo operatorja praga
      E_next = soft_thresholding(X-L_next+(1/mi_k)*Y, lambda/mi_k);

      % Posodobitev lagrangeovih multiplikatorjev
      Y = Y + mi_k * (X - L_next - E_next);   

      % Preverimo ali je dosežena optimalna rešitev 
      % oziroma ali ni velikih sprememb pri vseh aproksimacijah      
      change_L = max(abs(L_next - L_prev)); 
      change_E = max(abs(E_next - E_prev)); 
      change_X = max(abs(L_next + S_next - X));
    
       change = max([change_L, change_E, change_X]);
       % disp(change)
        
       % Končamo če so izpolnjeni vsi pogoji 
       if change < thresh
            break;
       end 

       % Posodobitev velikosti koraka 
       mi_k = min(ro*mi_k, mi_max);

       L_prev = L_next;
       E_prev = E_next;

      count = count + 1; 

    end
     
       % Končni rezultat sta matriki L in E iz zadnje iteracije
       L = L_prev; 
       E = E_next; 

