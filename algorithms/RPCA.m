function [L,S] = RPCA(X)

    [n1, n2] = size(X);
    mu = n1 * n2 / (4 * sum(abs(X(:))));
    lambda = 1/sqrt(max(n1,n2));
    thresh = 1e-7; 

    ro = 1.1; 
    mi_k = 1e-5 ; 
    mi_max = 1e10; 
    Y = zeros(size(X));

    S_prev = zeros(size(X));
    L_prev = zeros(size(X));
    count = 0;

    while true

      L_next = matrix_SVT(X - S_prev + ( 1/mi_k )*Y, 1/mi_k);
      S_next = soft_thresholding(X-L_next+(1/mi_k)*Y, lambda/mi_k);
      Y = Y + mi_k * (X - L_next - S_next);   
      % Preveri ustavitveni pogoj
      
      change_L = max(abs(L_next - L_prev)); 
      change_S = max(abs(S_next - S_prev)); 
      change_X = max(abs(L_next + S_next - X));
    
       change = max([change_L, change_S, change_X]);
       % disp(change)
        
       if change < thresh
            break;
       end 

       mi_k = min(ro*mi_k, mi_max);
       L_prev = L_next;

       S_prev = S_next;

      count = count + 1; 

    end

       L = L_prev; 
       S = S_next; 

