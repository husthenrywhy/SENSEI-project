clear;clc;close all;

cam_L_05_name_path='1C325501';
cam_R_05_name_path='1A215501';

cam_05_L_img=dir(cam_L_05_name_path);
cam_05_R_img=dir(cam_R_05_name_path);

% [values,index] = sort([cam_00_L_img.date]); 


[cam_05_L_img_ordered, order_L]=sort({cam_05_L_img.date});
[cam_05_R_img_ordered, order_R]=sort({cam_05_R_img.date});
% Manually Input the Select List:

% Name Order from Calib path
% Calib 3-102 to Selected 0-99
% Calib 103-1201 to Selected 1000-1999
% Calib 1202 to Selected 199
selected_idx_list_p1=11+3:20+3;
selected_idx_list_p2=129+3:142+3;
selected_idx_list_p3=210+3:211+3;
selected_idx_list_p4=295+3:302+3;
selected_idx_list_p5=425+3:532+3;
%selected_idx_list_p6=761:965;
%selected_idx_list_p7=727:740;
%selected_idx_list_p8=973:1299;

selected_idx_list=[selected_idx_list_p1 selected_idx_list_p2 selected_idx_list_p3 selected_idx_list_p4 selected_idx_list_p5];

selected_count=1;

%for img_index= selected_idx_list(1:100)
for img_index= selected_idx_list(1:100)
    img_L_name = cam_05_L_img( order_L(img_index) ).name;
    img_R_name = cam_05_R_img( order_R(img_index) ).name;
    Input_path_L=strcat('./',cam_L_05_name_path,'/',img_L_name);
    Input_path_R=strcat('./',cam_R_05_name_path,'/',img_R_name);
    %% Input path
    img_L=imread(Input_path_L);
    img_R=imread(Input_path_R);
    %% Output path
    Output_path_L=strcat('./cam_05/L_syn/','Cal_05_L_',num2str(selected_count,'%03i'),'.jpg');
    Output_path_R=strcat('./cam_05/R_syn/','Cal_05_R_',num2str(selected_count,'%03i'),'.jpg');
    %% Write Selected Images in jpg format
    imwrite(img_L, Output_path_L);
    imwrite(img_R, Output_path_R);
    selected_count=selected_count+1;
end