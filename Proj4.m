%================================================
%                 Hans Guthrie                  %
%  ECE 648 - Computer Excercise 3 - Due 4/2/15  %
%================================================

%% 1.1 -- DCT & iDCT

lena = im2double(imread('lena.bmp'));
% lena = double(imread('lena.bmp'));  % Input Image (filesize = 256 x 256)
blocksize = [8 8];                  % Divide into blocks

fig1 = figure(1);
% Forward DCT Transform
subplot(1,2,1);
imshow(lena, []);
title('1.1 Original Image')
lenaFwdDCT = forwardDCT(lena, blocksize);

% Inverse DCT Transform
subplot(1,2,2);
lenaInvDCT = inverseDCT( lenaFwdDCT, blocksize);
imshow(lenaInvDCT, []);
title('1.1 Reconstructed Image')
saveFigs(fig1, 'ReconstructedPart1_1', 'png');    %Save to a png file


%% 1.2 -- DCT & iDCT

zonal_4 = zonalSampling(lena, blocksize, 4);
zonal_9 = zonalSampling(lena, blocksize, 9);
zonal_16 = zonalSampling(lena, blocksize, 16);
