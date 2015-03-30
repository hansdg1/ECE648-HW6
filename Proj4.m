%================================================
%                 Hans Guthrie                  %
%  ECE 648 - Computer Excercise 3 - Due 4/2/15  %
%================================================

%% 1.1
fig1 = figure(1);

lena = double(imread('lena.bmp'));  % Input Image (filesize = 256 x 256)
blocksize = [8 8];                  % Divide into blocks

% Forward DCT Transform
subplot(1,2,1);
imshow(lena, []);
title('1.1 Original Image')
lenaFwdDCT = forwardDCT(lena, blocksize);

% Inverse DCT Transform
subplot(1,2,2);
imshow(lenaInvDCT, []);
title('1.1 Reconstructed Image')
lenaInvDCT = inverseDCT( lenaFwdDCT, blocksize);

saveFigs(fig1, 'ReconstructedPart1_1', 'png');    %Save to a png file

