%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% construct feature set in Rightside of camera image in Left view
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%clear;clc;
function renewed_stereo_feature_matching_part2(frame_input)
load renewed_stereo_matching_sift_part1.mat;
for ii=1:camera_number
    %Rs_Leftmost_xpos=L_cols1(ii)*0.5;
    Rs_Leftmost_xpos=L_cols1(ii)*0.5;
    Rs_Rightmost_xpos=L_cols1(ii);
    count=1;
    sub_length=size( L_features_cam_sift_des{ii},2);
    for jj=1:sub_length
        if L_valid_points_cam_sift_pos{ii}(1,jj)> Rs_Leftmost_xpos
            L_valid_points_cam_Rs_sift_pos{ii}(1:4,count)= L_valid_points_cam_sift_pos{ii}(1:4,jj);
            L_features_cam_Rs_sift_des{ii}(1:128,count)=L_features_cam_sift_des{ii}(1:128,jj);
            count=count+1;
        end       
               
    end
    
end
%% construct feature set in Leftside of camera image in Left view
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%clear;clc;
%load stereo_tracking_sift_part1.mat;
for ii=1:camera_number
    %Ls_Leftmost_xpos=L_cols1;
    Ls_Leftmost_xpos(ii)=1;
    %Ls_Rightmost_xpos(ii)=0.5*L_cols1(ii);
    Ls_Rightmost_xpos=0.5*L_cols1(ii);
    count=1;
    sub_length=size( L_features_cam_sift_des{ii},2);
    for jj=1:sub_length
        if L_valid_points_cam_sift_pos{ii}(1,jj)< Ls_Rightmost_xpos
            L_valid_points_cam_Ls_sift_pos{ii}(1:4,count)= L_valid_points_cam_sift_pos{ii}(1:4,jj);
            L_features_cam_Ls_sift_des{ii}(1:128,count)=L_features_cam_sift_des{ii}(1:128,jj);
            count=count+1;
        end       
               
    end
    
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% construct feature set in Rightside of camera image in Right view
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for ii=1:camera_number    
    %Rs_Leftmost_xpos(ii)=R_cols1(ii)*0.5;
    Rs_Leftmost_xpos=R_cols1*0.5;
    Rs_Rightmost_xpos(ii)=R_cols1(ii);    
    count=1;
    sub_length=size( R_features_cam_sift_des{ii},2);
    for jj=1:sub_length
        if R_valid_points_cam_sift_pos{ii}(1,jj)> Rs_Leftmost_xpos
            R_valid_points_cam_Rs_sift_pos{ii}(1:4,count)= R_valid_points_cam_sift_pos{ii}(1:4,jj);
            R_features_cam_Rs_sift_des{ii}(1:128,count)=R_features_cam_sift_des{ii}(1:128,jj);
            count=count+1;
        end       
               
    end
    
end
%% construct feature set in Leftside of camera image in Right view
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for ii=1:camera_number
    Ls_Leftmost_xpos(ii)=1;
    %Ls_Rightmost_xpos(ii)=0.5*L_cols1(ii);
    Ls_Rightmost_xpos=0.5*L_cols1(ii);
    count=1;
    sub_length=size( R_features_cam_sift_des{ii},2);
    for jj=1:sub_length
        if R_valid_points_cam_sift_pos{ii}(1,jj)< Ls_Rightmost_xpos
            R_valid_points_cam_Ls_sift_pos{ii}(1:4,count)= R_valid_points_cam_sift_pos{ii}(1:4,jj);
            R_features_cam_Ls_sift_des{ii}(1:128,count)=R_features_cam_sift_des{ii}(1:128,jj);
            count=count+1;
        end       
               
    end
    
end
save renewed_stereo_matching_sift_part2.mat;
end