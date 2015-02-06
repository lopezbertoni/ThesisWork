function I_d = DilateImage(I, iter, se)
I_d = zeros(size(I));
I_d = imdilate(I, se);
for j = 1:(iter - 1),
    I_d = imdilate(I_d, se);
end
end