% ===========================================================
% Method that separates heart from lungs
clear all clc
load sampledatawinslice
% vol1winsampleslice is the name of the variable (slice number 25)

I0 = vol1winsampleslice;
I1 = imfill(I0>0, 'holes');
I2 = imfill(I0 == 0, 'holes');
I3 = (~I2 & I1);
I4 = imfill(I3, 'holes');


%     Process a single slice
%     I0 = vol1win(:,:,slicenumber);
%     I1 = imfill(I0>0, 'holes');
%     I2 = imfill(I0 == 0, 'holes');
%     I3 = (~I2 & I1);
%     I4 = imfill(I3, 'holes');