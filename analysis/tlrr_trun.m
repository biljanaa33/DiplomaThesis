% Rekonstrukcija z uporabo truncated TLRR

data_tlrr = readtable("../rezultati_tlrr/rezultati_tlrr.xlsx"); 
data_tlrr_trun = readtable("../rezultati_lrr_trun.xlsx");

noise_int = 0.6; 
time_tlrr = data_tlrr.Time; 
time_tlrr_trun = data_tlrr_trun.Time; 
noise_tlrr = data_tlrr.NoiseIntensity; 
noise_tlrr_trun = data_tlrr_trun.NoiseIntensity; 

time_tlrr = time_tlrr(noise_int == noise_tlrr); 
time_tlrr_trun = time_tlrr_trun(noise_int == noise_tlrr_trun); 

ix_tlrr = 1:length(time_tlrr);
ix_tlrr_trun = 1:length(time_tlrr_trun);

noise_int = 0.2; 
rse_tlrr = data_tlrr.RSE; 
rse_tlrr_trun = data_tlrr_trun.RSE; 
noise_tlrr = data_tlrr.NoiseIntensity; 
noise_tlrr_trun = data_tlrr_trun.NoiseIntensity; 

rse_tlrr = rse_tlrr(noise_int == noise_tlrr); 
rse_tlrr_trun = rse_tlrr_trun(noise_int == noise_tlrr_trun); 

ix_tlrr = 1:length(rse_tlrr);
ix_tlrr_trun = 1:length(rse_tlrr_trun);

figure('Position', [100, 100, 1200, 400]); 
plot(ix_tlrr, rse_tlrr, '-o', 'DisplayName', 'TLRR');
hold on;
plot(ix_tlrr_trun, rse_tlrr_trun, '-x', 'DisplayName', 'TLRR Truncated');
hold off;

xlabel('Indeks');
ylabel('RSE');
legend('show');
grid on;

saveas(gcf, 'primerjava_rse_tlrr.png');