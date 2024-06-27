function t_rank = tensor_tubal_rank(A)

    A_fft = fft(A, [], 3); 
    [~, S, ~] = svd(A_fft(:,:,1));
    threshold = 10e-8; 
    t_rank = nnz(S > threshold);
         
