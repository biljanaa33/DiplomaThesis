% Analiza časa konvergence z različnimi vrednostmi parametra 
% rho in uspešnosti rekonstrukcije
data_rpca = readtable('../rezultati_stepsizelarger_rpca/rezultati_stepsize_larger_rpca.xlsx');
data_lrr = readtable('../rezultati_stepsizelarger_lrr/rezultati_stepsize_larger_lrr.xlsx');

noise_int = 0.2; 
time_rpca = data_rpca.Time; 
time_lrr = data_lrr.Time; 
noise_rpca = data_rpca.NoiseIntensity; 
noise_lrr = data_lrr.NoiseIntensity; 

time_rpca = time_rpca(noise_int == noise_rpca); 
time_lrr = time_lrr(noise_int == noise_lrr); 

ix_rpca = 1:length(time_rpca);
ix_lrr = 1:length(time_lrr);

data_trpca = readtable('../rezultati_stepsizelarger_trpca/rezultati_stepsize_larger_trpca.xlsx');
data_tlrr = readtable('../rezultati_stepsizelarger_tlrr/rezultati_stepsize_larger_tlrr.xlsx');

time_trpca = data_trpca.Time; 
time_tlrr = data_tlrr.Time; 
noise_trpca = data_trpca.NoiseIntensity; 
noise_tlrr = data_tlrr.NoiseIntensity; 

time_trpca = time_trpca(noise_int == noise_trpca); 
time_tlrr = time_tlrr(noise_int == noise_tlrr); 

ix_trpca = 1:length(time_trpca);
ix_tlrr = 1:length(time_tlrr);

figure('Position', [100, 100, 1200, 400]); 
plot(ix_rpca, time_rpca, '-o', 'DisplayName', 'RPCA');
hold on;
plot(ix_lrr, time_lrr , '-x', 'DisplayName', 'LRR');
plot(ix_trpca, time_trpca, '-s', 'DisplayName', 'TRPCA');
plot(ix_tlrr, time_tlrr, '-d', 'DisplayName', 'TLRR');
hold off;

xlabel('Indeks');
ylabel('Čas');
legend('show');
grid on;

saveas(gcf, 'primerjava_časa_20_rho_15.png');

psnr_rpca = data_rpca.PSNR; 
psnr_lrr = data_lrr.PSNR; 
noise_rpca = data_rpca.NoiseIntensity; 
noise_lrr = data_lrr.NoiseIntensity; 

psnr_rpca = psnr_rpca(noise_int == noise_rpca); 
psnr_lrr = psnr_lrr(noise_int == noise_lrr); 

ix_rpca = 1:length(psnr_rpca);
ix_lrr = 1:length(psnr_lrr);

psnr_trpca = data_trpca.PSNR; 
psnr_tlrr = data_tlrr.PSNR; 
noise_trpca = data_trpca.NoiseIntensity; 
noise_tlrr = data_tlrr.NoiseIntensity; 

psnr_trpca = psnr_trpca(noise_int == noise_trpca); 
psnr_tlrr = psnr_tlrr(noise_int == noise_tlrr); 

ix_trpca = 1:length(time_trpca);
ix_tlrr = 1:length(time_tlrr);

figure('Position', [100, 100, 1200, 400]);
plot(ix_rpca, psnr_rpca, '-o', 'DisplayName', 'RPCA');
hold on;
plot(ix_lrr, psnr_lrr , '-x', 'DisplayName', 'LRR');
plot(ix_trpca, psnr_trpca, '-s', 'DisplayName', 'TRPCA');
plot(ix_tlrr, psnr_tlrr, '-d', 'DisplayName', 'TLRR');
hold off;

xlabel('Indeks');
ylabel('PSNR');
legend('show');
grid on;

saveas(gcf, 'primerjava_psnr_20_rho_15.png');

noise_int = 0.2; 
rse_rpca = data_rpca.RSE; 
rse_lrr = data_lrr.RSE; 
noise_rpca = data_rpca.NoiseIntensity; 
noise_lrr = data_lrr.NoiseIntensity; 

rse_rpca = rse_rpca(noise_int == noise_rpca); 
rse_lrr = rse_lrr(noise_int == noise_lrr); 

ix_rpca = 1:length(rse_rpca);
ix_lrr = 1:length(rse_lrr);

