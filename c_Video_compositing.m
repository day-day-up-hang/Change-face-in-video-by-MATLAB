%%帧图片合并成视频
clear;
 %设置起始和结束帧数
begain = 1;      %记得设置！！
n_frames = 500;    %记得设置！！

temp1='处理后的帧图\';% 路径名1
temp2='.jpg';% 路径名2
WriterObj=VideoWriter('my video.avi');% xxx.avi表示待合成的视频（不仅限于avi格式）的文件路径
open(WriterObj);
for i=begain:n_frames % n_frames表示图像帧的总数
im = strcat(temp1,num2str(i),temp2);
if exist(im,'file')==0
   continue;
end
frame=imread(im);% 读取图像，放在变量frame中
writeVideo(WriterObj,frame);% 将frame放到变量WriterObj中
end
close(WriterObj);