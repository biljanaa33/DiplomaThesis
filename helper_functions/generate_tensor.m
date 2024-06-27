function [P, Q, X] = generate_tensor(n1, n2, n3, r)

    addpath('../operators');

    P = randn(n1, r, n3);
    Q = randn(r, n2, n3);

    X = product(P, Q); 
    disp(X)

