function Mask_Copy_Lv(frame_input,frame_mask_input)
    camera_num=8;
    frame_idx=frame_input;
    frame_mask_idx=frame_mask_input;
    for cam_idx=1:camera_num-1
        L_cam_idx=cam_idx;
        R_cam_idx=cam_idx+1;
        L_cam_idx_str=strcat('_',num2str(L_cam_idx,'%02i'));
        R_cam_idx_str=strcat('_',num2str(R_cam_idx,'%02i'));
        
        Mask_name_original{cam_idx}=strcat('mask_VL_',num2str(frame_mask_idx,'%06i'),L_cam_idx_str,R_cam_idx_str,'.tif');
        Mask_name_new{cam_idx}=strcat('mask_VL_',num2str(frame_idx,'%06i'),L_cam_idx_str,R_cam_idx_str,'.tif');
        
        Mask_Copy_cmd=strcat('copy',{' '},Mask_name_original{cam_idx},{' '},Mask_name_new{cam_idx});
        [status,cmdout] = system(Mask_Copy_cmd{1});
    end

end