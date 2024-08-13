function A_m_conj = tensor_conjugate_transpose_general(A_m)
% Funkcija ki izračuna konjugirano transponirani tenzor 
    
    % Vsak frontalni rez transponiramo in konjugiramo 
    % Vrstni red od drugega do zadnjega frontalnega reza obrnemo
    A_m_conj = permute(conj(A_m), [2, 1, 3]);
