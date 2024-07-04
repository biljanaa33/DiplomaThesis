function X = generate_noise_test_image_sameix(X, noise_intensity)
    
    [n_1, n_2, n_3] = size(X);
    X = X / 255; 

    num_noisy_elements = round(noise_intensity * n_1 * n_2); 
    noisy_indices = randperm(n_1 * n_2, num_noisy_elements);

    for i = 1:num_noisy_elements
        [r, c] = ind2sub([n_1, n_2], noisy_indices(i));
        X(r, c, :) = zeros(1, 1, n_3);
    end
