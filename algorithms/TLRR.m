function [Z, E] = TLRR(X, A)
% Funkcija izvede algoritem TLRR na tenzorju X z uporabo slovarja A
% in vrne tenzor koeficientov Z, ki predstavljajo podatke z uporabo A,
% ter redek tenzor E ki predstavlja šum

    % Inicijalizacija potrebne parametre 
    [n_1,n_2,n_3]=size(X);

    % Izračun tubalnega ranga tenzorja 
    r_A = tensor_tubal_rank(A); 
    
    %Inicializacija tenzorjev koeficientov
    Z_prev=zeros(r_A,n_2,n_3);
    J_prev=zeros(r_A,n_2,n_3);
 
    Yk_1=zeros(r_A,n_2,n_3);
    E_prev = zeros(n_1,n_2,n_3);
    Yk_2= zeros(n_1,n_2,n_3);

    lambda=1/(sqrt(n_3*max(n_1,n_2)));

    beta = 1e-5;
    max_beta = 1e+8;
    tol = 1e-8;
    %rho = 1.1;
    rho = 1.5;


    [U, S, V] = tensor_SVD(A);
    D = product(U, S); 
    D_conj = tensor_conjugate_transpose(D); 

    % disp(size(U)); 
    % disp(size(S)); 
    % disp(size(V));
    % disp(size(D_conj));


    D_1 = product(D_conj, D);
    [~, n2, ~] = size(D_1);

    I = identity_tensor(n2, 3); 
    G = D_1 + I; 

    G_inv = tensor_inverse(G); 
     
    % Do konvergence
    while true
        
        
        Q1=Z_prev+Yk_1/beta;
        Q2=X-E_prev+Yk_2/beta;

        % Posodobitev tenzorja koeficientov J z uporabo tenzorjev Z in 
        % E ter vhodnih podatkov X
        J_next=product(G_inv, Q1+product(D_conj,Q2));

        
        % Posodobitev tenzorja koeficientov Z z uporabo operatorja singularnih vrednosti, 
        % kjer uporabljamo Fourierovo transformacijo
        Z_next = tensor_SVT( J_next-Yk_1/beta, 1/beta);

        
        % Posodobitev redekega tenzorja E z uporabo operatorja praga, 
        % kjer uporabljamo fourierovo transformacijo
        E_next = soft_thresholding( X-product(D,J_next)+Yk_2/beta, lambda/beta );
    
   
        % Preverimo ali je dosežena optimalna rešitev 
        % oziroma ali ni velikih sprememb pri vseh aproksimacijah
        change_J = max(abs(J_next - J_prev), [], 'all'); 
        change_Z = max(abs(Z_next - Z_prev), [], 'all'); 
        change_E = max(abs(E_next - E_prev), [], 'all'); 
        change_JE = max(abs(J_next - Z_next), [], 'all');
        change_XJ = max(abs(X - product(D, J_next)-E_next), [], 'all');
        
        change = max([change_J,change_Z,change_E,change_JE,change_XJ]);
        %disp(change)
       
        % Končamo če so izpolnjeni vsi pogoji 
        if max([change_E, change_J, change_Z]) < tol && max([change_JE, change_XJ]) < tol
            break;
        end
    
        % Posodobitev lagrangeovih multiplikatorjev
        Yk_1 = Yk_1 + beta*(Z_next-J_next);
        Yk_2 = Yk_2 + beta*(X-product(D,J_next)-E_next);

        % Posodobitev velikosti koraka 
        beta = min(beta*rho,max_beta);

        J_prev = J_next; 
        Z_prev = Z_next; 
        E_prev = E_next; 

    end
   
    % Končni rezultat sta tenzorja Z in E iz zadnje iteracije
    Z = product(V, Z_next); 
    E = E_next;
    
   

