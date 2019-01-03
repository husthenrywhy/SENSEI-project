% clear;clc;

function renewed_commonly_identified_feature_construction_running(frame_input)
load renewed_stereo_matching_sift_part2.mat;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% step1 Normalization
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Normalize L_features_cam_Rs_sift_des %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for ii=1:camera_number  
        cp_size=size(L_features_cam_Rs_sift_des{ii},2);
        for cp_idx=1:cp_size
            target_des=L_features_cam_Rs_sift_des{ii}(1:128,cp_idx);
            target_des=double(target_des);
            target_des=target_des/sqrt(sum(target_des.^2));
            norm_L_features_cam_Rs_sift_des{ii}(1:128,cp_idx)=target_des;
        end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Normalize L_features_cam_Ls_sift_des %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for ii=1:camera_number  
        cp_size=size(L_features_cam_Ls_sift_des{ii},2);
        for cp_idx=1:cp_size
            target_des=L_features_cam_Ls_sift_des{ii}(1:128,cp_idx);
            target_des=double(target_des);
            target_des=target_des/sqrt(sum(target_des.^2));
            norm_L_features_cam_Ls_sift_des{ii}(1:128,cp_idx)=target_des;
        end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Normalize R_features_cam_Rs_sift_des %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for ii=1:camera_number  
        cp_size=size(R_features_cam_Rs_sift_des{ii},2);
        for cp_idx=1:cp_size
            target_des=R_features_cam_Rs_sift_des{ii}(1:128,cp_idx);
            target_des=double(target_des);
            target_des=target_des/sqrt(sum(target_des.^2));
            norm_R_features_cam_Rs_sift_des{ii}(1:128,cp_idx)=target_des;
        end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Normalize R_features_cam_Ls_sift_des %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for ii=1:camera_number  
        cp_size=size(R_features_cam_Ls_sift_des{ii},2);
        for cp_idx=1:cp_size
            target_des=R_features_cam_Ls_sift_des{ii}(1:128,cp_idx);
            target_des=double(target_des);
            target_des=target_des/sqrt(sum(target_des.^2));
            norm_R_features_cam_Ls_sift_des{ii}(1:128,cp_idx)=target_des;
        end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% step2 matching between each pair of neighbouring cameras
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Camera_number=8;
for cam_idx=1:Camera_number-1
    cam_idx1=cam_idx;
    cam_idx2=cam_idx+1;

    para1=0.7;
    para2=cam_idx1;
    para3=cam_idx2;
    para4=norm_L_features_cam_Rs_sift_des{cam_idx1};
    para5=norm_L_features_cam_Ls_sift_des{cam_idx2};
    para6=norm_R_features_cam_Rs_sift_des{cam_idx1};
    para7=norm_R_features_cam_Ls_sift_des{cam_idx2};
    [Common_cp_all_4{cam_idx1},Common_cp_valid_score_all_4_output{cam_idx}]=renewed_commonly_identified_feature_construction(para1,para2,para3,para4,para5,para6,para7);
    clear para4 para5 para6 para7;

end

for cam_idx=Camera_number
    cam_idx1=cam_idx;
    cam_idx2=1;

    para1=0.7;
    para2=cam_idx1;
    para3=cam_idx2;
    para4=norm_L_features_cam_Rs_sift_des{cam_idx1};
    para5=norm_L_features_cam_Ls_sift_des{cam_idx2};
    para6=norm_R_features_cam_Rs_sift_des{cam_idx1};
    para7=norm_R_features_cam_Ls_sift_des{cam_idx2};
    [Common_cp_all_4{cam_idx1},Common_cp_valid_score_all_4_output{cam_idx}]=renewed_commonly_identified_feature_construction(para1,para2,para3,para4,para5,para6,para7);
    clear para4 para5 para6 para7;

end

save renewed_stereo_matching_sift_part3_v2.mat;
end