function InvDCT_img = inverseDCT( dct_img, blocksize )
%INVERSEDCT Returns a double array of the inverse DCT.
%   Reconstructs the origial image by performing an inverse DCT transform

fun = @(block_struct) idct2(block_struct.data);
InvDCT_img = blockproc(dct_img, blocksize, fun);

end

