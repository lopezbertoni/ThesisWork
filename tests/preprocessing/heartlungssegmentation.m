% Pre-processing steps to separate heart from lungs.
clear all  clc
% Preliminary steps common to all methods.
% Step 1 == Load data
% variable name is vol1
load sampledata
datasize = size(vol1);

% Hounsfield chose a scale that affects the four basic densities, with the following values:
% 
% Air = - 1000
% Fat = -60 to -120
% Water = 0
% Compact bone = +1000

% Window data parameters 
% from DICOM headers
win_w = 350;
win_c = 35;
rescale_i = -1024;
rescale_s = 1;
range = [0 255];
vol1win = GetWindowedData(vol1, range, win_w, win_c, rescale_i, rescale_s);

% ===========================================================
% Method that separates heart from lungs using tipping points
% Yan Yang's thesis.

slicenumber = 25;

if(slicenumber > 0)
    %     Process a single slice
    I0 = vol1win(:,:,slicenumber);
    I1 = imfill(I0>0, 'holes');
    I2 = imfill(I0 == 0, 'holes');
    I3 = (~I2 & I1);
    I4 = imfill(I3, 'holes');
else
    %     Proceess whole volume
end