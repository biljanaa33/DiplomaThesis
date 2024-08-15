data_fft= readtable('../rezultati_invertible_stepsizelarger/rezultati_poljubnatransformacija_stepsizelarger.xlsx');

noise_int = 0.2; 
time = data_fft.Time; 
noise = data_fft.NoiseIntensity; 

time = time(noise_int == noise); 


psnr = data_fft.PSNR;  
psnr = psnr(noise_int == noise); 

rse = data_fft.RSE;  
rse = rse(noise_int == noise); 


psnr_mean = mean(psnr); 
rse_mean = mean(rse); 
time_mean = mean(time); 


fprintf('---------------------------------------------------------------------------\n');
fprintf('-----------------------------GAUSOV ŠUM------------------------------------\n');


fprintf('Povprečna vrednost PSNR RTPCA za 20%% šumnih podatkov : %.2f\n',psnr_mean);
fprintf('Povprečna vrednost RSE RTPCA za 20%% šumnih podatkov : %.2f\n',rse_mean);
fprintf('Povprečna vrednost časa TRPCA za 20%% šumnih podatkov : %.2f\n',time_mean);


fprintf('---------------------------------------------------------------------------\n');

data_fft= readtable('../rezultati_invertible_stepsizelarger/rezultati_poljubnatransformacija_stepsizelarger.xlsx');

noise_int = 0.4; 
time = data_fft.Time; 
noise = data_fft.NoiseIntensity; 

time = time(noise_int == noise); 


psnr = data_fft.PSNR;  
psnr = psnr(noise_int == noise); 

rse = data_fft.RSE;  
rse = rse(noise_int == noise); 


psnr_mean = mean(psnr); 
rse_mean = mean(rse); 
time_mean = mean(time); 


fprintf('---------------------------------------------------------------------------\n');
fprintf('-----------------------------GAUSOV ŠUM------------------------------------\n');


fprintf('Povprečna vrednost PSNR RTPCA za 40%% šumnih podatkov : %.2f\n',psnr_mean);
fprintf('Povprečna vrednost RSE RTPCA za 40%% šumnih podatkov : %.2f\n',rse_mean);
fprintf('Povprečna vrednost časa TRPCA za 40%% šumnih podatkov : %.2f\n',time_mean);


fprintf('---------------------------------------------------------------------------\n');


data_fft= readtable('../rezultati_invertible_stepsizelarger/rezultati_poljubnatransformacija_stepsizelarger.xlsx');

noise_int = 0.6; 
time = data_fft.Time; 
noise = data_fft.NoiseIntensity; 

time = time(noise_int == noise); 


psnr = data_fft.PSNR;  
psnr = psnr(noise_int == noise); 

rse = data_fft.RSE;  
rse = rse(noise_int == noise); 


psnr_mean = mean(psnr); 
rse_mean = mean(rse); 
time_mean = mean(time); 


fprintf('---------------------------------------------------------------------------\n');
fprintf('-----------------------------GAUSOV ŠUM------------------------------------\n');


fprintf('Povprečna vrednost PSNR RTPCA za 60%% šumnih podatkov : %.2f\n',psnr_mean);
fprintf('Povprečna vrednost RSE RTPCA za 60%% šumnih podatkov : %.2f\n',rse_mean);
fprintf('Povprečna vrednost časa TRPCA za 60%% šumnih podatkov : %.2f\n',time_mean);


fprintf('---------------------------------------------------------------------------\n');