addpath('helper_functions');
addpath('algorithms');
addpath('operators');

imagefiles = dir('testne_slike\*.png');      
nfiles = length(imagefiles); 
nfiles = 1;
noise_intensity_values = 0.2:0.2:0.6; 
num_noise_levels = length(noise_intensity_values);

all_results = table('Size', [nfiles * num_noise_levels, 6], ...
    'VariableTypes', {'double', 'double', 'double', 'double', 'double', 'double'}, ...
    'VariableNames', {'ImageIndex', 'NoiseIntensity', 'Time', 'PSNR', 'SSIM', 'RSE'});

row_ix = 1; 

for noise_intensity = noise_intensity_values
    
    disp('Noise intensity');
    disp(noise_intensity);
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
        X = generate_noise_test_image(X, noise_intensity);
        
        X_filename = sprintf('zasumljene_slike/slika_%d_sum_%.0f.png', ix, noise_intensity * 100);
        imwrite(X, X_filename); 

        tic; 
        %[L, E] = TRPCA(X);
        [A, ~] = TRPCA(X);
        [Z, E] = TLRR(X, A); 
        R = product(A, Z); 
        time = toc; 

        L_filename = sprintf('rezultate_tlrr/slika_%d_sum_%.0f.png', ix, noise_intensity * 100);
        imwrite(R, L_filename);
        
        [PSNR, SSIM, RSE] = error_calculation(I, R); 

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
    
    output_filename = sprintf('rezultati_tlrr_%.0f.xlsx', noise_intensity * 100);
    writetable(current_results, output_filename);
end

writetable(all_results, 'rezultati_tlrr.xlsx');


