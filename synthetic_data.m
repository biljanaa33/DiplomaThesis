addpath('algorithms');
addpath('operators');

n_1 = 50;
n_2 = 50;
n_3 = 3;

ranks = 1:50; 
noise = 0.025:0.025:0.7;
num_samples = 5;

L = generate_tensor(n_1, n_2, n_3, 10);
E = generate_gaussian_noise(L, 0.4); 
X = TRPCA(L+E); 


error_matrix = zeros(length(ranks), length(noise));

for r_idx = 1:length(ranks)

    r = ranks(r_idx);

    for p_idx = 1:length(noise)
        
        sample_errors = zeros(1, num_samples);
        p = noise(p_idx);

        for sample = 1:num_samples

            L = generate_tensor(n_1, n_2, n_3, r);
            E = generate_sparse_noise(L, p);
    
            X = L + E; 
            L_r = TRPCA(X); 
            error = reconstruction_error(L, L_r); 
            sample_errors(sample) = error;

        end

           mean_error = mean(sample_errors);
           error_matrix(r_idx, p_idx) = mean_error;
           fprintf('noise %.2f, rank %d, error %.4f\n', p, r, mean_error);


    end

end


figure;
imagesc(noise, ranks, error_matrix);
colorbar;
xlabel('Noise Level (p)');
ylabel('Rank (r)');
title('Reconstruction Error');
saveas(gcf, 'reconstruction_error.png');

function X = generate_tensor(n_1, n_2, n_3, r)

    P = randn(n_1, r, n_3);
    Q = randn(r, n_2, n_3);
    X = product(P, Q); 

end

function E = generate_sparse_noise(X, p)
    
     [n_1, n_2, n_3] = size(X); 
     num_elements = n_1 * n_2 * n_3;
     num_noise_elements = round(p * num_elements);
     linear_indices = randperm(num_elements, num_noise_elements);
     E = zeros(n_1, n_2, n_3);
     noise_values = randi([0, 1], num_noise_elements, 1) * 2 - 1; 
     
     E(linear_indices) = noise_values;
    
end

function E = generate_gaussian_noise(X, p)
    
    [n_1, n_2, n_3] = size(X); 
    num_elements = n_1 * n_2 * n_3 ; 
    num_noise = round(p * num_elements);
    idx = randperm(num_elements, num_noise);
    E = zeros(n_1, n_2, n_3);
    E(idx) = randn(size(idx));

end

function error = reconstruction_error(L, L_r)

    L = L(:);
    L_r = L_r(:); 
    error = norm(L_r-L) / norm(L);

end