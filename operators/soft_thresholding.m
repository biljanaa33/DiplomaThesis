
function x = soft_thresholding(b,lambda)
    
    x = sign(b).*max(abs(b)-lambda, 0);