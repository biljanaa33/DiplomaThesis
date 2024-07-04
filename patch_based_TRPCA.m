addpath('algorithms');
addpath('helper_functions');
addpath('operators');

img = imread('images/testing_image.jpg');
I = double(img)/255;
X = double(img);

noise_intensity = 0.3; 
X = generate_noise_test_image(X, noise_intensity); 

[n_1, n_2, ~] = size(X);
patch_size = 128;

L = zeros(size(X));
E = zeros(size(X));

for i = 1:patch_size:n_1
    for j = 1:patch_size:n_2
        disp(i);
        disp(j);
        if i+patch_size-1 <= n_1 && j+patch_size-1 <= n_2

            patch = X(i:i+patch_size-1, j:j+patch_size-1, :);
            [L_patch, E_patch] = TRPCA(patch);
            L(i:i+patch_size-1, j:j+patch_size-1, :) = L_patch;
            E(i:i+patch_size-1, j:j+patch_size-1, :) = E_patch;
        end
    end
end

%[L, E] = TRPCA(X); 

imshow(L)
imwrite(L, 'reconstructed_patch_based_128.png');

[PSNR, SSIM, RSE] = error_calculation(I, L);

disp(L);

disp(['PSNR: ', num2str(PSNR)]);
disp(['SSIM: ', num2str(SSIM)]);
%disp(['RSE: ', num2str(SSIM)]);