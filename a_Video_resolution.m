%%视频拆分成帧图片
clc;
clear;
%% 读取视频
video_file='待处理视频.mp4';
video=VideoReader(video_file);
frame_number=video.NumberOfFrames;
%% 分离图片
for i=1:frame_number
    image_name=strcat('my picture\',num2str(i));
    image_name=strcat(image_name,'.jpg');
    I=read(video,i);  %读出图片
    
    imwrite(I,image_name,'jpg');                   %写图片
    I=[];
end
