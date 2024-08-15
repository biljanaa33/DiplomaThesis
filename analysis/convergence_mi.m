% Prikaz število iteracij, potrebnih za konvergenco v odvisnosti od 
% vrednosti parametra mi

data_lambda_grad = readtable('convergence_data_mi_gradually.xlsx');
data_lambda_1 = readtable('convergence_data_mi_1.xlsx');
data_lambda_01 = readtable('convergence_data_mi_01.xlsx');
data_lambda_10 = readtable('convergence_data_mi_10.xlsx');
data_lambda_100 = readtable('convergence_data_mi_100.xlsx');
data_lambda_1000 = readtable('convergence_data_mi_1000.xlsx');

data_lambda_grad_iter = data_lambda_grad.Iteration; 
data_lambda_grad_rse = data_lambda_grad.RSE;
data_lambda_1_iter = data_lambda_1.Iteration; 
data_lambda_1_rse = data_lambda_1.RSE;
data_lambda_01_iter = data_lambda_01.Iteration; 
data_lambda_01_rse = data_lambda_01.RSE;
data_lambda_10_iter = data_lambda_10.Iteration; 
data_lambda_10_rse = data_lambda_10.RSE;
data_lambda_100_iter = data_lambda_100.Iteration; 
data_lambda_100_rse = data_lambda_100.RSE;
data_lambda_1000_iter = data_lambda_1000.Iteration; 
data_lambda_1000_rse = data_lambda_1000.RSE;

end_position_grad = length(data_lambda_grad_iter(1:end));

figure; 
hold on;

plot_with_limit(data_lambda_grad_iter, data_lambda_grad_rse, 'mi: spreminjajoč');
plot_with_limit(data_lambda_1_iter, data_lambda_1_rse, 'mi: 1');
plot_with_limit(data_lambda_01_iter, data_lambda_01_rse, 'mi: 0.1');
plot_with_limit(data_lambda_10_iter, data_lambda_10_rse, 'mi: 10');
plot_with_limit(data_lambda_100_iter, data_lambda_100_rse, 'mi: 100');
plot_with_limit(data_lambda_1000_iter, data_lambda_1000_rse, 'mi: 1000');

xline(end_position_grad, '--r','DisplayName','Najhitrejša konvergenca','LineWidth', 2.0);

xlabel('Iteracije');
ylabel('RSE');
legend show;
grid on;

saveas(gcf, 'mi_convergence.png');

hold off;

function plot_with_limit(iter, rse, label)
    num_entries = min(length(iter), 200);
    plot(iter(1:num_entries), rse(1:num_entries), 'DisplayName', label, 'LineWidth', 2.0);
end


