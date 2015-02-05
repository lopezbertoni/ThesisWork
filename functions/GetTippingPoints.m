% Function that returns the four tipping points for the heart segmentation
% Input I is 2D binary image
function TippingPoints = GetTippingPoints(I)

% Ensure that we are going to find tipping points by drawing a line in the 
% middle of the binary image
% Allocate space
datasize = size(I);
I0 = I; 
I0(:, round(datasize(2)/2)-1:round(datasize(2)/2)) = 1;
[gx gy] = gradient(double(I0));
figure, imagesc(I0), colormap(gray), axis image
figure, imagesc(sqrt(gx.*gx + gy.*gy)), colormap(gray), axis image

% Start doing work
% Find distance transform of input image
% I1 = bwdist(I);
% figure, imagesc(I), colormap(gray), axis image
% figure, imagesc(I1), colormap(gray), axis image
% figure, imagesc(-1.*I1), colormap(gray), axis image
end