clear;clc;close all;

cam_L_03_name_path='18095501';
cam_R_03_name_path='180E5501';

cam_03_L_img=dir(cam_L_03_name_path);
cam_03_R_img=dir(cam_R_03_name_path);

% [values,index] = sort([cam_00_L_img.date]); 


[cam_03_L_img_ordered, order_L]=sort({cam_03_L_img.date});
[cam_03_R_img_ordered, order_R]=sort({cam_03_R_img.date});
% Manually Input the Select List:

% Name Order from Calib path
% Calib 3-102 to Selected 0-99
% Calib 103-1201 to Selected 1000-1999
% Calib 1202 to Selected 199
selected_idx_list_p1=1+2:3+2;
selected_idx_list_p2=96+2:109+2;
selected_idx_list_p3=186+2:196+2;
selected_idx_list_p4=275+2:284+2;
selected_idx_list_p5=342+2:348+2;
selected_idx_list_p6=897+2:1140+2;
%selected_idx_list_p5=424:437;
%selected_idx_list_p6=577:602;
%selected_idx_list_p7=727:740;
%selected_idx_list_p8=973:1299;

selected_idx_list=[selected_idx_list_p1 selected_idx_list_p2 selected_idx_list_p3 selected_idx_list_p4 selected_idx_list_p5 selected_idx_list_p6];

selected_count=1;

%for img_index= selected_idx_list(1:100)
for img_index= selected_idx_list(1:100)
    img_L_name = cam_03_L_img( order_L(img_index) ).name;
    img_R_name = cam_03_R_img( order_R(img_index) ).name;
    Input_path_L=strcat('./',cam_L_03_name_path,'/',img_L_name);
    Input_path_R=strcat('./',cam_R_03_name_path,'/',img_R_name);
    %% Input path
    img_L=imread(Input_path_L);
    img_R=imread(Input_path_R);
    %% Output path
    Output_path_L=strcat('./cam_03/L_syn/','Cal_03_L_',num2str(selected_count,'%03i'),'.jpg');
    Output_path_R=strcat('./cam_03/R_syn/','Cal_03_R_',num2str(selected_count,'%03i'),'.jpg');
    %% Write Selected Images in jpg format
    imwrite(img_L, Output_path_L);
    imwrite(img_R, Output_path_R);
    selected_count=selected_count+1;
end