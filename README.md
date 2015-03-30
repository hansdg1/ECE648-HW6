# ECE648-HW6
"Computer Exercise 3" -- Image Compression 1
The purpose of this exercise is to perform block-based compression of images using orthogonal
transforms and zonal sampling.
# Transform Coding of Images
## Forward and Inverse Transform
1. Read the 8-bit image [lena.bmp](lena.bmp) of size 256x256 and convert it into double type. (*imread*, *double*)
1. Divide the image into nonoverlapping 8x8 blocks and compute DCT of each block. (*blkproc*, *dct2*)
1. Reconstruct the image by performing the inverse DCT. (*blkproc*, *idct2*)
1. Display and print the original and reconstructed images side by side. (*subplot*)

##Image Compression by Zonal Sampling Using DCT
1. Compress the image by retaining only 4 DCT coefficients (2x2 array at the top left corner of the 8x8 block) before reconstructing the image. This can be done by multiplying each DCT block by an 8x8 mask with ones and zeros in appropriate positions (*blkproc*).
1. Repeat the above step by retaining 9 DCT coefficients (3x3 array) and 16 DCT coefficients (4x4 array).
1. Compute the mean squared error (*mse*) between the original and compressed images in all cases.
1. Display and print the original and reconstructed images side by side. (*subplot*)

##Image Compression by Zonal Sampling Using Hadamard Transform
Repeat all steps of the compression procedure as described above using Hadamard transform instead ofDCT and print the corresponding images side by side. (*hadamard*)

#Write-Up
1. Table of *mse* for all the compressed images.
1. Comment on the quality (subjective as well as quantitative) of the compresed images obtained by DCT and Hadamard transform techniques.
1. Give the listing of the MATLAB programs used in the computer experiment.