rse_trpca = data_trpca.RSE; 
rse_tlrr = data_tlrr.RSE; 
noise_trpca = data_trpca.NoiseIntensity; 
noise_tlrr = data_tlrr.NoiseIntensity; 

rse_trpca = rse_trpca(noise_int == noise_trpca); 
rse_tlrr = rse_tlrr(noise_int == noise_tlrr); 

ix_trpca = 1:length(time_trpca);
ix_tlrr = 1:length(time_tlrr);

figure('Position', [100, 100, 1200, 400]);
plot(ix_rpca, rse_rpca, '-o', 'DisplayName', 'RPCA');
hold on;
plot(ix_lrr, rse_lrr , '-x', 'DisplayName', 'LRR');
plot(ix_trpca, rse_trpca, '-s', 'DisplayName', 'TRPCA');
plot(ix_tlrr, rse_tlrr, '-d', 'DisplayName', 'TLRR');
hold off;

xlabel('Indeks');
ylabel('RSE');
legend('show');
grid on;

saveas(gcf, 'primerjava_rse_20_rho_15.png');

% Povprečna napaka PSNR
psnr_rpca_mean = mean(psnr_rpca); 
psnr_lrr_mean = mean(psnr_lrr);
psnr_trpca_mean = mean(psnr_trpca);
psnr_tlrr_mean = mean(psnr_tlrr);

% Povprečna napaka RSE 
rse_rpca_mean = mean(rse_rpca); 
rse_lrr_mean = mean(rse_lrr);
rse_trpca_mean = mean(rse_trpca);
rse_tlrr_mean = mean(rse_tlrr);

% Povprečen čas
time_rpca_mean = mean(time_rpca); 
time_lrr_mean = mean(time_lrr);
time_trpca_mean = mean(time_trpca);
time_tlrr_mean = mean(time_tlrr);

fprintf('---------------------------------------------------------------------------\n');
fprintf('-----------------------------GAUSOV ŠUM------------------------------------\n');


fprintf('Povprečna vrednost PSNR RTPCA za 20%% šumnih podatkov : %.2f\n',psnr_trpca_mean);
fprintf('Povprečna vrednost PSNR TLRR za 20%% šumnih podatkov : %.2f\n',psnr_tlrr_mean);
fprintf('Povprečna vrednost PSNR RPCA za 20%% šumnih podatkov : %.2f\n',psnr_rpca_mean);
fprintf('Povprečna vrednost PSNR LRR za 20%% šumnih podatkov : %.2f\n',psnr_lrr_mean);

fprintf('Povprečna vrednost RSE RTPCA za 20%% šumnih podatkov : %.2f\n',rse_trpca_mean);
fprintf('Povprečna vrednost RSE TLRR za 20%% šumnih podatkov : %.2f\n',rse_tlrr_mean);
fprintf('Povprečna vrednost RSE RPCA za 20%% šumnih podatkov : %.2f\n',rse_rpca_mean);
fprintf('Povprečna vrednost RSE LRR za 20%% šumnih podatkov : %.2f\n',rse_lrr_mean);

fprintf('Povprečna vrednost časa TRPCA za 20%% šumnih podatkov : %.2f\n',time_trpca_mean);
fprintf('Povprečna vrednost časa TLRR za 20%% šumnih podatkov : %.2f\n',time_tlrr_mean);
fprintf('Povprečna vrednost časa RPCA za 20%% šumnih podatkov : %.2f\n',time_rpca_mean);
fprintf('Povprečna vrednost časa LRR za 20%% šumnih podatkov : %.2f\n',time_lrr_mean);

fprintf('---------------------------------------------------------------------------\n');

noise_int = 0.4; 
time_rpca = data_rpca.Time; 
time_lrr = data_lrr.Time; 
noise_rpca = data_rpca.NoiseIntensity; 
noise_lrr = data_lrr.NoiseIntensity; 

time_rpca = time_rpca(noise_int == noise_rpca); 
time_lrr = time_lrr(noise_int == noise_lrr); 

ix_rpca = 1:length(time_rpca);
ix_lrr = 1:length(time_lrr);

time_trpca = data_trpca.Time; 
time_tlrr = data_tlrr.Time; 
noise_trpca = data_trpca.NoiseIntensity; 
noise_tlrr = data_tlrr.NoiseIntensity; 

time_trpca = time_trpca(noise_int == noise_trpca); 
time_tlrr = time_tlrr(noise_int == noise_tlrr); 

ix_trpca = 1:length(time_trpca);
ix_tlrr = 1:length(time_tlrr);

