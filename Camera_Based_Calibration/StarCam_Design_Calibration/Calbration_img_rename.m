clear;clc;close all;

cam_L_00_name_path='1A305501';
cam_R_00_name_path='262CCC00';

cam_00_L_img=dir(cam_L_00_name_path);
cam_00_R_img=dir(cam_R_00_name_path);

% [values,index] = sort([cam_00_L_img.date]); 


[cam_00_L_img_ordered, order_L]=sort({cam_00_L_img.date});
[cam_00_R_img_ordered, order_R]=sort({cam_00_R_img.date});
% Manually Input the Select List:

% Name Order from Calib path
selected_idx_list_p1=51:(51+10);
selected_idx_list_p2=165:170;
selected_idx_list_p3=244:253;
selected_idx_list_p4=323:328;
selected_idx_list_p5=386:390;
selected_idx_list_p6=617:794;

selected_idx_list=[selected_idx_list_p1 selected_idx_list_p6];

selected_count=1;

for img_index= selected_idx_list(1:100)
    img_L_name = cam_00_L_img( order_L(img_index) ).name;
    img_R_name = cam_00_R_img( order_R(img_index) ).name;
    Input_path_L=strcat('./',cam_L_00_name_path,'/',img_L_name);
    Input_path_R=strcat('./',cam_R_00_name_path,'/',img_R_name);
    %% Input path
    img_L=imread(Input_path_L);
    img_R=imread(Input_path_R);
    %% Output path
    Output_path_L=strcat('./cam_00/L_syn/','Cal_00_L_',num2str(selected_count,'%03i'),'.jpg');
    Output_path_R=strcat('./cam_00/R_syn/','Cal_00_R_',num2str(selected_count,'%03i'),'.jpg');
    %% Write Selected Images in jpg format
    imwrite(img_L, Output_path_L);
    imwrite(img_R, Output_path_R);
    selected_count=selected_count+1;
end