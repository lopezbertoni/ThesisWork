function I_e = ErodeImage(I, iter, se)
I_e = zeros(size(I));
I_e = imerode(I, se);
for j = 1:(iter - 1),
    I_e = imerode(I_e, se);
end
end