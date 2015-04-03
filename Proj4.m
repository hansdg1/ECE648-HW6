%================================================
%                 Hans Guthrie                  %
%  ECE 648 - Computer Excercise 3 - Due 4/2/15  %
%================================================

%% 1.1 -- DCT & iDCT

lena_original = im2double(imread('lena.bmp'));
[M, N] = size(lena_original);
% lena_im2double = im2double('lena.bmp');
% lena_im2double= double(imread('lena.bmp'));  % Input Image (filesize = 256 x 256)
blocksize = [8, 8];                  % Divide into blocks

fig1 = figure(1);
% Forward DCT Transform
subplot(1,2,1);
imshow(lena_original, []);
title('1.1 Original Image')
lenaFwdDCT = forwardDCT(lena_original, blocksize);

% Inverse DCT Transform
subplot(1,2,2);
lenaInvDCT = inverseDCT( lenaFwdDCT, blocksize);
imshow(lenaInvDCT, []);
title('1.1 Reconstructed Image')
saveFigs(fig1, 'ReconstructedPart1_1', 'png');    %Save to a png file
        

%% 1.2 -- DCT & iDCT
fig2 = figure(2);

subplot(3, 3, 2);
imshow(lena_original, []);
title('Original Image')
subplot(3, 3, 5);
imshow(lena_original, []);
title('Original Image')
subplot(3, 3, 8);
imshow(lena_original, []);
title('Original Image')


zonal_4  = zonalSampling(lena_original, blocksize, 4);
zonal_9  = zonalSampling(lena_original, blocksize, 9);
zonal_16 = zonalSampling(lena_original, blocksize, 16);
% 
subplot(3, 3, 1);
imshow(zonal_4.output, []);
title('4 DCT Coefficients')

subplot(3, 3, 4);
imshow(zonal_9.output, []);
title('9 DCT Coefficients')

subplot(3, 3, 7);
imshow(zonal_16.output, []);
title('16 DCT Coefficients')

% Print MSE for each
fprintf('MSE for zonal_4: %.2f\n', zonal_4.mse);
fprintf('MSE for zonal_9: %.2f\n', zonal_9.mse);
fprintf('MSE for zonal_16: %.2f\n', zonal_16.mse);

saveFigs(fig2, 'ZonalSampling.png', 'png');