figure('Position', [100, 100, 1200, 400]); 
plot(ix_rpca, time_rpca, '-o', 'DisplayName', 'RPCA');
hold on;
plot(ix_lrr, time_lrr , '-x', 'DisplayName', 'LRR');
plot(ix_trpca, time_trpca, '-s', 'DisplayName', 'TRPCA');
plot(ix_tlrr, time_tlrr, '-d', 'DisplayName', 'TLRR');
hold off;

xlabel('Indeks');
ylabel('Čas');
legend('show');
grid on;

saveas(gcf, 'primerjava_časa_40_rho_15.png');

psnr_rpca = data_rpca.PSNR; 
psnr_lrr = data_lrr.PSNR; 
noise_rpca = data_rpca.NoiseIntensity; 
noise_lrr = data_lrr.NoiseIntensity; 

psnr_rpca = psnr_rpca(noise_int == noise_rpca); 
psnr_lrr = psnr_lrr(noise_int == noise_lrr); 

ix_rpca = 1:length(psnr_rpca);
ix_lrr = 1:length(psnr_lrr);

psnr_trpca = data_trpca.PSNR; 
psnr_tlrr = data_tlrr.PSNR; 
noise_trpca = data_trpca.NoiseIntensity; 
noise_tlrr = data_tlrr.NoiseIntensity; 

psnr_trpca = psnr_trpca(noise_int == noise_trpca); 
psnr_tlrr = psnr_tlrr(noise_int == noise_tlrr); 

ix_trpca = 1:length(time_trpca);
ix_tlrr = 1:length(time_tlrr);

figure('Position', [100, 100, 1200, 400]);
plot(ix_rpca, psnr_rpca, '-o', 'DisplayName', 'RPCA');
hold on;
plot(ix_lrr, psnr_lrr , '-x', 'DisplayName', 'LRR');
plot(ix_trpca, psnr_trpca, '-s', 'DisplayName', 'TRPCA');
plot(ix_tlrr, psnr_tlrr, '-d', 'DisplayName', 'TLRR');
hold off;

xlabel('Indeks');
ylabel('PSNR');
legend('show');
grid on;

saveas(gcf, 'primerjava_psnr_40_rho_15.png');

noise_int = 0.4; 
rse_rpca = data_rpca.RSE; 
rse_lrr = data_lrr.RSE; 
noise_rpca = data_rpca.NoiseIntensity; 
noise_lrr = data_lrr.NoiseIntensity; 

rse_rpca = rse_rpca(noise_int == noise_rpca); 
rse_lrr = rse_lrr(noise_int == noise_lrr); 

ix_rpca = 1:length(rse_rpca);
ix_lrr = 1:length(rse_lrr);

rse_trpca = data_trpca.RSE; 
rse_tlrr = data_tlrr.RSE; 
noise_trpca = data_trpca.NoiseIntensity; 
noise_tlrr = data_tlrr.NoiseIntensity; 

rse_trpca = rse_trpca(noise_int == noise_trpca); 
rse_tlrr = rse_tlrr(noise_int == noise_tlrr); 

ix_trpca = 1:length(time_trpca);
ix_tlrr = 1:length(time_tlrr);

figure('Position', [100, 100, 1200, 400]);
plot(ix_rpca, rse_rpca, '-o', 'DisplayName', 'RPCA');
hold on;
plot(ix_lrr, rse_lrr , '-x', 'DisplayName', 'LRR');
plot(ix_trpca, rse_trpca, '-s', 'DisplayName', 'TRPCA');
plot(ix_tlrr, rse_tlrr, '-d', 'DisplayName', 'TLRR');
hold off;

xlabel('Indeks');
ylabel('RSE');
legend('show');
grid on;

saveas(gcf, 'primerjava_rse_40_rho_15.png');

% povprecna napaka psnr
psnr_rpca_mean = mean(psnr_rpca); 
psnr_lrr_mean = mean(psnr_lrr);
psnr_trpca_mean = mean(psnr_trpca);
psnr_tlrr_mean = mean(psnr_tlrr);

% povprecna napaka rse 
rse_rpca_mean = mean(rse_rpca); 
rse_lrr_mean = mean(rse_lrr);
rse_trpca_mean = mean(rse_trpca);
rse_tlrr_mean = mean(rse_tlrr);

