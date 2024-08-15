% Analiza različnih vrst obrnljivih transformacij


addpath('algorithms');
addpath('helper_functions');
addpath('operators');

% Povprečna rekonstrukcija za pozitivne transformacije

data_lt_1 = readtable('../results/rezultati_invertible_transformations/invertible_proba_lt01.xlsx'); % Lambda = 0.02

lambda = 0.0200; 
time_lt_1 = data_lt_1.time; 
psnr_lt_1 = data_lt_1.PSNR; 
rse_lt_1 = data_lt_1.RSE; 
lambda_lt_1 = data_lt_1.lambda; 

tolerance = 1e-6; 
indices = find(abs(lambda_lt_1 - lambda) < tolerance);

time_lt_1 = time_lt_1(indices); 
psnr_lt_1 = psnr_lt_1(indices); 
rse_lt_1 = rse_lt_1(indices); 

time_lt1 = mean(time_lt_1); 
psnr_lt1 = mean(psnr_lt_1); 
rse_lt1 = mean(rse_lt_1);

%disp(time_lt1);
%disp(psnr_lt1);
%disp(rse_lt1);

data_lt_2 = readtable('../results/rezultati_invertible_transformations/invertible_proba_lt02.xlsx'); % Lambda = 0.11

lambda = 0.1100; 
time_lt_2 = data_lt_2.time; 
psnr_lt_2 = data_lt_2.PSNR; 
rse_lt_2 = data_lt_2.RSE; 
lambda_lt_2 = data_lt_2.lambda; 

tolerance = 1e-6; 
indices = find(abs(lambda_lt_2 - lambda) < tolerance);

time_lt_2 = time_lt_2(indices); 
psnr_lt_2 = psnr_lt_2(indices); 
rse_lt_2 = rse_lt_2(indices); 

time_lt2 = mean(time_lt_2); 
psnr_lt2 = mean(psnr_lt_2); 
rse_lt2 = mean(rse_lt_2);

%disp(time_lt2);
%disp(psnr_lt2);
%disp(rse_lt2);

data_lt_3 = readtable('../results/rezultati_invertible_transformations/invertible_proba_lt03.xlsx'); % Lambda = 0.01

lambda = 0.0100; 
time_lt_3 = data_lt_3.time; 
psnr_lt_3 = data_lt_3.PSNR; 
rse_lt_3 = data_lt_3.RSE; 
lambda_lt_3 = data_lt_3.lambda; 

tolerance = 1e-6; 
indices = find(abs(lambda_lt_3 - lambda) < tolerance);

time_lt_3 = time_lt_3(indices); 
psnr_lt_3 = psnr_lt_3(indices); 
rse_lt_3 = rse_lt_3(indices); 

time_lt3 = mean(time_lt_3); 
psnr_lt3 = mean(psnr_lt_3); 
rse_lt3 = mean(rse_lt_3);

%disp(time_lt3);
%disp(psnr_lt3);
%disp(rse_lt3);

rse_positive = (rse_lt1 + rse_lt3 + rse_lt2) / 3;
psnr_positive = (psnr_lt3 + psnr_lt1 + psnr_lt2) / 3;
time_positive = (time_lt3 + time_lt1 + time_lt2) / 3;


fprintf('Povprečna vrednost PSNR : %.2f\n',psnr_positive);
fprintf('Povprečna vrednost RSE : %.2f\n',rse_positive);
fprintf('Povprečna vrednost časa : %.2f\n',time_positive);


% Povprečna rekonstrukcija z negativnimi vrednostmi

data_lt_4 = readtable('../results/rezultati_invertible_transformations/invertible_proba_lt04.xlsx'); % Lambda = 0.2 

lambda = 0.200; 
time_lt_4 = data_lt_4.time; 
psnr_lt_4 = data_lt_4.PSNR; 
rse_lt_4 = data_lt_4.RSE; 
lambda_lt_4 = data_lt_4.lambda; 

tolerance = 1e-6; 
indices = find(abs(lambda_lt_4 - lambda) < tolerance);

time_lt_4 = time_lt_4(indices); 
psnr_lt_4 = psnr_lt_4(indices); 
rse_lt_4 = rse_lt_4(indices); 

time_lt4 = mean(time_lt_4); 
psnr_lt4 = mean(psnr_lt_4); 
rse_lt4 = mean(rse_lt_4);

% disp(time_lt4);
% disp(psnr_lt4);
% disp(rse_lt4);

data_lt_5 = readtable('../results/rezultati_invertible_transformations/invertible_proba_lt05.xlsx'); % Lambda = 0.02

lambda = 0.020; 
time_lt_5 = data_lt_5.time; 
psnr_lt_5 = data_lt_5.PSNR; 
rse_lt_5 = data_lt_5.RSE; 
lambda_lt_5 = data_lt_5.lambda; 

tolerance = 1e-6; 
indices = find(abs(lambda_lt_5 - lambda) < tolerance);

time_lt_5 = time_lt_5(indices); 
psnr_lt_5 = psnr_lt_5(indices); 
rse_lt_5 = rse_lt_5(indices); 

time_lt5 = mean(time_lt_5); 
psnr_lt5 = mean(psnr_lt_5); 
rse_lt5 = mean(rse_lt_5);

% disp(time_lt5);
% disp(psnr_lt5);
% disp(rse_lt5);

data_lt_6 = readtable('../results/rezultati_invertible_transformations/invertible_proba_lt06.xlsx'); % Lambda = 0.02

