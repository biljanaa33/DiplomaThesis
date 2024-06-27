function [L,E] = general_TRPCA(X,L)


    [n_1, n_2, n_3] = size(X); 
    e_tol = 1e-8; 
    ro = 1.1; 
    mi_k = 1e-5 ; 
    mi_max = 1e10; 
    L_prev = zeros(n_1, n_2, n_3);
    E_prev = zeros(n_1, n_2, n_3); 
    % Lagrangian Multiplier 
    Y_prev = zeros(n_1, n_2, n_3); 
    lambda = 1/sqrt(max(n_1,n_2)*n_3);
    
    while true
        % Update Lk+1 
        L_next = tensor_SVT_general_transform(-E_prev+X-Y_prev/mi_k, L, 1/mi_k);
        % Update Ek+1
        E_next = soft_thresholding(-L_next+X-Y_prev/mi_k, lambda/mi_k); 
        % Update Lagrangian Multiplier
        Y_next = Y_prev + mi_k * (L_next + E_next - X);
        % Update step size 
        mi_k = min(ro*mi_k, mi_max);
      
        % Check if optimal solution is reached
        change_L = max(abs(L_next - L_prev), [], 'all'); 
        change_E = max(abs(E_next - E_prev), [], 'all'); 
        change_X = max(abs(L_next + E_next - X), [], 'all');
    
        change = max([change_L, change_E, change_X]);
        disp(change);
        if change_L < e_tol && change_E < e_tol && change_X < e_tol
            break;
        end 
        
        L_prev = L_next; 
        E_prev = E_next; 
        Y_prev = Y_next; 
    end
    
    L = L_next; 
    E = E_next; 


