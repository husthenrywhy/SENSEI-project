clear;clc;close all;

cam_L_07_name_path='1518CC00';
cam_R_07_name_path='19315501';

cam_07_L_img=dir(cam_L_07_name_path);
cam_07_R_img=dir(cam_R_07_name_path);

% [values,index] = sort([cam_00_L_img.date]); 


[cam_07_L_img_ordered, order_L]=sort({cam_07_L_img.date});
[cam_07_R_img_ordered, order_R]=sort({cam_07_R_img.date});
% Manually Input the Select List:

% Name Order from Calib path
% Calib 3-102 to Selected 0-99
% Calib 103-1201 to Selected 1000-1999
% Calib 1202 to Selected 199
selected_idx_list_p1=36+3:48+3;
selected_idx_list_p2=154+3:162+3;
selected_idx_list_p3=234+3:242+3;
selected_idx_list_p4=311+3:321+3;
selected_idx_list_p5=376+3:383+3;
selected_idx_list_p6=533+3:692+3;
%selected_idx_list_p7=727:740;
%selected_idx_list_p8=973:1299;

selected_idx_list=[selected_idx_list_p1 selected_idx_list_p2 selected_idx_list_p3 selected_idx_list_p4 selected_idx_list_p5 selected_idx_list_p6];

selected_count=1;

%for img_index= selected_idx_list(1:100)
for img_index= selected_idx_list(1:100)
    img_L_name = cam_07_L_img( order_L(img_index) ).name;
    img_R_name = cam_07_R_img( order_R(img_index) ).name;
    Input_path_L=strcat('./',cam_L_07_name_path,'/',img_L_name);
    Input_path_R=strcat('./',cam_R_07_name_path,'/',img_R_name);
    %% Input path
    img_L=imread(Input_path_L);
    img_R=imread(Input_path_R);
    %% Output path
    Output_path_L=strcat('./cam_07/L_syn/','Cal_07_L_',num2str(selected_count,'%03i'),'.jpg');
    Output_path_R=strcat('./cam_07/R_syn/','Cal_07_R_',num2str(selected_count,'%03i'),'.jpg');
    %% Write Selected Images in jpg format
    imwrite(img_L, Output_path_L);
    imwrite(img_R, Output_path_R);
    selected_count=selected_count+1;
end