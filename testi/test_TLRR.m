addpath('algorithms');
addpath('helper_functions');
addpath('operators');

img = imread('images/testing_image.jpg');
I = double(img)/255;
X = double(img);

noise_intensity = 0.3; 
X = generate_noise_test_image(X, noise_intensity); 
imwrite(X, 'noisy_image.png');

%tensor = rand(3, 3, 3);
%disp(tensor)

%tensor_inv = tensor_inverse(tensor); 


%t = tensor_inverse(tensor_inv); 

%disp(t)
% slovar
%[A, ~] = TRPCA(X);
[Z, E] = TLRR(X, X); 
R = product(X, Z); 

imshow(R)
imwrite(R, 'reconstructed_tlrr_test.png');

[PSNR, SSIM, RSE] = error_calculation(I, R);

%disp(L);

disp(['PSNR: ', num2str(PSNR)]);
disp(['SSIM: ', num2str(SSIM)]);
disp(['RSE: ', num2str(RSE)]);


