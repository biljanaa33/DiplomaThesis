function [L,E] = general_TRPCA(X,L, param_lambda)
% Funkcija izvede algoritem TRPCA na tenzorju X, in vrne tenzor nizkega
% ranga L ki predstavlja podatke, ter redek tenzor E ki predstavlja šum
% Za implementacijo operatorjev uporablja poljubno obrnljivo transformacijo

    % Inicijalizacija potrebne parametre
    [n_1, n_2, n_3] = size(X); 
    e_tol = 1e-8; 
    ro = 1.5; 
    mi_k = 1e-5 ; 
    mi_max = 1e10; 
    L_prev = zeros(n_1, n_2, n_3);
    E_prev = zeros(n_1, n_2, n_3); 

    % Inicijalizacija lagrangeovega multiplikatorja
    Y_prev = zeros(n_1, n_2, n_3); 
    
    lambda = param_lambda;

    %lambda = 1/sqrt(max(n_1,n_2)*n_3);

    % Do konvergence
    while true

        % Posodobitev tenzorja L z uporabo operatorja singularnih
        % vrednosti, kjer uporabljamo poljubno obrnljivo transformacijo 
        L_next = tensor_SVT_general_transform(-E_prev+X-Y_prev/mi_k, L, 1/mi_k);

        % Posodobitev redekega tenzorja E z uporabo operatorja praga, 
        % kjer uporabljamo poljubno obrnljivo transformacijo
        E_next = soft_thresholding(-L_next+X-Y_prev/mi_k, lambda/mi_k); 

        % Posodobitev Lagrangeovega multiplikatorja
        Y_next = Y_prev + mi_k * (L_next + E_next - X);

        % Posodobitev velikosti koraka
        mi_k = min(ro*mi_k, mi_max);
      
         % Preverimo ali je dosežena optimalna rešitev 
        % oziroma ali ni velikih sprememb pri vseh aproksimacijah
        change_L = max(abs(L_next - L_prev), [], 'all'); 
        change_E = max(abs(E_next - E_prev), [], 'all'); 
        change_X = max(abs(L_next + E_next - X), [], 'all');
    
        change = max([change_L, change_E, change_X]);
        %disp(change);

        % Končamo če so izpolnjeni vsi pogoji 
        if change_L < e_tol && change_E < e_tol && change_X < e_tol
            break;
        end 
        
        L_prev = L_next; 
        E_prev = E_next; 
        Y_prev = Y_next; 
    end
    
    % Končni rezultat sta tenzorja L in E iz zadnje iteracije
    L = L_next; 
    E = E_next; 


