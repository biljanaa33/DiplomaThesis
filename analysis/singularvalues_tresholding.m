% Analiza singularnih vrednosti v odvisnosti od vrednosti parametra lambda

data_lambda_0001 = readtable('singular_values_0001.xlsx');
data_lambda_0005 = readtable('singular_values_0005.xlsx');
data_lambda_001 = readtable('singular_values_001.xlsx');
data_lambda_003 = readtable('singular_values_003.xlsx');
data_lambda_005 = readtable('singular_values_005.xlsx');
data_lambda_01 = readtable('singular_values_01.xlsx');


last_col_0001 = data_lambda_0001{end, :};
last_col_0005 = data_lambda_0005{end, :};
last_col_001 = data_lambda_001{end, :};
last_col_003 = data_lambda_003{end, :};
last_col_005 = data_lambda_005{end, :};
last_col_01 = data_lambda_01{end,  :};

figure; 
hold on;
plot(last_col_0001(2:100), 'DisplayName', 'Lambda 0.001','LineWidth', 1.8);
plot(last_col_0005(2:100), 'DisplayName', 'Lambda 0.005','LineWidth', 1.8);
plot(last_col_001(2:100), 'DisplayName', 'Lambda 0.01','LineWidth', 1.8);
plot(last_col_003(2:100), 'DisplayName', 'Lambda 0.03','LineWidth', 1.8);
plot(last_col_005(2:100), 'DisplayName', 'Lambda 0.05','LineWidth', 1.8);
plot(last_col_01(2:100), 'DisplayName', 'Lambda 0.1','LineWidth', 1.8);
hold off;

xlabel('Indeks singularne vrednosti');
ylabel('Velikost singularne vrednosti ');
legend show;
grid on;

saveas(gcf, 'singularne_vrednosti_1.png');
