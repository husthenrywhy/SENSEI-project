clear;clc;close all;
% Main
% Loop 18
% Pre_set_update_list=[0 0 0 0];

Date_str='20181029';

for frame_input=19:99
%% Determinnation whether 
Blending_update_flag=1;
RPY_update_flag=0; 
    if Blending_update_flag==1
       % flag==1 means we need to update RPY 
       % Input para: frame_idx that need RPY update, cam_idx that need RPY
       % update
       % Step 3
       % Construct tif via nona
       Nona_Generator_inherited_Lv(Date_str,frame_input);
       % Step 4
       % Copy mask
       frame_mask_input=frame_input-1;
       Mask_Copy_Lv(frame_input,frame_mask_input);
       % Step 5
       % Produce Mask via enblend
       % frame_mask_load=frame_input;
       Mask_save_ind_Lv(frame_input);
       % Pass Camera Poses into next frame
       RPY_Passer_inherited_Lv(Date_str,frame_input+1,frame_input);
    else
       % Step 3
       % Construct tif via nona
       Nona_Generator_inherited_Lv(Date_str,frame_input);
       % Step 4
       % Copy mask
       frame_mask_input=frame_input-1;
       Mask_Copy_Lv(frame_input,frame_mask_input);
       % Step 5
       % Produce Mask via enblend
       frame_mask_load=frame_input;
       Mask_load_inherited_Lv(frame_input,frame_mask_load);
       % Pass Camera Poses into next frame
       RPY_Passer_inherited_Lv(Date_str,frame_input+1,frame_input);
    end
%% Step 1
% Construction of the CIF for current frame 
% CIF_Detection(frame_input);
%% Step 2
% Operate Camera Pose Estiamtion
% Mode1: position (P)
% Mode2: position view barrel(PVB)
% Mode3: Everything (E)
% opt_mode=3;
% Date_str='20181029';
% Camera_Pose_Estimation_Lv(Date_str,frame_input,opt_mode);
% % Camera_Pose_Estimation_Rv(Date_str,frame_input,opt_mode);
% % %% Step 3
% % % Construct tif via nona
% Nona_Generator_Lv(Date_str,frame_input);
% % Nona_Generator_Rv(Date_str,frame_input);
% %% Step 4
% % Produce Mask via enblend
% Mask_save_Lv(frame_input);
% %% step 5
% % Pass Camera Poses into next frame
% RPY_Passer_Lv(Date_Str,frame_input+1,frame_input);
%% Step 6
end