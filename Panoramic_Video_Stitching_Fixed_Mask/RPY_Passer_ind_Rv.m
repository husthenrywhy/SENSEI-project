%clear;clc;

% target_frame_idx=18;
% target_pto_filename=strcat('20181029_StarCam_',num2str(target_frame_idx,'%06i'),'_VR_updated_renew_p2.pto');

% Passed_frame_start=19;
% Passed_frame_end=50;
% for frame_idx=Passed_frame_start:Passed_frame_end
% Before start the camera position estiamtion, read teh all old r pt parameters from previous frame pto

% old pto file: provide original pto structure (frame_idx)

% target pto file: provide target Roll Pitch and Yaw parameters
function RPY_Passer_ind_Rv(Date_str,frame_Num_idx,frame_RPY_idx)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Construct original pto files with frame_Num_idx %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
New_pto_filename=strcat(Date_str,'_StarCam_',num2str(frame_Num_idx,'%06i'),'_VR.pto');

pto_gen_cmd_base='pto_gen -o';

image_filename_base=strcat(Date_str,'_StarCam_');
image_filename_p1=strcat(image_filename_base,num2str(frame_Num_idx,'%06i'));
image_filename=strcat(image_filename_p1,'_VR*.png');

pto_gen_cmd=strcat(pto_gen_cmd_base,{' '},New_pto_filename,{' '},image_filename);

[status,cmdout] = system(pto_gen_cmd{1});
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Copying RPY from frame_RPY_idx %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% frame_Num_idx provide current frame inforamtion
% frame_RPY_idx provide heriated RPY information
Num_pto_filename=strcat(Date_str,'_StarCam_',num2str(frame_Num_idx,'%06i'),'_VR.pto');
RPY_pto_filename=strcat(Date_str,'_StarCam_',num2str(frame_RPY_idx,'%06i'),'_VR_modified_2.pto');

[updated_pto_filename]=RPY_CP_reader_Rv(Num_pto_filename,RPY_pto_filename,frame_RPY_idx,frame_Num_idx);

end