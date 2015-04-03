function hadamardTransform = hadamard_transform( input_img, blocksize, numCoeffs)
%HADAMARD Summary of this function goes here
%   Detailed explanation goes here
H = (1/sqrt(blocksize(1))) * hadamard(blocksize(1));


% fun = @(block_struct) dct2(block_struct.data);
% lenaH = blockproc(input_img,blocksize,


hadamardTransform.output = input_img .* H;

hadamardTransform.mse = meanSquaredError(input_img, hadamardTransform.output);
end
