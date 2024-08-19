% Primerjava rekonstrukcij z uporabo algoritma TLRR s slovarjem R-TLRR in
% brez slovarja S-TLRR

% data = readtable('../diplomskiseminar/rezultati_tlrr_fixed_lambda_fourier_transform/');
data_rtlrr_20 = readtable('../diplomskiseminar/rezultati/rezultati_stepsizelarger_tlrr_fourier_transform/rezultati_stepsize_larger_20_tlrr.xlsx');
data_stlrr_20 = readtable('../diplomskiseminar/rezultati/rezultati_tlrr_brez_slovar_fixed_lambda_fourier_transform/rezultati_tlrr_brez_slovar20.xlsx');

data_rtlrr_stepsizesmaller = readtable('../diplomskiseminar/rezultati_tlrr_fixed_lambda_fourier_transform/rezultati_tlrr_20.xlsx');

time_rtlrr = mean(data_rtlrr_20.Time); 
time_stlrr = mean(data_stlrr_20.Time); 
time_rtlrr_1 = mean(data_rtlrr_stepsizesmaller.Time);

psnr_rtlrr = mean(data_rtlrr_20.PSNR); 
psnr_stlrr = mean(data_stlrr_20.PSNR); 


rse_rtlrr = mean(data_rtlrr_20.RSE); 
rse_stlrr = mean(data_stlrr_20.RSE); 

fprintf('Povprečna vrednost časa RTLRR za 20%% šumnih podatkov : %.2f\n', time_rtlrr);
fprintf('Povprečna vrednost PSNR RTLRR za 20%% šumnih podatkov : %.2f\n',psnr_rtlrr);
fprintf('Povprečna vrednost RSE RTLRR za 20%% šumnih podatkov : %.2f\n', rse_rtlrr);


fprintf('Povprečna vrednost časa STLRR za 20%% šumnih podatkov : %.2f\n', time_stlrr);
fprintf('Povprečna vrednost PSNR STLRR za 20%% šumnih podatkov : %.2f\n',psnr_stlrr);
fprintf('Povprečna vrednost RSE STLRR za 20%% šumnih podatkov : %.2f\n', rse_stlrr);

fprintf('P Povprečna vrednost časa RTLRR za 20%% šumnih podatkov : %.2f\n', time_rtlrr_1 );

data_rtlrr_40 = readtable('../diplomskiseminar/rezultati_stepsizelarger_tlrr_fourier_transform/rezultati_stepsize_larger_40_tlrr.xlsx');
data_stlrr_40 = readtable('../diplomskiseminar/rezultati_tlrr_brez_slovar_fixed_lambda_fourier_transform/rezultati_tlrr_brez_slovar40.xlsx');

data_rtlrr_stepsizesmaller = readtable('../diplomskiseminar/rezultati_tlrr_fixed_lambda_fourier_transform/rezultati_tlrr_40.xlsx');



time_rtlrr = mean(data_rtlrr_40.Time); 
time_stlrr = mean(data_stlrr_40.Time); 
time_rtlrr_1 = mean(data_rtlrr_stepsizesmaller.Time);

psnr_rtlrr = mean(data_rtlrr_40.PSNR); 
psnr_stlrr = mean(data_stlrr_40.PSNR); 


rse_rtlrr = mean(data_rtlrr_40.RSE); 
rse_stlrr = mean(data_stlrr_40.RSE); 


fprintf('Povprečna vrednost časa RTLRR za 40%% šumnih podatkov : %.2f\n', time_rtlrr);
fprintf('Povprečna vrednost PSNR RTLRR za 40%% šumnih podatkov : %.2f\n',psnr_rtlrr);
fprintf('Povprečna vrednost RSE RTLRR za 40%% šumnih podatkov : %.2f\n', rse_rtlrr);


fprintf('Povprečna vrednost časa STLRR za 40%% šumnih podatkov : %.2f\n', time_stlrr);
fprintf('Povprečna vrednost PSNR STLRR za 40%% šumnih podatkov : %.2f\n',psnr_stlrr);
fprintf('Povprečna vrednost RSE STLRR za 40%% šumnih podatkov : %.2f\n', rse_stlrr);

fprintf('P Povprečna vrednost časa RTLRR za 40%% šumnih podatkov : %.2f\n', time_rtlrr_1 );


data_rtlrr_60 = readtable('../diplomskiseminar/rezultati_stepsizelarger_tlrr_fourier_transform/rezultati_stepsize_larger_60_tlrr.xlsx');
data_stlrr_60 = readtable('../diplomskiseminar/rezultati_tlrr_brez_slovar_fixed_lambda_fourier_transform/rezultati_tlrr_brez_slovar60.xlsx');

data_rtlrr_stepsizesmaller = readtable('../diplomskiseminar/rezultati_tlrr_fixed_lambda_fourier_transform/rezultati_tlrr_60.xlsx');


time_rtlrr = mean(data_rtlrr_60.Time); 
time_stlrr = mean(data_stlrr_60.Time); 
time_rtlrr_1 = mean(data_rtlrr_stepsizesmaller.Time);

psnr_rtlrr = mean(data_rtlrr_60.PSNR); 
psnr_stlrr = mean(data_stlrr_60.PSNR); 


rse_rtlrr = mean(data_rtlrr_60.RSE); 
rse_stlrr = mean(data_stlrr_60.RSE); 


fprintf('Povprečna vrednost časa RTLRR za 60%% šumnih podatkov : %.2f\n', time_rtlrr);
fprintf('Povprečna vrednost PSNR RTLRR za 60%% šumnih podatkov : %.2f\n',psnr_rtlrr);
fprintf('Povprečna vrednost RSE RTLRR za 60%% šumnih podatkov : %.2f\n', rse_rtlrr);


fprintf('Povprečna vrednost časa STLRR za 60%% šumnih podatkov : %.2f\n', time_stlrr);
fprintf('Povprečna vrednost PSNR STLRR za 60%% šumnih podatkov : %.2f\n',psnr_stlrr);
fprintf('Povprečna vrednost RSE STLRR za 60%% šumnih podatkov : %.2f\n', rse_stlrr);

fprintf('P Povprečna vrednost časa RTLRR za 60%% šumnih podatkov : %.2f\n', time_rtlrr_1 );