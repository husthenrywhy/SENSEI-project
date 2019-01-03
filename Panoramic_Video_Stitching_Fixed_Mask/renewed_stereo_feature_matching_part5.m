
function renewed_stereo_feature_matching_part5(frame_input)

frame_idx=frame_input;
load renewed_stereo_matching_sift_part4.mat;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% writing cp into cp_txt
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Step1 cp_txt filenames determination
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%cp_matched_filename1='20170905_StarCam_000031_VL_cp_common.txt';
cp_matched_filename1=strcat(Left_image_name_base,'cp_common.txt');
fileID1=fopen(cp_matched_filename1,'w+');

%cp_matched_filename2='20170905_StarCam_000031_VR_cp_common.txt';
cp_matched_filename2=strcat(Right_image_name_base,'cp_common.txt');
fileID2=fopen(cp_matched_filename2,'w+');

% cp_matched_filename3=strcat('All_4_cp_common_matching_score.txt');
%frame_idx=18;
cp_matched_filename3=strcat('20181029_StarCam_',num2str(frame_idx,'%06i'),'_All_4_cp_common_matching_score.txt');
fileID3=fopen(cp_matched_filename3,'w+');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Step2 cp_txt writing
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%% Writing Left_view_cp_data_common into pto files %%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for ii=1:camera_number-1
    cp_length=size(common_cp_Lv_sift_Rs_pos{ii},2);
    for jjj=1:cp_length
        formatSpec1 = 'c n%d N%d x%4.2f y%4.2f X%4.2f Y%4.2f t0 \n';
        A1=ii-1;     
        A2=ii;
        A3=common_cp_Lv_sift_Rs_pos{ii}(1,jjj);
        A4=common_cp_Lv_sift_Rs_pos{ii}(2,jjj);
        A5=common_cp_Lv_sift_Ls_pos{ii}(1,jjj);
        A6=common_cp_Lv_sift_Ls_pos{ii}(2,jjj);        
        A7=[A1 A2 A3 A4 A5 A6];
        fprintf(fileID1,formatSpec1,A7);               
    end
end

for ii=camera_number
    cp_length=size(common_cp_Lv_sift_Rs_pos{ii},2);
    for jjj=1:cp_length
        formatSpec1 = 'c n%d N%d x%4.2f y%4.2f X%4.2f Y%4.2f t0 \n';
        A1=ii-1;     
        A2=0;
        A3=common_cp_Lv_sift_Rs_pos{ii}(1,jjj);
        A4=common_cp_Lv_sift_Rs_pos{ii}(2,jjj);
        A5=common_cp_Lv_sift_Ls_pos{ii}(1,jjj);
        A6=common_cp_Lv_sift_Ls_pos{ii}(2,jjj);        
        A7=[A1 A2 A3 A4 A5 A6];
        fprintf(fileID1,formatSpec1,A7);               
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%% Writing Right_view_cp_data_common into pto files %%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% writing Right_view_cp_data_common into pto files
 for ii=1:camera_number-1
    cp_length=size(common_cp_Rv_sift_Rs_pos{ii},2);
    for jjj=1:cp_length
        formatSpec1 = 'c n%d N%d x%4.2f y%4.2f X%4.2f Y%4.2f t0 \n';
        A1=ii-1;     
        A2=ii;
        A3=common_cp_Rv_sift_Rs_pos{ii}(1,jjj);
        A4=common_cp_Rv_sift_Rs_pos{ii}(2,jjj);
        A5=common_cp_Rv_sift_Ls_pos{ii}(1,jjj);
        A6=common_cp_Rv_sift_Ls_pos{ii}(2,jjj);        
        A7=[A1 A2 A3 A4 A5 A6];
        fprintf(fileID2,formatSpec1,A7);               
    end
    
 end
 
 for ii=camera_number
    cp_length=size(common_cp_Rv_sift_Rs_pos{ii},2);
    for jjj=1:cp_length
        formatSpec1 = 'c n%d N%d x%4.2f y%4.2f X%4.2f Y%4.2f t0 \n';
        A1=ii-1;     
        A2=0;
        A3=common_cp_Rv_sift_Rs_pos{ii}(1,jjj);
        A4=common_cp_Rv_sift_Rs_pos{ii}(2,jjj);
        A5=common_cp_Rv_sift_Ls_pos{ii}(1,jjj);
        A6=common_cp_Rv_sift_Ls_pos{ii}(2,jjj);        
        A7=[A1 A2 A3 A4 A5 A6];
        fprintf(fileID2,formatSpec1,A7);               
    end
    
 end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%% Writing all 4 cp's score matching into pto files %%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
% writing Right_view_cp_data_common into pto files
 for ii=1:camera_number-1
    cp_length=size(Common_cp_valid_score_all_4_output{ii},1);
    for jjj=1:cp_length
        %formatSpec1 = 'c n%d N%d x%4.2f y%4.2f X%4.2f Y%4.2f t0 \n';
        formatSpec1 = 'c n%d N%d score %4.6f \n';
        A1=ii-1;     
        A2=ii;
        A3=Common_cp_valid_score_all_4_output{ii}(jjj);
        %A4=common_cp_Rv_sift_Rs_pos{ii}(2,jjj);
        %A5=common_cp_Rv_sift_Ls_pos{ii}(1,jjj);
        %A6=common_cp_Rv_sift_Ls_pos{ii}(2,jjj);        
        A7=[A1 A2 A3];
        fprintf(fileID3,formatSpec1,A7);               
    end
    
 end
 
% writing Right_view_cp_data_common into pto files
 for ii=camera_number
    cp_length=size(Common_cp_valid_score_all_4_output{ii},1);
    for jjj=1:cp_length
        %formatSpec1 = 'c n%d N%d x%4.2f y%4.2f X%4.2f Y%4.2f t0 \n';
        formatSpec1 = 'c n%d N%d score %4.6f \n';
        A1=ii-1;     
        A2=0;
        A3=Common_cp_valid_score_all_4_output{ii}(jjj);
        %A4=common_cp_Rv_sift_Rs_pos{ii}(2,jjj);
        %A5=common_cp_Rv_sift_Ls_pos{ii}(1,jjj);
        %A6=common_cp_Rv_sift_Ls_pos{ii}(2,jjj);        
        A7=[A1 A2 A3];
        fprintf(fileID3,formatSpec1,A7);               
    end
    
 end 
fclose('all');
save renewed_stereo_matching_sift_part5.mat;

end