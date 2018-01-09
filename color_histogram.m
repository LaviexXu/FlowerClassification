function [histogram] = color_histogram(image_path)
image = imread(image_path);
hsv_image = rgb2hsv(image);
pixel_count = 0;
h = hsv_image(:,:,1);
s = hsv_image(:,:,2);
v = hsv_image(:,:,3);
hsv_metrics = [reshape(h,[],1) reshape(s,[],1) reshape(v,[],1)];
index = kmeans(hsv_metrics,200);
histogram = zeros(1,200);
for i =1:size(index,1)
    histogram(index(i))=histogram(index(i))+1;
    pixel_count = pixel_count + 1;
end
histogram = histogram/pixel_count;
