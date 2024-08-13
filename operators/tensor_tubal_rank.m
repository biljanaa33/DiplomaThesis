function t_rank = tensor_tubal_rank(A)
% Izračun vlakenskega ranga tenzorja z uporabo Fourierove transformacije

    A_fft = fft(A, [], 3); 
    [~, S, ~] = svd(A_fft(:,:,1));
    threshold = 10e-8; 
    % Število neničelnih singularnih vrednosti prvega frontalnega reza 
    t_rank = nnz(S > threshold);
         
