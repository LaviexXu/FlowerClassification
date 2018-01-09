function [distance] = chi_square_dist(hist1,hist2)
if size(hist1,1)~=size(hist2,1)
    error('two histogram has diffrent size');
end
distance = 0;
for index=1:size(hist1,1)
    if hist1(index)~=0 && hist2(index)~=0
        distance = distance+(hist1(index)-hist2(index))^2/(hist1(index)+hist2(index));
    end
end
