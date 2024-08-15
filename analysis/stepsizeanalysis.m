% Primerjava konvergence pri rho = 1.1 in rho = 1.5

data_convergence_rho_11 = readtable('convergence_data_rho_11.xlsx');
data_convergence_rho_15 = readtable('convergence_data_rho_15.xlsx');

rho_11_iter = data_convergence_rho_11.Iteration;
rho_11_change = data_convergence_rho_11.MaxChange;

rho_15_iter = data_convergence_rho_15.Iteration;
rho_15_change = data_convergence_rho_15.MaxChange;

figure;
plot(rho_11_iter, rho_11_change , 'Marker', 'o');
hold on;
plot(rho_15_iter, rho_15_change, 'Marker', 's'); 

xlabel('Iteracije');
ylabel('Konvergenca');
legend({'gamma = 1.1', 'gamma = 1.5'}, 'Location', 'northeast');
grid on;
hold off;

saveas(gcf, 'konvergenca_stepsize_1.png');

