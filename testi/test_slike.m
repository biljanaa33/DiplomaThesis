addpath('helper_functions');
addpath('algorithms');
addpath('operators');

imagefiles = dir('testne_slike\*.png');      
nfiles = length(imagefiles); 

noise_intensity_values = 0.2:0.2:0.6; 
num_noise_levels = length(noise_intensity_values);

all_results = table('Size', [nfiles * num_noise_levels, 6], ...
    'VariableTypes', {'double', 'double', 'double', 'double', 'double', 'double'}, ...
    'VariableNames', {'ImageIndex', 'NoiseIntensity', 'Time', 'PSNR', 'SSIM', 'RSE'});

row_ix = 1; 

for noise_intensity = noise_intensity_values
    

    times = zeros(nfiles, 1);
    PSNR_values = zeros(nfiles, 1);
    SSIM_values = zeros(nfiles, 1);
    RSE_values = zeros(nfiles, 1);
    
    for ix = 1:nfiles
        currentfilename = fullfile(imagefiles(ix).folder, imagefiles(ix).name);
        fprintf('Processing file: %s\n', currentfilename); 

        img = imread(currentfilename);
        I = double(img) / 255;

        X = double(img);
        %X = generate_noise_test_image_sameix(X, noise_intensity);
        X = generate_noise_test_image(X, noise_intensity);
        
        %X_filename = sprintf('zasumljene_slike_lrr/slika_%d_sum_%.0f.png', ix, noise_intensity * 100);
        %imwrite(X, X_filename); 

        tic; 
        % [A, ~]= TRPCA(X, 10);
        [Z,~] = TLRR(X, X);
        L = product(X, Z);


        time = toc; 

        L_filename = sprintf('rezultati_stlrr/slika_%d_sum_%.0f.png', ix, noise_intensity * 100);
        imwrite(L, L_filename);
        
        [PSNR, SSIM, RSE] = error_calculation(I, L); 

        times(ix) = time;
        PSNR_values(ix) = PSNR;
        SSIM_values(ix) = SSIM;
        RSE_values(ix) = RSE; 
        
        disp(time);
        disp(PSNR); 
        disp(SSIM);
        disp(RSE); 
        
        all_results(row_ix, :) = {ix, noise_intensity, time, PSNR, SSIM, RSE};
        row_ix = row_ix + 1;
    end
    
    current_results = table((1:nfiles)', noise_intensity * ones(nfiles, 1), times, PSNR_values, SSIM_values, RSE_values, ...
        'VariableNames', {'ImageIndex', 'NoiseIntensity', 'Time', 'PSNR', 'SSIM', 'RSE'});
    
    output_filename = sprintf('rezultati_stlrr%.0f.xlsx', noise_intensity * 100);
    writetable(current_results, output_filename);
end

writetable(all_results, 'rezultati_stlrr_g.xlsx');


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

function L = LRR_unfold(X, A)

    [~, ~, n3] = size(X);
    L = zeros(size(X));
    
    for i = 1:n3 
        Xi = X(:,:,i);
        Ai = A(:,:,i); 
        
        [Zi, ~] = LRR(Xi, Ai);

        Li = Ai * Zi; 
        L(:,:,i) = Li;
        
    end
end





