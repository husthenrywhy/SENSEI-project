%clear;clc;

function renewed_stereo_feature_matching_part4(frame_input)
load renewed_stereo_matching_sift_part3_v2.mat;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%  Read cp's pos and des info       %%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Record gradient info
camera_number=8;
for ii=1:camera_number-1    
    common_cp_size=size(Common_cp_all_4{ii},1);
    for jjj=1:common_cp_size
        Lv_Rs_idx=Common_cp_all_4{ii}(jjj,1);
        Lv_Ls_idx=Common_cp_all_4{ii}(jjj,2);
        Rv_Rs_idx=Common_cp_all_4{ii}(jjj,3);
        Rv_Ls_idx=Common_cp_all_4{ii}(jjj,4);
    
        common_cp_Lv_sift_Rs_des{ii}(1:128,jjj)=norm_L_features_cam_Rs_sift_des{ii}(1:128,Lv_Rs_idx);
        common_cp_Lv_sift_Ls_des{ii}(1:128,jjj)=norm_L_features_cam_Ls_sift_des{ii+1}(1:128,Lv_Ls_idx);
        common_cp_Rv_sift_Rs_des{ii}(1:128,jjj)=norm_R_features_cam_Rs_sift_des{ii}(1:128,Rv_Rs_idx);
        common_cp_Rv_sift_Ls_des{ii}(1:128,jjj)=norm_R_features_cam_Ls_sift_des{ii+1}(1:128,Rv_Ls_idx)';
    end
end
%case when ii=camera_number
for ii=camera_number    
    common_cp_size=size(Common_cp_all_4{ii},1);
    for jjj=1:common_cp_size
        Lv_Rs_idx=Common_cp_all_4{ii}(jjj,1);
        Lv_Ls_idx=Common_cp_all_4{ii}(jjj,2);
        Rv_Rs_idx=Common_cp_all_4{ii}(jjj,3);
        Rv_Ls_idx=Common_cp_all_4{ii}(jjj,4);
    
        common_cp_Lv_sift_Rs_des{ii}(1:128,jjj)=norm_L_features_cam_Rs_sift_des{ii}(1:128,Lv_Rs_idx);
        common_cp_Lv_sift_Ls_des{ii}(1:128,jjj)=norm_L_features_cam_Ls_sift_des{1}(1:128,Lv_Ls_idx);
        common_cp_Rv_sift_Rs_des{ii}(1:128,jjj)=norm_R_features_cam_Rs_sift_des{ii}(1:128,Rv_Rs_idx);
        common_cp_Rv_sift_Ls_des{ii}(1:128,jjj)=norm_R_features_cam_Ls_sift_des{1}(1:128,Rv_Ls_idx)';
    end
end


%% Record pos info
camera_number=8;
for ii=1:camera_number-1  
    common_cp_size=size(Common_cp_all_4{ii},1);
    for jjj=1:common_cp_size
        Lv_Rs_idx=Common_cp_all_4{ii}(jjj,1);
        Lv_Ls_idx=Common_cp_all_4{ii}(jjj,2);
        Rv_Rs_idx=Common_cp_all_4{ii}(jjj,3);
        Rv_Ls_idx=Common_cp_all_4{ii}(jjj,4);
    
        common_cp_Lv_sift_Rs_pos{ii}(1:4,jjj)=L_valid_points_cam_Rs_sift_pos{ii}(1:4,Lv_Rs_idx);
        common_cp_Lv_sift_Ls_pos{ii}(1:4,jjj)=L_valid_points_cam_Ls_sift_pos{ii+1}(1:4,Lv_Ls_idx);
        common_cp_Rv_sift_Rs_pos{ii}(1:4,jjj)=R_valid_points_cam_Rs_sift_pos{ii}(1:4,Rv_Rs_idx);
        common_cp_Rv_sift_Ls_pos{ii}(1:4,jjj)=R_valid_points_cam_Ls_sift_pos{ii+1}(1:4,Rv_Ls_idx)';
    end
end
% case when ii=camera_number
for ii=camera_number  
    common_cp_size=size(Common_cp_all_4{ii},1);
    for jjj=1:common_cp_size
        Lv_Rs_idx=Common_cp_all_4{ii}(jjj,1);
        Lv_Ls_idx=Common_cp_all_4{ii}(jjj,2);
        Rv_Rs_idx=Common_cp_all_4{ii}(jjj,3);
        Rv_Ls_idx=Common_cp_all_4{ii}(jjj,4);
    
        common_cp_Lv_sift_Rs_pos{ii}(1:4,jjj)=L_valid_points_cam_Rs_sift_pos{ii}(1:4,Lv_Rs_idx);
        common_cp_Lv_sift_Ls_pos{ii}(1:4,jjj)=L_valid_points_cam_Ls_sift_pos{1}(1:4,Lv_Ls_idx);
        common_cp_Rv_sift_Rs_pos{ii}(1:4,jjj)=R_valid_points_cam_Rs_sift_pos{ii}(1:4,Rv_Rs_idx);
        common_cp_Rv_sift_Ls_pos{ii}(1:4,jjj)=R_valid_points_cam_Ls_sift_pos{1}(1:4,Rv_Ls_idx)';
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%  Read cp's score info   %%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Record score info
camera_number=8;
for ii=1:camera_number-1 
    common_cp_size=size(Common_cp_valid_score_all_4_output{ii},1);
    for jjj=1:common_cp_size
       
        common_cp_sift_Lv_Rv_Rs_Ls_score{ii}(jjj)=Common_cp_valid_score_all_4_output{ii}(jjj);
        % common_cp_sift_Lv_Rv_Rs_Ls_score{ii}(1,jjj) indicate the tracked
        % cp's matching scores between cam_Rs(ii) and cam_Ls(ii+1)
        
    end
end
    save renewed_stereo_matching_sift_part4.mat;
end