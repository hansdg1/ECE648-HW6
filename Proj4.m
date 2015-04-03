%================================================
%                 Hans Guthrie                  %
%  ECE 648 - Computer Excercise 3 - Due 4/2/15  %
%================================================

%% 1.1 -- DCT & iDCT

lena_original = im2double(imread('lena.bmp'));
[M, N] = size(lena_original);
% lena_im2double = im2double('lena.bmp');
% lena_im2double= im2double(imread('lena.bmp'));  % Input Image (filesize = 256 x 256)
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

% Put Original images in middle
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

% Zonal plots on left
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


%% 1.3 Hadamard

H = (1/sqrt(8))*hadamard(8);
Zero = zeros(8);
Mask4 = Zero;
Mask9 = Zero;
Mask16 = Zero;
Mask4(1:2, 1:2) = 1;
Mask9(1:3, 1:3) = 1;
Mask16(1:4, 1:4) = 1;

% 4 Coefficients
lenaH = blkproc(lena_original, [8,8], 'P1*x*P2', H, H');
fun = @(block_struct) Mask4.*block_struct.data;
lena4H = blockproc(lenaH, [8 8], fun);
lena4H = blkproc(lena4H, [8,8], 'P1*x*P2', H, H');

subplot(3, 3, 3);
imshow(lena4H, []);
title('4 Hadamard Coefficients')

% 9 Coefficients
lenaH = blkproc(lena_original, [8,8], 'P1*x*P2', H, H');
fun = @(block_struct) Mask9.*block_struct.data;
lena9H = blockproc(lenaH, [8 8], fun);
lena9H = blkproc(lena9H, [8,8], 'P1*x*P2', H, H');

subplot(3, 3, 6);
imshow(lena9H, []);
title('9 Hadamard Coefficients')

% 9 Coefficients
lenaH = blkproc(lena_original, [8,8], 'P1*x*P2', H, H');
fun = @(block_struct) Mask16.*block_struct.data;
lena16H = blockproc(lenaH, [8 8], fun);
lena16H = blkproc(lena16H, [8,8], 'P1*x*P2', H, H');

subplot(3, 3, 9);
imshow(lena16H, []);
title('16 Hadamard Coefficients')

fprintf('MSE for Hadamard 4: %.2f\n', meanSquaredError(lena_original, lena4H));
fprintf('MSE for Hadamard 9: %.2f\n', meanSquaredError(lena_original, lena9H));
fprintf('MSE for Hadamard 16: %.2f\n', meanSquaredError(lena_original, lena16H));


saveFigs(fig2, 'ZonalSampling.png', 'png');
