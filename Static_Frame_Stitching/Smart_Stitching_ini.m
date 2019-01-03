clear;clc;close all;
% Main
% Loop 18
%% Step 1
% Construction of the CIF for current frame 
frame_input=1;
% CIF_Detection(frame_input);
%% Step 2
% Operate Camera Pose Estiamtion
% Mode1: position (P)
% Mode2: position view barrel(PVB)
% Mode3: Everything (E)
opt_mode=3;
Date_str='20181029';
Camera_Pose_Estimation_Lv(Date_str,frame_input,opt_mode);
% Camera_Pose_Estimation_Rv(Date_str,frame_input,opt_mode);
% %% Step 3
% % Construct tif via nona
Nona_Generator_ind_Lv(Date_str,frame_input);
% Nona_Generator_Rv(Date_str,frame_input);
%% Step 4
% Produce Mask via enblend
Mask_save_ind_Lv(frame_input);
%% step 5
% Pass Camera Poses into next frame
RPY_Passer_ind_Lv(Date_str,frame_input+1,frame_input);
%% Step 6




