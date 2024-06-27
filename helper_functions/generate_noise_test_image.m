function X = generate_noise_test_image(X, noise_intensity)
    
    [n_1, n_2, n_3] = size(X);
    X = X / 255; 

    num_noisy_elements = round(noise_intensity * n_1 * n_2 * n_3); 
    noisy_indices = randperm(n_1 * n_2 * n_3, num_noisy_elements);

    for i = 1:num_noisy_elements
        [r, c, d] = ind2sub([n_1, n_2, n_3], noisy_indices(i));
        X(r, c, d) = rand();
    end
