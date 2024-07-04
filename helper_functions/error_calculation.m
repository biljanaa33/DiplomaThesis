function [PSNR, SSIM, RSE] = error_calculation(I_original, I_denoised)


    PSNR = psnr(I_original, I_denoised);
    SSIM = ssim(I_original, I_denoised); 

    L = I_original(:);
    L_r = I_denoised(:); 
    RSE = norm(L_r-L) / norm(L);

