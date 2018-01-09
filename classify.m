function [index] = classify(image_path)
%��ȡ���������ʻ��
[texture_hist] = texture_histogram(image_path);
%��ȡ��ɫ�����ʻ��
[color_hist] = color_histogram(image_path);
%��ȡ��״�����ʻ��
[shape_hist] = shape_histogram(image_path);
load('vocabulary.mat','texture_mat');
load('vocabulary.mat','color_mat');
load('vocabulary.mat','shape_mat');
distance = ones(1,240);
for i=1:240
    distance(i) = chi_square_dist(texture_hist,texture_mat(i,:))+0.4*chi_square_dist(color_hist,color_mat(i,:));+chi_square_dist(shape_hist,shape_mat(i,:));
end
means = ones(1,6);
for i=1:6
    means(i) = mean(distance(:,(i-1)*40+1:i*40));
end

[~,index] = min(means);
disp(index);
