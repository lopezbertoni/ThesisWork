% Pre-processing steps to separate heart from lungs. 
clear all  clc 
% Preliminary steps common to all methods.
% Step 1 == Load data
% variable name is vol1
load sampledata 
datasize = size(vol1);

% ===========================================================
% Method that separates heart from lungs using tipping points
% Yan Yang's thesis. 

