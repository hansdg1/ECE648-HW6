%================================================
%                 Hans Guthrie                  %
%  ECE 648 - Computer Excercise 3 - Due 4/2/15  %
%================================================

%% 1.1 -- DCT & iDCT

lena_original = im2double(imread('lena.bmp'));
% lena = double(imread('lena.bmp'));  % Input Image (filesize = 256 x 256)
blocksize = [8 8];                  % Divide into blocks

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

subplot(3, 3, 1);
imshow(zonal_4, []);
title('4 DCT Coefficients')

subplot(3, 3, 4);
imshow(zonal_9, []);
title('9 DCT Coefficients')

subplot(3, 3, 7);
imshow(zonal_16, []);
title('16 DCT Coefficients')

% Calculating MSE
mse_zonal_0  = mean(mean((lena_original - lenaInvDCT ).^2, 2),1)/(256*256);
mse_zonal_4  = mean(mean((lena_original - zonal_4    ).^2, 2),1)/(256*256);
mse_zonal_9  = mean(mean((lena_original - zonal_9    ).^2, 2),1)/(256*256);
mse_zonal_16 = mean(mean((lena_original - zonal_16   ).^2, 2),1)/(256*256);


saveFigs(fig2, 'ZonalSampling', 'png');
% http://stackoverflow.com/questions/3692335/how-to-find-the-mean-square-error-in-matlab#answer-3692509
% MSE = reshape(mean(mean((double(M1) - double(M2)).^2,2),1),[1,3]);


% http://www.mathworks.com/matlabcentral/answers/81048-mse-mean-square-error#answer_133017
% MSE1=mean(mean((im-imf1).^2));

