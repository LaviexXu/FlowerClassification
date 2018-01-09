function [lbp_histogram] = texture_histogram(image_path)
rgb_image = imread(image_path);
image=rgb2gray(rgb_image);
[rows,cols] = size(image);
pixel_count = rows*cols;
image_lbp = zeros(rows,cols);
lbp_histogram = zeros(1,256);
for row = 2:rows-1
    for col = 2:cols-1
        code=zeros(1,8);    %行向量
        code(1)=image(row-1,col-1)>image(row,col);
        code(2)=image(row-1,col)>image(row,col);
        code(3)=image(row-1,col+1)>image(row,col);
        code(4)=image(row,col+1)>image(row,col);
        code(5)=image(row+1,col+1)>image(row,col);
        code(6)=image(row+1,col)>image(row,col);
        code(7)=image(row+1,col-1)>image(row,col);
        code(8)=image(row,col-1)>image(row,col);
        for p=1:8
            %从左上角开始，顺时针编码
            image_lbp(row,col)=image_lbp(row,col)+code(p)*2^(8-p); 
        end
        %循环左移,移动k位相当于把开头的k个数放到最右边
        for k=1:7
            code=[code(k+1:end) code(1:k)];    %移位之后的二进制编码
            temp=0;
            for p=1:8
                temp=temp+code(p)*2^(8-p);
            end
            if temp<image_lbp(row,col)    %取旋转之后的最小值
                image_lbp(row,col)=temp;
            end
        end
        lbp_histogram(image_lbp(row,col)+1) = lbp_histogram(image_lbp(row,col)+1)+1;
    end
end
lbp_histogram = lbp_histogram/pixel_count;