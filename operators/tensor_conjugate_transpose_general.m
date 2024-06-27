function A_m_conj = tensor_conjugate_transpose_general(A_m)
    
    A_m_conj = permute(conj(A_m), [2, 1, 3]);
