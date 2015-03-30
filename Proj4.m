%================================================
%                 Hans Guthrie                  %
%  ECE 648 - Computer Excercise 3 - Due 4/2/15  %
%================================================

%% 1.1
fig1 = figure(1);

lena = double(imread('lena.bmp'));  % Input Image (filesize = 256 x 256)
blocksize = [8 8];                  % Divide into blocks

subplot(1,2,1);
imshow(lena, []);
title('1.1 Original Image')
lenaDCT = nonoverlappingDCT(lena, blocksize);


subplot(1,2,2);
imshow(lenaiDCT, []);
title('1.1 Reconstructed Image')
lena_inv_dct = inverseDCT( lenaDCT, blocksize);

saveFigs(fig1, 'Reconstructed File', 'png');    %Save to a png file

