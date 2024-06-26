function [PSNR, SSIM] = error_calculation(I_original, I_denoised)


    PSNR = psnr(I_original, I_denoised);
    SSIM = ssim(I_original, I_denoised); 

