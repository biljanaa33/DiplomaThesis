addpath('algorithms');
addpath('helper_functions');
addpath('operators');

img = imread('images/testing_image.jpg');
I = double(img)/255;
X = double(img);

noise_intensity = 0.3; 
X = generate_noise(X, noise_intensity); 

[L, E] = TRPCA(X); 

imshow(L)

[PSNR, SSIM] = error_calculation(I, L);

disp(L);

disp(['PSNR: ', num2str(PSNR)]);
disp(['SSIM: ', num2str(SSIM)]);



