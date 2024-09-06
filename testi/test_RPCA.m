addpath('algorithms');
addpath('operators');
addpath('helper_functions');

img = imread('images/testing_image.jpg');
I = double(img);
X = double(img);

noise_intensity = 0.3; 
X = generate_noise_test_image(X, noise_intensity); 

[L, S] = RPCA_unfold(X); 

imshow(L); 

[PSNR, SSIM] = error_calculation(I, X); 


function [L, S] = RPCA_unfold(X)

    [~, ~, n3] = size(X);
    L = zeros(size(X));
    S = zeros(size(X));
    
    for i = 1:n3 
        Xi = X(:,:,i);
        
        [Li, Si] = RPCA(Xi);
      
        L(:,:,i) = Li;
        S(:,:,i) = Si;
    end
end

