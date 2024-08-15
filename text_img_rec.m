addpath('algorithms');
addpath('helper_functions');
addpath('operators');
 
num_images = 10; 
num_iterations = length(0.1:-0.01:0.01); 
 
results = zeros(num_iterations * num_images, 6); 
iteration = 1;

for img_idx = 1:num_images

        img_file = fullfile('text_images', sprintf('text_img_%d.png', img_idx));
        img = imread(img_file);

        I = double(img) / 255;
        X = double(img) / 255;
        imwrite(X,"tuka.png");
        for lambda = 0.2:-0.01:0.01
           
            disp(['Processing image ', num2str(img_idx), ', lambda = ', num2str(lambda)]);
            tic;
               % [L, E] = TRPCA(X, lambda);
               [A, ~]= RPCA_unfold(X);
               L = RPCA_unfold(X); 

            time = toc;

            filename = sprintf('rezultati_img_%02d_text_lambda_%.3f_rpca.png', img_idx, lambda);
            imwrite(L, filename);

            [PSNR, SSIM, RSE] = error_calculation(I, L);
            results(iteration, :) = [img_idx, lambda, PSNR, RSE, SSIM, time];
            disp(['PSNR: ', num2str(PSNR)]);
            disp(['SSIM: ', num2str(SSIM)]);
            disp(['RSE: ', num2str(RSE)]);
            disp(['Time: ', num2str(time), ' seconds']);

            iteration = iteration + 1;

        end

       
 end

results_table = array2table(results, 'VariableNames', {'ix', 'lambda', 'PSNR', 'RSE', 'SSIM', 'time'});
    
writetable(results_table, 'rezultati_text_img_rpca.xlsx');

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


    


