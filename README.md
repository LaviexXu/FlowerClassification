# 文件说明
只有chi_square_dist.m,classify.m,color_histogram.m,shape_histogram.m,texture_histogram.m,input_pics.m是由我编写的。
其余文件是下载自lowe大神的官网的sift算法。网址：http://www.cs.ubc.ca/~lowe/keypoints/

# gui使用说明
图形界面是flower_classification.fig，需要在matlab中先用GUIDE打开，再运行。
不知为何不用GUIDE打开直接运行会报一些我解决不了的错。
选择图片后需要点击分类按钮才会调用分类的算法，运行比较慢，请耐心等待，不要关闭窗口，不要在运行期间重新选择图片，或者重复点击分类按钮。
如果最后实在gui挂了，那就使用classify.m分类，输入是文件路径，输出结果是1~6中的一个数，代表类别。1-6分别对应buttercup，daisy，iris，lilyvalley，sunflower，windflower。

# 训练特征
visual vocabulary方法共需提取颜色、形状、纹理三方面特征，用训练集提取出的特征保存在vocabulary.mat文件中了，可用matlab查看。
