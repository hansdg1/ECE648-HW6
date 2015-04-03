function zonalSample_out = zonalSampling( input_img, blocksize, numCoeffs )
%ZONALSAMPLING Returns a struct containing the compressed image, and the
%MSE between the input and returned image.
%   Compresses input_img by retaining only numCoeffs DCT coefficients

% Initialize 8x8 to all 0's
mask_coeff = zeros(blocksize);      

% Calculate the dimensions of the 1's mask
coeff = sqrt(numCoeffs);
mask_coeff(1:coeff, 1:coeff) = 1;

% Perform DCT
fun = @(block_struct) dct2(block_struct.data);
zonalSample = blockproc(input_img, blocksize, fun);

% Apply the mask
fun = @(block_struct) mask_coeff .* block_struct.data;
zonalSample = blockproc(zonalSample, blocksize, fun);

% Inverse DCT
fun = @(block_struct) idct2(block_struct.data);
zonalSample = blockproc(zonalSample, blocksize, fun);

% Setup output struct and calculate MSE
zonalSample_out.output = zonalSample;
zonalSample_out.mse = sum(sum((input_img - zonalSample_out.output).^2 ));
end
