%================================================
%                 Hans Guthrie                  %
%  ECE 648 - Computer Excercise 3 - Due 4/2/15  %
%================================================

%% 1.1
fig1 = figure(1);
% Read in image. (Input filesize = 256 x 256)
lena = double(imread('lena.bmp'));

% Divide into blocks
blockSize = [8 8];

subplot(1,2,1);
imshow(lena, []);
title('1.1 Original Image')
fun = @(block_struct) dct2(block_struct.data);
lenaDCT = blockproc(lena, blockSize, fun);


subplot(1,2,2);
imshow(lenaiDCT, []);
title('1.1 Reconstructed Image')
fun = @(block_struct) idct2(block_struct.data);
lenaiDCT = blockproc(lenaDCT, blockSize, fun);

saveFigs(fig1, 'Reconstructed File', 'png');    %Save to a png file