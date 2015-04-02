function zonalSample_out = zonalSampling( input_img, blocksize, numCoeffs )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
mask_coeff = zeros(blocksize);
mask
% ones(zonal)
fun = @(block_struct) dct2(block_struct.data);
zonalSample_out = blockproc(input_img, blocksize, fun);
zonalSample_out = blockproc(zonalSample_out, blocksize
end

