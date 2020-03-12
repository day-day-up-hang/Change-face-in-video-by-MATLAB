# Change-face-in-video-by-MATLAB
基于MATLAB的视频换脸

准备工作：
1）创建两个空文件夹“my picture”和“处理后的帧图”
2）准备换脸素材“1.jpg”
3）准备视频“待处理视频.mp4”

操作：
1）分割视频：运行a_Video_resolution.m会在“my picture”中保存每一帧的图片
2）处理每一帧的图片：
	1、打开b_fusionDemo20180430.m，并设置要处理的图片起始帧数，可在“处理后的帧图”中观察效果
	2、运行后MATLAB会把未处理的图片显示出来，是否手动处理根据你对视频质量的要求而定
3）把处理后的图片转为视频：
	1、打开c_Video_compositing.m，设置要处理的图片起始帧数，并运行即可
