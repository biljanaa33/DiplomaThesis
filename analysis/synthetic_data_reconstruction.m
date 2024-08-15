% Analiza rekonstrukcije na sintetičnih podatkih
% Konstrukcija grafa ki prikazuje uspešnost rekonstrukcije 
% v odvisnosti od stopnje zašumljenosti in ranga tenzorja 3

%file = 'execution_times_tlrr_gaussian_noise.xlsx';
file = 'execution_times_trpca_gaussian_noise.xlsx';

data = readtable(file);

rank = data.Rank; 
noise = data.NoiseLevel; 
error = data.Error; 

ranks = unique(rank); 
noiselevels = unique(noise); 

errormatrix = zeros(length(ranks), length(noiselevels));

for i = 1:length(ranks)
    for j = 1:length(noiselevels)

        idx = (rank == ranks(i)) & (noise == noiselevels(j));
        % Rekonstrukcijo štejemo za uspešno če je RSE <= 0.05
        if mean(error(idx)) <= 0.05
            errormatrix(i, j) = 1;
        end
        
    end
end


file = 'execution_times_tlrr_gaussian_noise.xlsx';

data = readtable(file);

rank = data.Rank; 
noise = data.NoiseLevel; 
error = data.Error; 

ranks = unique(rank); 
noiselevels = unique(noise); 

errormatrix_1 = zeros(length(ranks), length(noiselevels));

for i = 1:length(ranks)
    for j = 1:length(noiselevels)

        % Rekonstrukcijo štejemo za uspešno če je RSE <= 0.05
        idx = (rank == ranks(i)) & (noise == noiselevels(j));
        if mean(error(idx)) <= 0.05
            errormatrix_1(i, j) = 1;
        end
        
    end
end


diff_matrix = zeros(size(errormatrix));

for i = 1:length(ranks)
    for j = 1:length(noiselevels)
        % Oba algoritma TRPCA in TLRR uspešno rekonstruirata podatke
        if errormatrix(i,j) == 1 && errormatrix_1(i,j) == 1
            diff_matrix(i,j) = 2; 
        % Uspešnost TLRR, TRPCA ne 
        elseif errormatrix(i,j) == 0 && errormatrix_1(i,j) == 1
            diff_matrix(i,j) = 1;
        % Oba algoritma ne uspeta pri rekonstrukciji
        elseif errormatrix(i,j) == 0 && errormatrix_1(i,j) == 0
            diff_matrix(i,j) = 0; 
        end
    end
end

figure;
imagesc(noiselevels, ranks, diff_matrix);
colormap([0 0 0; 0.5 0.5 0.5; 1 1 1]); 
xlabel('Stopnja zašumljenosti');
ylabel('Rang');
saveas(gcf, 'difference_gaussian_noise_trpca_tlrr.png');


