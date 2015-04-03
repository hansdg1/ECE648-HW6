function [zonalSample_out] = zonalSampling( input_img, blocksize, numCoeffs )
%ZONALSAMPLING Summary of this function goes here
%   Detailed explanation goes here

mask_coeff = zeros(blocksize);      % Initialize 8x8 to all 0's

% Calculate the dimensions of the 1's mask
coeff = sqrt(numCoeffs);
mask_coeff(1:coeff, 1:coeff) = 1;



% Perform DCT
fun = @(block_struct) dct2(block_struct.data);
zonalSample_out = blockproc(input_img, blocksize, fun);

% Apply the mask
fun = @(block_struct) mask_coeff .* block_struct.data;
zonalSample_out = blockproc(zonalSample_out, blocksize, fun);

% Inverse DCT
fun = @(block_struct) idct2(block_struct.data);
zonalSample_out = blockproc(zonalSample_out, blocksize, fun);

% zonalSample_out.mse = 
end

