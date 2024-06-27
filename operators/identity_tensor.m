function I = identity_tensor(n, n_3)

    I = zeros(n, n, n_3);
    I(:, :, 1) = eye(n);

