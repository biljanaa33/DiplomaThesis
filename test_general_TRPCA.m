addpath('algorithms');
addpath('helper_functions');
addpath('operators');

img = imread('images/testing_image.jpg');
I = double(img)/255;
X = double(img);

noise_intensity = 0.3; 
X = generate_noise_test_image(X, noise_intensity); 

T = [2, -1, 0; -1, 2, -1; 0, -1, 2];
[L, E] = general_TRPCA(X, T); 

imshow(L)

[PSNR, SSIM] = error_calculation(I, L);


disp(['PSNR: ', num2str(PSNR)]);
disp(['SSIM: ', num2str(SSIM)]);
