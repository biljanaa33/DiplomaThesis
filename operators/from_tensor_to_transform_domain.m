function A_transformdomain = from_tensor_to_transform_domain(A, L)
% Pretvorba tenzorja iz originalnega prostora v transformiranega 

    % Uporaba kosinusne transformacije
    % A_transformdomain = dct(A, [], 3);
    
    % Matrizacija tenzorja in množenje po tretji dimenziji
    A_reshape = reshape(A, [], 3);
    A_transformed = A_reshape * L; 
    % Pretvorba matrike nazaj v prvotno tenzorsko obliko
    A_transformdomain = reshape(A_transformed, size(A)); 
    
