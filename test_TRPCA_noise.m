addpath('algorithms');
addpath('helper_functions');
addpath('operators');

img = imread('images/testing_image.jpg');
I = double(img)/255;
X = double(img);

noise_intensity = 0.3; 
X = generate_noise_test_image_sameix(X, noise_intensity); 
imwrite(X, 'noisy_image_sameix.png');

[L, E] = TRPCA(X); 

imshow(L)
imwrite(L, 'reconstructed_fft_noise_sameix.png');

[PSNR, SSIM, RSE] = error_calculation(I, L);

disp(L);

disp(['PSNR: ', num2str(PSNR)]);
disp(['SSIM: ', num2str(SSIM)]);
disp(['RSE: ', num2str(RSE)]);

