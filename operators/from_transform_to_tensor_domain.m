function A_tensordomain = from_transform_to_tensor_domain(A, L)
% Pretvorba tenzorja iz transformiranega prostora v originalnega 
    
    % Uporaba kosinusne transformacije
    % A_tensordomain = idct(A, [],3);

    % Matrizacija tenzorja in množenje po tretji dimenziji
     L_inv = inv(L);
     A_reshape = reshape(A, [], 3); 
     A_inversetransrfom = A_reshape * L_inv ; 
    % Pretvorba matrike nazaj v prvotno tenzorsko obliko 
     A_tensordomain = reshape(A_inversetransrfom, size(A)); 
