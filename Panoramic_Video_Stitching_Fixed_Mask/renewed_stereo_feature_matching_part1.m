% clearvars -except frame_input;
% clc;

function renewed_stereo_feature_matching_part1(frame_input)
camera_number=8;
% frame_number=2;

Left_image_name_base=strcat('20181029_StarCam_',num2str(frame_input,'%06i'),'_VL_');
Right_image_name_base=strcat('20181029_StarCam_',num2str(frame_input,'%06i'),'_VR_');

% Left_image_name_base='20181029_StarCam_000018_VL_';
% Right_image_name_base='20181029_StarCam_000018_VR_';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Left view image reading fo cam pos 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% generate first frames name
for ii=1:camera_number
% L_image_cam_name{ii}=strcat('2017-03-09_Forest_000000_L_',num2str(ii-1,'%02i'),'.png');
L_image_cam_name{ii}=strcat(Left_image_name_base,num2str(ii-1,'%02i'),'_rectified.png');
end
% read in all first frame
for ii=1:camera_number
    L_Image{ii}=rgb2gray(imread(L_image_cam_name{ii}));
end

for ii=1:camera_number
[L_rows1(ii),L_cols1(ii),L_depth1(ii)]=size(L_Image{ii});
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Left view image reading
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% generate first frames name
for ii=1:camera_number
% R_image_cam_name{ii}=strcat('2017-03-09_Forest_000000_R_',num2str(ii-1,'%02i'),'.png');
R_image_cam_name{ii}=strcat(Right_image_name_base,num2str(ii-1,'%02i'),'_rectified.png');
end
% read in all first frame
for ii=1:camera_number

    R_Image{ii}=rgb2gray(imread(R_image_cam_name{ii}));
end

for ii=1:camera_number
[R_rows1(ii),R_cols1(ii),R_depth1(ii)]=size(R_Image{ii});
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% detect feature in Left view
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for ii=1:camera_number
L_I=imread(L_image_cam_name{ii});
L_I2 = single(rgb2gray(L_I));
%[L_valid_points_cam_sift_pos{ii},L_features_cam_sift_des{ii}] = vl_sift(L_I2,'EdgeThresh',20,'PeakThresh',0,'Magnif',1,'FirstOctave',-1,'Levels',5) ;
[L_valid_points_cam_sift_pos{ii},L_features_cam_sift_des{ii}] = vl_sift(L_I2) ;

end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% detect feature in Right view
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for ii=1:camera_number
R_I=imread(R_image_cam_name{ii});
R_I2 = single(rgb2gray(R_I));
%[R_valid_points_cam_sift_pos{ii},R_features_cam_sift_des{ii}] = vl_sift(R_I2,'EdgeThresh',20,'PeakThresh',0,'Magnif',1,'FirstOctave',-1,'Levels',5) ;
[R_valid_points_cam_sift_pos{ii},R_features_cam_sift_des{ii}] = vl_sift(R_I2) ;
end
save renewed_stereo_matching_sift_part1.mat;
end