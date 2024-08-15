% Primerjava rekonstrukcij z uporabo algoritma TLRR s slovarjem R-TLRR in
% brez slovarja S-TLRR
data_rtlrr = readtable('../rezultati_stepsizelarger_tlrr/rezultati_stepsize_larger_20_tlrr.xlsx');
data_stlrr = readtable('../rezultati_tlrr_brez_slovar/rezultati_tlrr_brez_slovar20.xlsx');

data_rtlrr_stepsizesmaller = readtable('../rezultati_tlrr/rezultati_tlrr_20.xlsx');

time_rtlrr = mean(data_rtlrr.Time); 
time_stlrr = mean(data_stlrr.Time); 
time_rtlrr_1 = mean(data_rtlrr_stepsizesmaller.Time);

psnr_rtlrr = mean(data_rtlrr.PSNR); 
psnr_stlrr = mean(data_stlrr.PSNR); 


rse_rtlrr = mean(data_rtlrr.RSE); 
rse_stlrr = mean(data_stlrr.RSE); 


fprintf('Povprečna vrednost časa RTLRR za 20%% šumnih podatkov : %.2f\n', time_rtlrr);
fprintf('Povprečna vrednost PSNR RTLRR za 20%% šumnih podatkov : %.2f\n',psnr_rtlrr);
fprintf('Povprečna vrednost RSE RTLRR za 20%% šumnih podatkov : %.2f\n', rse_rtlrr);


fprintf('Povprečna vrednost časa STLRR za 20%% šumnih podatkov : %.2f\n', time_stlrr);
fprintf('Povprečna vrednost PSNR STLRR za 20%% šumnih podatkov : %.2f\n',psnr_stlrr);
fprintf('Povprečna vrednost RSE STLRR za 20%% šumnih podatkov : %.2f\n', rse_stlrr);

fprintf('Povprečna vrednost časa RTLRR za 20%% šumnih podatkov : %.2f\n', time_rtlrr_1 );