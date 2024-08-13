function x = soft_thresholding(b,lambda)
% Operator praga, pri pragovni vrednosti lambda

    x = sign(b).*max(abs(b)-lambda, 0);