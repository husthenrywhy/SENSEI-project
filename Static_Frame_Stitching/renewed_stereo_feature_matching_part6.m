% clear;clc;
function renewed_stereo_feature_matching_part6(frame_input)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% construct original pto
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% frame_input=18;
%%
ii=frame_input;

Left_view_pto_gen_cmd_base='pto_gen -o';

pto_filename_L_base='20181029_StarCam_';
pto_filename_L_p1=strcat(pto_filename_L_base,num2str(ii,'%06i'));
pto_filename_L=strcat(pto_filename_L_p1,'_VL.pto');

image_filename_L_base='20181029_StarCam_';
image_filename_L_p1=strcat(image_filename_L_base,num2str(ii,'%06i'));
image_filename_L=strcat(image_filename_L_p1,'_VL*.png');


Left_view_pto_gen_cmd=strcat(Left_view_pto_gen_cmd_base,{' '},pto_filename_L,{' '},image_filename_L);

[status1,cmdout_L] = system(Left_view_pto_gen_cmd{1});

%%
ii=frame_input;

Right_view_pto_gen_cmd_base='pto_gen -o';

pto_filename_R_base='20181029_StarCam_';
pto_filename_R_p1=strcat(pto_filename_R_base,num2str(ii,'%06i'));
pto_filename_R=strcat(pto_filename_R_p1,'_VR.pto');

image_filename_R_base='20181029_StarCam_';
image_filename_R_p1=strcat(image_filename_R_base,num2str(ii,'%06i'));
image_filename_R=strcat(image_filename_R_p1,'_VR*.png');


Right_view_pto_gen_cmd=strcat(Right_view_pto_gen_cmd_base,{' '},pto_filename_R,{' '},image_filename_R);

[status1,cmdout_R] = system(Right_view_pto_gen_cmd{1});
end