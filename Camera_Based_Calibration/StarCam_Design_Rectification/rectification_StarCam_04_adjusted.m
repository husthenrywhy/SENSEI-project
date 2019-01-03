clear;clc;
load stereoParams_cam_04.mat;
rectification_length=500;
%cam_number=0;
for cam_number = 4
%VL_filename=strcat('VL_',num2str(cam_number,'%02i'));
%VR_filename=strcat('VR_',num2str(cam_number,'%02i'));
%status1 = mkdir(VL_filename);
%status2 = mkdir(VR_filename);

%imaegNames_L_base=strcat('*_',num2str(cam_number,'%02i'),'.png');
%imageNames_R_base=strcat('*_',num2str(cam_number+1,'%02i'),'.png');
camera_str_L=strcat('*.jpg');
camera_str_R=strcat('*.jpg');

camera_filename_L=strcat('cam',{'_'},num2str(cam_number,'%02i'));
camera_filename_L=camera_filename_L{1};
camera_filename_R=strcat('cam',{'_'},num2str(cam_number,'%02i'));
camera_filename_R=camera_filename_R{1};

camera_L_path=strcat(camera_filename_L,'/L_syn/',camera_str_L);
camera_R_path=strcat(camera_filename_R,'/R_syn/',camera_str_R);

%imageNames_L=dir(camera_str_L);
%imageNames_R=dir(camera_str_R);

imageNames_L=dir(camera_L_path);
imageNames_R=dir(camera_R_path);

length=size(imageNames_L,1);
%cam_index_L=0;
%cam_index_R=0;
% pair
% 00 -> vl_00    vr_00 <- 01
% 01 -> vl_01    vr_01 <- 02
% 02 -> vl_02    vr_02 <- 03
% 03 -> vl_03    vr_03 <- 04
% 04 -> vl_04    vr_04 <- 05
% ...
% 13 -> vl_13    vr_13 <- 14 
% 14 -> vl_14    vr_14 <- 00 
% for ii=1:length
for ii=1:rectification_length
% %ii=1;
I1_path=strcat(camera_filename_L,'/L_syn/',imageNames_L(ii).name);
I2_path=strcat(camera_filename_R,'/R_syn/',imageNames_R(ii).name);
% 
I1 = imread(I1_path);   
I2 = imread(I2_path); 
% 
% %I1 = imread(imageNames_L(ii).name);   
% %I2 = imread(imageNames_R(ii).name);  
[J1,J2] = rectifyStereoImages(I1,I2,stereoParams_cam_04,'OutputView','valid');
% [J1,J2] = rectifyStereoImages(I1,I2,stereoParams_cam_04,'OutputView','full');
% J1=I1;
% J2=I2;
frame_str=num2str(ii,'%06i');
output_image_name_L=strcat('Rectified_images\20181029_StarCam_',frame_str,'_VL_',num2str(cam_number,'%02i'),'_rectified.png');
output_image_name_R=strcat('Rectified_images\20181029_StarCam_',frame_str,'_VR_',num2str(cam_number,'%02i'),'_rectified.png');
imwrite(J1,output_image_name_L);
imwrite(J2,output_image_name_R);
% end
end
% I1 = imread(imageNames(15).name);   
% I2 = imread(imageNames(1).name);  
% [J1,J2] = rectifyStereoImages(I1,I2,stereoParams_farmland_20170621,'OutputView','valid');
% output_image_name_L=strcat('20170621_Outside_0001_VL_',num2str(14,'%02i'),'_rectified.png');
% output_image_name_R=strcat('20170621_Outside_0001_VR_',num2str(14,'%02i'),'_rectified.png');
%imwrite(J1,output_image_name_L);
%imwrite(J2,output_image_name_R);
end