clear all clc

load sampledataslice;

vol1slicers = vol1slice -1024;

minH = min(vol1slicers(:));
maxH = max(vol1slicers(:));

x = linspace(minH, maxH, maxH - minH + 1);

h = hist(vol1slicers(:), x); % Raw hist

h = h/max(h(:));

% Gauss Normalized
g = gausswin(20); % <-- this value determines the width of the smoothing window
g = g/sum(g);

% Normalized  Gaussian smoothed histogram
hs = conv(h, g, 'same');

% Find derivatives of hs
dhsdx = conv(diff(hs)./diff(x), g, 'same');
xd = x(1:length(x)-1);

d2hsdx = conv(diff(dhsdx)./diff(xd), g, 'same');
x2d = x(1:length(xd)-1);

% Find 0 crossings of hs
dhsdx_m = dhsdx(1:end -1) .* dhsdx(2:end);
critical = xd(dhsdx_m < 0);
% Use threshold of 1500 due to noisy signal. 
critical_s = critical(critical < 1500);
% Find threshold 
th = critical_s(end-1);
