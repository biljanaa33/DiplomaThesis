addpath('algorithms');
addpath('operators');

% Parameters
n1 = 481;
n2 = 321;
n3 = 3;
mi = 500;
r_values = 1:60;
noise_levels = 0.025:0.025:0.65;
num_instances = 5;
time_limit = 300; 

% Initialize error matrix and time log
error_matrix = zeros(length(r_values), length(noise_levels));
execution_times = cell(length(r_values) * length(noise_levels) * num_instances, 5);
execution_times_1 = cell(length(r_values) * length(noise_levels) * num_instances, 5);

exec_count = 0;

for r_idx = 1:3
    r = r_values(r_idx);
    
    for p_idx = 1:length(noise_levels)
        p = noise_levels(p_idx);

        sample_errors = zeros(1, num_instances);
        sample_time = zeros(1, num_instances);

        for t = 1:num_instances

            L_list = cell(1, 1);
            for i = 1:1
                Bi = randn(n1, r, n3);
                Ci = randn(r, n2, n3);
                Li = product(Bi, Ci);
                L_list{i} = Li;
            end
            
            L0 = cat(2, L_list{:});
            n2 = size(L0, 2);

            L0_n = L0 / max(abs(L0(:)));
            E0 = generate_gaussian_noise(L0_n, p);
            X = L0_n + E0;

            tic;
            [L_r, ~] = TRPCA(X);
            time = toc;
            tic;
            [Z, ~] = TLRR(X, L_r); 
            L_rr = product(L_r, Z); 
            time_1 = toc; 
            time_1 = time_1 + time; 

            error = norm(L_r(:) - L0_n(:)) / norm(L0_n(:));
            sample_errors(t) = error;

            error_1 = norm(L_rr(:) - L0_n(:)) / norm(L0_n(:));


            exec_count = exec_count + 1;
            execution_times{exec_count, 1} = r;
            execution_times{exec_count, 2} = p;
            execution_times{exec_count, 3} = t;
            execution_times{exec_count, 4} = time;
            execution_times{exec_count, 5} = error; 

            execution_times_1{exec_count, 1} = r;
            execution_times_1{exec_count, 2} = p;
            execution_times_1{exec_count, 3} = t;
            execution_times_1{exec_count, 4} = time_1;
            execution_times_1{exec_count, 5} = error_1; 


                

            %disp("Error");
            %disp(error);
            %disp("Time");
            %disp(time);

            

        end

        mean_error = mean(sample_errors);
        error_matrix(r_idx, p_idx) = mean_error;
        fprintf('noise %.2f, rank %d, error %.4f \n', p, r, mean_error);

        
    end
         execution_times = execution_times(1:exec_count, :); 
        filename = 'execution_times_gaussian_rtpca_4.xlsx';
        headers = {'Rank', 'NoiseLevel', 'Instance', 'Time','Error'};
        writecell([headers; execution_times], filename);

        execution_times_1 = execution_times_1(1:exec_count, :); 
        filename = 'execution_times_gaussian_tlrr_4.xlsx';
        headers = {'Rank', 'NoiseLevel', 'Instance', 'Time','Error'};
        writecell([headers; execution_times_1], filename);
end

%figure;
%imagesc(noise_levels, r_values, error_matrix);
%colorbar;
%xlabel('Noise Level (\rho)');
%ylabel('Rank (r)');
%title('Reconstruction Error Sparse Noise');
%saveas(gcf, 'reconstruction_error_gaussian_noise_trpca.png');

%execution_times = execution_times(1:exec_count, :); 
%filename = 'execution_times_gaussian_rtpca.xlsx';
%headers = {'Rank', 'NoiseLevel', 'Instance', 'Time','Error'};
%writecell([headers; execution_times], filename);

%execution_times_1 = execution_times_1(1:exec_count, :); 
%filename = 'execution_times_gaussian_tlrr.xlsx';
%headers = {'Rank', 'NoiseLevel', 'Instance', 'Time','Error'};
%writecell([headers; execution_times_1], filename);

function E = generate_gaussian_noise(X, p)
    
    [n_1, n_2, n_3] = size(X); 
    num_elements = n_1 * n_2 * n_3 ; 
    num_noise = round(p * num_elements);
    idx = randperm(num_elements, num_noise);
    E = zeros(n_1, n_2, n_3);
    E(idx) = randn(size(idx));

end
