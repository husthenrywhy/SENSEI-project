%clear;clc;

%nona_cmd='nona';
%for frame_idx=15
function Mask_save_Lv(frame_input)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%    Multiple image blending code    %%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
frame_idx=frame_input;
for cam_idx=1
    L_cam_idx=cam_idx;
    R_cam_idx=cam_idx+1;
    L_cam_idx_str=strcat('_',num2str(L_cam_idx,'%02i'));
    R_cam_idx_str=strcat('_',num2str(R_cam_idx,'%02i'));
        
    Mask_name{cam_idx}=strcat('--save-masks=mask_VL_',num2str(frame_idx,'%06i'),L_cam_idx_str,R_cam_idx_str,'.tif');
    % Mask_name{cam_idx}=strcat('--load-masks=mask_VL_',num2str(1,'%06i'),L_cam_idx_str,R_cam_idx_str,'.tif');
    Output_name{cam_idx}=strcat('Output_',num2str(frame_idx,'%06i'),'_end_by',R_cam_idx_str,'_VL_visual_enblend.tif');
    Input_name1{cam_idx}=strcat('Output_',num2str(frame_idx,'%06i'),'_VL_',num2str(cam_idx-1,'%04i'),'.tif');
    Input_name2{cam_idx}=strcat('Output_',num2str(frame_idx,'%06i'),'_VL_',num2str(cam_idx,'%04i'),'.tif');
        
    Enblend_cmd=strcat('enblend',{' '},{'--fine-mask'},{' '},Mask_name{cam_idx},{' '},'-o',{' '},Output_name{cam_idx},{' '},Input_name1{cam_idx},{' '},Input_name2{cam_idx});
    [status2,cmdout2] = system(Enblend_cmd{1});
end
    
for cam_idx=2:7
    L_cam_idx=cam_idx;
    R_cam_idx=cam_idx+1;
    L_cam_idx_str=strcat('_',num2str(L_cam_idx,'%02i'));
    R_cam_idx_str=strcat('_',num2str(R_cam_idx,'%02i'));
        
    Mask_name{cam_idx}=strcat('--save-masks=mask_VL_',num2str(frame_idx,'%06i'),L_cam_idx_str,R_cam_idx_str,'.tif');
    % Mask_name{cam_idx}=strcat('--load-masks=mask_VL_',num2str(1,'%06i'),L_cam_idx_str,R_cam_idx_str,'.tif');
    Output_name{cam_idx}=strcat('Output_',num2str(frame_idx,'%06i'),'_end_by',R_cam_idx_str,'_VL_visual_enblend.tif');
    Input_name1{cam_idx}=Output_name{cam_idx-1};
    Input_name2{cam_idx}=strcat('Output_',num2str(frame_idx,'%06i'),'_VL_',num2str(cam_idx,'%04i'),'.tif');  
        
    Enblend_cmd=strcat('enblend',{' '},{'--fine-mask'},{' '},Mask_name{cam_idx},{' '},'-o',{' '},Output_name{cam_idx},{' '},Input_name1{cam_idx},{' '},Input_name2{cam_idx});
    [status3,cmdout3] = system(Enblend_cmd{1});
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%    Two image blending code    %%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% cam_idx1=3;
% cam_idx2=4;
% Mask_name=strcat('--save-masks=mask_VL_',num2str(frame_idx,'%06i'),'_02_03_04.tif');
% Output_name=strcat('Output_',num2str(frame_idx,'%06i'),'_visual_enblend.jpg');
% Input_name=strcat('Output_',num2str(frame_idx,'%06i'),'_VL_',num2str(cam_idx1-1,'%04i'),'.tif',{' '},'Output_',num2str(frame_idx,'%06i'),'_VL_',num2str(cam_idx1,'%04i'),'.tif',{' '},'Output_',num2str(frame_idx,'%06i'),'_VL_',num2str(cam_idx1+1,'%04i'),'.tif');
% 
% Output_name2=strcat('Output_',num2str(frame_idx,'%06i'),'_visual_verdandi.jpg');
% %Algo_name='--load-masks=mask_VL_000010_02_03.tif';
% 
% %Enblend_cmd=strcat('enblend  --load-masks=mask_VL_000002_02_03.tif -o Output_000021_visual.tif Output_000021_VL_0002.tif Output_000021_VL_0003.tif ');
% %% Enblend Blending
% Enblend_cmd=strcat('enblend',{' '},Mask_name,{' '},'-o',{' '},Output_name,{' '},Input_name);
% %% Verdandi Blending
% Verdandi_cmd=strcat('verdandi --seam=hard',{' '},Mask_name,{' '},'-o',{' '},Output_name2,{' '},Input_name);
% 
% [status2,cmdout2] = system(Enblend_cmd{1});
% [status3,cmdout3] = system(Verdandi_cmd{1});


end