lambda = 0.020; 
time_lt_6 = data_lt_6.time; 
psnr_lt_6 = data_lt_6.PSNR; 
rse_lt_6 = data_lt_6.RSE; 
lambda_lt_6 = data_lt_6.lambda; 

tolerance = 1e-6; 
indices = find(abs(lambda_lt_6 - lambda) < tolerance);

time_lt_6 = time_lt_6(indices); 
psnr_lt_6 = psnr_lt_6(indices); 
rse_lt_6 = rse_lt_6(indices); 

time_lt6 = mean(time_lt_6); 
psnr_lt6 = mean(psnr_lt_6); 
rse_lt6 = mean(rse_lt_6);

% disp(time_lt6);
% disp(psnr_lt6);
% disp(rse_lt6);

rse_positive = (rse_lt4 + rse_lt5 + rse_lt6) / 3;
psnr_positive = (psnr_lt4 + psnr_lt5 + psnr_lt6) / 3;
time_positive = (time_lt4 + time_lt5 + time_lt6) / 3;


fprintf('Povprečna vrednost PSNR : %.2f\n',psnr_positive);
fprintf('Povprečna vrednost RSE : %.2f\n',rse_positive);
fprintf('Povprečna vrednost časa : %.2f\n',time_positive);




% Povprečna rekonstrukcija z pozitivnimi, negativnimi vrednostmi in 0

data_lt_7 = readtable('../results/rezultati_invertible_transformations/invertible_proba_lt07.xlsx'); % Lambda = 0.02

lambda = 0.020; 
time_lt_7 = data_lt_7.time; 
psnr_lt_7 = data_lt_7.PSNR; 
rse_lt_7 = data_lt_7.RSE; 
lambda_lt_7 = data_lt_7.lambda; 

tolerance = 1e-6; 
indices = find(abs(lambda_lt_7 - lambda) < tolerance);

time_lt_7 = time_lt_7(indices); 
psnr_lt_7 = psnr_lt_7(indices); 
rse_lt_7 = rse_lt_7(indices); 

time_lt7 = mean(time_lt_7); 
psnr_lt7 = mean(psnr_lt_7); 
rse_lt7 = mean(rse_lt_7);

% disp(time_lt7);
% disp(psnr_lt7);
% disp(rse_lt7);


data_lt_8 = readtable('../results/rezultati_invertible_transformations/invertible_proba_lt08.xlsx'); % Lambda = 0.02

lambda = 0.020; 
time_lt_8 = data_lt_8.time; 
psnr_lt_8 = data_lt_8.PSNR; 
rse_lt_8 = data_lt_8.RSE; 
lambda_lt_8 = data_lt_8.lambda; 

tolerance = 1e-6; 
indices = find(abs(lambda_lt_8 - lambda) < tolerance);

time_lt_8 = time_lt_8(indices); 
psnr_lt_8 = psnr_lt_8(indices); 
rse_lt_8 = rse_lt_8(indices); 

time_lt8 = mean(time_lt_8); 
psnr_lt8 = mean(psnr_lt_8); 
rse_lt8 = mean(rse_lt_8);

% disp(time_lt8);
% disp(psnr_lt8);
% disp(rse_lt8);

data_lt_9 = readtable('../results/rezultati_invertible_transformations/invertible_proba_lt09.xlsx'); % Lambda = 0.02

lambda = 0.020; 
time_lt_9 = data_lt_9.time; 
psnr_lt_9 = data_lt_9.PSNR; 
rse_lt_9 = data_lt_9.RSE; 
lambda_lt_9 = data_lt_9.lambda; 

tolerance = 1e-6; 
indices = find(abs(lambda_lt_9 - lambda) < tolerance);

time_lt_9 = time_lt_9(indices); 
psnr_lt_9 = psnr_lt_9(indices); 
rse_lt_9 = rse_lt_9(indices); 

time_lt9 = mean(time_lt_9); 
psnr_lt9 = mean(psnr_lt_9); 
rse_lt9 = mean(rse_lt_9);

% disp(time_lt9);
% disp(psnr_lt9);
% disp(rse_lt9);


data_lt_10 = readtable('../results/rezultati_invertible_transformations/invertible_proba_lt10.xlsx'); % Lambda = 0.02 

lambda = 0.020; 
time_lt_10 = data_lt_10.time; 
psnr_lt_10 = data_lt_10.PSNR; 
rse_lt_10 = data_lt_10.RSE; 
lambda_lt_10 = data_lt_10.lambda; 

tolerance = 1e-6; 
indices = find(abs(lambda_lt_10 - lambda) < tolerance);

time_lt_10 = time_lt_10(indices); 
psnr_lt_10 = psnr_lt_10(indices); 
rse_lt_10 = rse_lt_10(indices); 

time_lt10 = mean(time_lt_10); 
psnr_lt10 = mean(psnr_lt_10); 
rse_lt10 = mean(rse_lt_10);

% disp(time_lt10);
% disp(psnr_lt10);
% disp(rse_lt10);

rse_positive = (rse_lt7 + rse_lt8 + rse_lt9 + rse_lt10) / 4;
psnr_positive = (psnr_lt7 + psnr_lt8 + psnr_lt9 + psnr_lt10) / 4;
time_positive = (time_lt7 + time_lt8 + time_lt9 + time_lt10) / 4;


fprintf('Povprečna vrednost PSNR : %.2f\n',psnr_positive);
fprintf('Povprečna vrednost RSE : %.2f\n',rse_positive);
fprintf('Povprečna vrednost časa : %.2f\n',time_positive);