% povprecen cas
time_rpca_mean = mean(time_rpca); 
time_lrr_mean = mean(time_lrr);
time_trpca_mean = mean(time_trpca);
time_tlrr_mean = mean(time_tlrr);

fprintf('Povprečna vrednost PSNR RTPCA za 40%% šumnih podatkov : %.2f\n',psnr_trpca_mean);
fprintf('Povprečna vrednost PSNR TLRR za 40%% šumnih podatkov : %.2f\n',psnr_tlrr_mean);
fprintf('Povprečna vrednost PSNR RPCA za 40%% šumnih podatkov : %.2f\n',psnr_rpca_mean);
fprintf('Povprečna vrednost PSNR LRR za 40%% šumnih podatkov : %.2f\n',psnr_lrr_mean);

fprintf('Povprečna vrednost RSE RTPCA za 40%% šumnih podatkov : %.2f\n',rse_trpca_mean);
fprintf('Povprečna vrednost RSE TLRR za 40%% šumnih podatkov : %.2f\n',rse_tlrr_mean);
fprintf('Povprečna vrednost RSE RPCA za 40%% šumnih podatkov : %.2f\n',rse_rpca_mean);
fprintf('Povprečna vrednost RSE LRR za 40%% šumnih podatkov : %.2f\n',rse_lrr_mean);

fprintf('Povprečna vrednost časa TRPCA za 40%% šumnih podatkov : %.2f\n',time_trpca_mean);
fprintf('Povprečna vrednost časa TLRR za 40%% šumnih podatkov : %.2f\n',time_tlrr_mean);
fprintf('Povprečna vrednost časa RPCA za 40%% šumnih podatkov : %.2f\n',time_rpca_mean);
fprintf('Povprečna vrednost časa LRR za 40%% šumnih podatkov : %.2f\n',time_lrr_mean);


fprintf('---------------------------------------------------------------------------\n');

noise_int = 0.6; 
time_rpca = data_rpca.Time; 
time_lrr = data_lrr.Time; 
noise_rpca = data_rpca.NoiseIntensity; 
noise_lrr = data_lrr.NoiseIntensity; 

time_rpca = time_rpca(noise_int == noise_rpca); 
time_lrr = time_lrr(noise_int == noise_lrr); 

ix_rpca = 1:length(time_rpca);
ix_lrr = 1:length(time_lrr);

time_trpca = data_trpca.Time; 
time_tlrr = data_tlrr.Time; 
noise_trpca = data_trpca.NoiseIntensity; 
noise_tlrr = data_tlrr.NoiseIntensity; 

time_trpca = time_trpca(noise_int == noise_trpca); 
time_tlrr = time_tlrr(noise_int == noise_tlrr); 

ix_trpca = 1:length(time_trpca);
ix_tlrr = 1:length(time_tlrr);

figure('Position', [100, 100, 1200, 400]); 
plot(ix_rpca, time_rpca, '-o', 'DisplayName', 'RPCA');
hold on;
plot(ix_lrr, time_lrr , '-x', 'DisplayName', 'LRR');
plot(ix_trpca, time_trpca, '-s', 'DisplayName', 'TRPCA');
plot(ix_tlrr, time_tlrr, '-d', 'DisplayName', 'TLRR');
hold off;

xlabel('Indeks');
ylabel('Čas');
legend('show');
grid on;

saveas(gcf, 'primerjava_časa_60_rho_15.png');

psnr_rpca = data_rpca.PSNR; 
psnr_lrr = data_lrr.PSNR; 
noise_rpca = data_rpca.NoiseIntensity; 
noise_lrr = data_lrr.NoiseIntensity; 

psnr_rpca = psnr_rpca(noise_int == noise_rpca); 
psnr_lrr = psnr_lrr(noise_int == noise_lrr); 

ix_rpca = 1:length(psnr_rpca);
ix_lrr = 1:length(psnr_lrr);

psnr_trpca = data_trpca.PSNR; 
psnr_tlrr = data_tlrr.PSNR; 
noise_trpca = data_trpca.NoiseIntensity; 
noise_tlrr = data_tlrr.NoiseIntensity; 

psnr_trpca = psnr_trpca(noise_int == noise_trpca); 
psnr_tlrr = psnr_tlrr(noise_int == noise_tlrr); 

ix_trpca = 1:length(time_trpca);
ix_tlrr = 1:length(time_tlrr);

