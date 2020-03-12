clc;
clear;
%设置起始和结束帧数
begain = 1;         %记得设置！！
n_frames = 500;     %记得设置！！

% 读取图片1
x1 = imread('1.jpg');
%人脸识别，人脸区域bboxes1:[x,y,width,height]
faceDetector = vision.CascadeObjectDetector;
bboxes1 = step(faceDetector, x1);
if isempty(bboxes1) == 1
    fprintf('您的图片不符合要求');
end
bimg1=x1(bboxes1(2):(bboxes1(2)+bboxes1(4)),bboxes1(1):(bboxes1(1)+bboxes1(3)),:);
% 构造人脸识别结果
IFaces1 = insertObjectAnnotation(x1, 'rectangle', bboxes1, 'Face');
%figure, imshow(bimg1), title('Detected faces');
fprintf('以下图片未识别，请手动处理：');
for i=begain:n_frames
    image_name=strcat('my picture\',num2str(i),'.jpg');
    image_name2=strcat('处理后的帧图\',num2str(i),'.jpg');
    x2 = imread(image_name);
    faceDetector = vision.CascadeObjectDetector;
    bboxes2 = step(faceDetector, x2);
    if isempty(bboxes2) == 1
        fprintf(num2str(i));
        fprintf(';');
        continue;
    end
    if size(bboxes2,1) >= 2
       continue;
    end
    bimg2=x2(bboxes2(2):(bboxes2(2)+bboxes2(4)),bboxes2(1):(bboxes2(1)+bboxes2(3)),:);
    IFaces2 = insertObjectAnnotation(x2, 'rectangle', bboxes2, 'Face');
    %figure, imshow(IFaces2), title('Detected faces');

    %图片缩放
    bimg1=imresize(bimg1,[size(bimg2,1),size(bimg2,2)]);
    %图片融合
    %out = wtfusion(bimg2,bimg1,2,'db1');  %两图人脸融合
    out = bimg1;    %直接覆盖原图
    %放回原图
    x3=x2;
    x3(bboxes2(2):(bboxes2(2)+bboxes2(4)),bboxes2(1):(bboxes2(1)+bboxes2(3)),:)=out;
    imwrite(x3, image_name2);
end