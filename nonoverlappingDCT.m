function DCTimg = nonoverlappingDCT( input_img, blocksize)
%NONOVERLAPPINGDCT Returns a double array of the 2d-DCT transform.
%   divides image into [blocksize blocksize] blocks, and
%computes the 2d-DCT of each block.

fun = @(block_struct) dct2(block_struct.data);
DCTimg = blockproc(input_img, blocksize, fun);

end