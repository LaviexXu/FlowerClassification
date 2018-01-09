function [histogram] = shape_histogram(image_path)
[~,descrips,~] = sift(image_path);
index = kmeans(descrips,100);
pixel_count = 0;
histogram = zeros(1,100);
for i =1:size(index,1)
    histogram(index(i))=histogram(index(i))+1;
    pixel_count = pixel_count + 1;
end
histogram = histogram/pixel_count;