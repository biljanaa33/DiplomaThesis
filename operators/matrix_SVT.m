function out = matrix_SVT(X,tau)
    
    [U, S, V] = svd(X,'econ');
    out = U * soft_thresholding(S, tau)* V';
