fid = fopen('D:\PatRecCourseDesign\data\all_pic\pictrain.txt');
path_label = fgetl(fid);
i=1;
color_mat = zeros(240,200);
texture_mat = zeros(240,256);
shape_mat = zeros(240,100);
while(path_label~=-1)
    C=textscan(path_label,'%s');
    path = C{1}{1};
    disp(path);
    [texture_hist] = texture_histogram(path);
    [color_hist] = color_histogram(path);
    [shape_hist] = shape_histogram(path);
    texture_mat(i,:) = texture_hist;
    color_mat(i,:) = color_hist;
    shape_mat(i,:) = shape_hist;
    path_label = fgetl(fid);
    i=i+1;
end
fclose('all');