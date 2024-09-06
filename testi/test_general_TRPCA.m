addpath('algorithms');
addpath('helper_functions');
addpath('operators');

img = imread('images/testing_image.jpg');
I = double(img)/255;
X = double(img);

noise_intensity = 0.3; 
X = generate_noise_test_image(X, noise_intensity); 

%A = zeros(3, 3, 3);
%A(:,:,1) = [1 2 3; 4 5 6; 7 8 9];
%A(:,:,2) = [10 11 12; 13 14 15; 16 17 18];
%A(:,:,3) = [19 20 21; 22 23 24; 25 26 27];
%A_reshape = reshape(A, [], 3);
%disp(A_reshape)

T = [2, -1, 0; -1, 2, -1; 0, -1, 2];
[L, E] = general_TRPCA(X, T); 

imshow(L)
imwrite(L, 'reconstructed_general_invertible.png');
[PSNR, SSIM, RSE] = error_calculation(I, L);


disp(['PSNR: ', num2str(PSNR)]);
disp(['SSIM: ', num2str(SSIM)]);
disp(['RSE: ', num2str(RSE)]);