figure('Position', [100, 100, 1200, 400]);
plot(ix_rpca, psnr_rpca, '-o', 'DisplayName', 'RPCA');
hold on;
plot(ix_lrr, psnr_lrr , '-x', 'DisplayName', 'LRR');
plot(ix_trpca, psnr_trpca, '-s', 'DisplayName', 'TRPCA');
plot(ix_tlrr, psnr_tlrr, '-d', 'DisplayName', 'TLRR');
hold off;

xlabel('Indeks');
ylabel('PSNR');
legend('show');
grid on;

saveas(gcf, 'primerjava_psnr_60_rho_15.png');

noise_int = 0.6; 
rse_rpca = data_rpca.RSE; 
rse_lrr = data_lrr.RSE; 
noise_rpca = data_rpca.NoiseIntensity; 
noise_lrr = data_lrr.NoiseIntensity; 

rse_rpca = rse_rpca(noise_int == noise_rpca); 
rse_lrr = rse_lrr(noise_int == noise_lrr); 

ix_rpca = 1:length(rse_rpca);
ix_lrr = 1:length(rse_lrr);

rse_trpca = data_trpca.RSE; 
rse_tlrr = data_tlrr.RSE; 
noise_trpca = data_trpca.NoiseIntensity; 
noise_tlrr = data_tlrr.NoiseIntensity; 

rse_trpca = rse_trpca(noise_int == noise_trpca); 
rse_tlrr = rse_tlrr(noise_int == noise_tlrr); 

ix_trpca = 1:length(time_trpca);
ix_tlrr = 1:length(time_tlrr);

figure('Position', [100, 100, 1200, 400]);
plot(ix_rpca, rse_rpca, '-o', 'DisplayName', 'RPCA');
hold on;
plot(ix_lrr, rse_lrr , '-x', 'DisplayName', 'LRR');
plot(ix_trpca, rse_trpca, '-s', 'DisplayName', 'TRPCA');
plot(ix_tlrr, rse_tlrr, '-d', 'DisplayName', 'TLRR');
hold off;

xlabel('Indeks');
ylabel('RSE');
legend('show');
grid on;

saveas(gcf, 'primerjava_rse_60_rho_15.png');

psnr_rpca_mean = mean(psnr_rpca); 
psnr_lrr_mean = mean(psnr_lrr);
psnr_trpca_mean = mean(psnr_trpca);
psnr_tlrr_mean = mean(psnr_tlrr);

rse_rpca_mean = mean(rse_rpca); 
rse_lrr_mean = mean(rse_lrr);
rse_trpca_mean = mean(rse_trpca);
rse_tlrr_mean = mean(rse_tlrr);

time_rpca_mean = mean(time_rpca); 
time_lrr_mean = mean(time_lrr);
time_trpca_mean = mean(time_trpca);
time_tlrr_mean = mean(time_tlrr);
fprintf('---------------------------------------------------------------------------\n');


fprintf('Povprečna vrednost PSNR RTPCA za 60%% šumnih podatkov : %.2f\n',psnr_trpca_mean);
fprintf('Povprečna vrednost PSNR TLRR za 60%% šumnih podatkov : %.2f\n',psnr_tlrr_mean);
fprintf('Povprečna vrednost PSNR RPCA za 60%% šumnih podatkov : %.2f\n',psnr_rpca_mean);
fprintf('Povprečna vrednost PSNR LRR za 60%% šumnih podatkov : %.2f\n',psnr_lrr_mean);

fprintf('Povprečna vrednost RSE RTPCA za 60%% šumnih podatkov : %.2f\n',rse_trpca_mean);
fprintf('Povprečna vrednost RSE TLRR za 60%% šumnih podatkov : %.2f\n',rse_tlrr_mean);
fprintf('Povprečna vrednost RSE RPCA za 60%% šumnih podatkov : %.2f\n',rse_rpca_mean);
fprintf('Povprečna vrednost RSE LRR za 60%% šumnih podatkov : %.2f\n',rse_lrr_mean);

fprintf('Povprečna vrednost časa TRPCA za 60%% šumnih podatkov : %.2f\n',time_trpca_mean);
fprintf('Povprečna vrednost časa TLRR za 60%% šumnih podatkov : %.2f\n',time_tlrr_mean);
fprintf('Povprečna vrednost časa RPCA za 60%% šumnih podatkov : %.2f\n',time_rpca_mean);
fprintf('Povprečna vrednost časa LRR za 60%% šumnih podatkov : %.2f\n',time_lrr_mean);



