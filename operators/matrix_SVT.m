function out = matrix_SVT(X,tau)
% Operator praga signularnih vrednosti pri 
% RPCA in LRR 

    % Izračun razcep singularnih vrednosti posameznih rezin
    [U, S, V] = svd(X,'econ');
    out = U * soft_thresholding(S, tau)* V';
