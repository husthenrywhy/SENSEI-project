%% Goal: find avereage camera parameteres for both view
clear;clc;close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Reading Left and Right Pto Files %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pto_filename_1='20180812_StarCam_000001_VL_sift_tracked.pto';
pto_filename_2='20180812_StarCam_000001_VR_sift_tracked.pto';
% reading pto files
fileID1=fopen(pto_filename_1,'r');
fileID2=fopen(pto_filename_2,'r');

MyTextFile1 = textscan(fileID1,'%s','delimiter','\n');
MyTextFile1 = [MyTextFile1{:}];

MyTextFile2 = textscan(fileID2,'%s','delimiter','\n');
MyTextFile2 = [MyTextFile2{:}];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% Find Average Camera Poses %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Left View Camera Pose Reading
count=1;
whole_pto_length=size(MyTextFile1,1);
for ii=1:whole_pto_length
    current_line=MyTextFile1{ii};
    target_line='# image lines';
    if strcmp(current_line,target_line)
        pre_cp_length=ii;
    end   
end
% line 6 to line 22
% for ii=8:2:22
count=1;
for ii=8:2:22
    Lv_current_line=MyTextFile1{ii};
    Lv_sub_line= strsplit(Lv_current_line);
    Lv_sub_line_length=size(Lv_sub_line,2);
    % read camera parameters
    % Parameter fov 
    if Lv_sub_line{5}(2)=='-'
        Lv_parameter_v_num(count)=str2double( Lv_sub_line{5}(3:end) );
        Lv_parameter_v_num(count)=-Lv_parameter_v_num(count);
    else
        Lv_parameter_v_num(count)=str2double( Lv_sub_line{5}(2:end) );    
    end
    % Parameter roll
    if Lv_sub_line{14}(2)=='-'
        Lv_parameter_r_num(count)=str2double( Lv_sub_line{14}(3:end) );
        Lv_parameter_r_num(count)=-Lv_parameter_r_num(count);
    else
        Lv_parameter_r_num(count)=str2double( Lv_sub_line{14}(2:end) );    
    end
    % Parameter pitch
    if Lv_sub_line{15}(2)=='-'
        Lv_parameter_p_num(count)=str2double( Lv_sub_line{15}(3:end) );
        Lv_parameter_p_num(count)=-Lv_parameter_p_num(count);
    else
        Lv_parameter_p_num(count)=str2double( Lv_sub_line{15}(2:end) );    
    end
    % Parameter yaw
    if Lv_sub_line{16}(2)=='-'
        Lv_parameter_y_num(count)=str2double( Lv_sub_line{16}(3:end) );        
        Lv_parameter_y_num(count)=-Lv_parameter_y_num(count);        
    else
        Lv_parameter_y_num(count)=str2double( Lv_sub_line{16}(2:end) );    
    end
    % Parameter barrel distortion
    if Lv_sub_line{24}(2)=='-'
        Lv_parameter_b_num(count)=str2double( Lv_sub_line{24}(3:end) );
        Lv_parameter_b_num(count)=-Lv_parameter_b_num(count);
    else
        Lv_parameter_b_num(count)=str2double( Lv_sub_line{24}(2:end) );    
    end
    
    count=count+1;
end

%% Right View Camera Pose Reading
count=1;
whole_pto_length=size(MyTextFile2,1);
for ii=1:whole_pto_length
    current_line=MyTextFile2{ii};
    target_line='# image lines';
    if strcmp(current_line,target_line)
        pre_cp_length=ii;
    end   
end
% line 6 to line 22
% for ii=8:2:22
count=1;
for ii=8:2:22
    Rv_current_line=MyTextFile2{ii};
    Rv_sub_line= strsplit(Rv_current_line);
    Rv_sub_line_length=size(Rv_sub_line,2);
    % read camera parameters
    % Parameter fov 
    if Rv_sub_line{5}(2)=='-'
        Rv_parameter_v_num(count)=str2double( Rv_sub_line{5}(3:end) );
        Rv_parameter_v_num(count)=-Rv_parameter_v_num(count);
    else
        Rv_parameter_v_num(count)=str2double( Rv_sub_line{5}(2:end) );    
    end
    % Parameter roll
    if Rv_sub_line{14}(2)=='-'
        Rv_parameter_r_num(count)=str2double( Rv_sub_line{14}(3:end) );
        Rv_parameter_r_num(count)=-Rv_parameter_r_num(count);
    else
        Rv_parameter_r_num(count)=str2double( Rv_sub_line{14}(2:end) );    
    end
    % Parameter pitch
    if Rv_sub_line{15}(2)=='-'
        Rv_parameter_p_num(count)=str2double( Rv_sub_line{15}(3:end) );
        Rv_parameter_p_num(count)=-Rv_parameter_p_num(count);
    else
        Rv_parameter_p_num(count)=str2double( Rv_sub_line{15}(2:end) );    
    end
    % Parameter yaw
    if Rv_sub_line{16}(2)=='-'
        Rv_parameter_y_num(count)=str2double( Rv_sub_line{16}(3:end) );
        Rv_parameter_y_num(count)=-Rv_parameter_y_num(count);
    else
        Rv_parameter_y_num(count)=str2double( Rv_sub_line{16}(2:end) );    
    end
    % Parameter barrel distortion
    if Rv_sub_line{24}(2)=='-'
        Rv_parameter_b_num(count)=str2double( Rv_sub_line{24}(3:end) );
        Rv_parameter_b_num(count)=-Rv_parameter_b_num(count);
    else
        Rv_parameter_b_num(count)=str2double( Rv_sub_line{24}(2:end) );    
    end
    
    count=count+1;
end
%% Compute average camera poses
for camera_count=1:8
    % Average of Left and Right View Camera pose parameters
    mean_parameter_v_num(camera_count)=0.5*Lv_parameter_v_num(camera_count)+0.5*Rv_parameter_v_num(camera_count);
    mean_parameter_r_num(camera_count)=0.5*Lv_parameter_r_num(camera_count)+0.5*Rv_parameter_r_num(camera_count);
    mean_parameter_p_num(camera_count)=0.5*Lv_parameter_p_num(camera_count)+0.5*Rv_parameter_p_num(camera_count);
    
    if Lv_parameter_y_num(camera_count)<0
       Lv_parameter_y_num_compensated(camera_count)=Lv_parameter_y_num(camera_count)+360;
    else
       Lv_parameter_y_num_compensated(camera_count)=Lv_parameter_y_num(camera_count);
    end    
    if Rv_parameter_y_num(camera_count)<0
       Rv_parameter_y_num_compensated(camera_count)=Rv_parameter_y_num(camera_count)+360;
    else
       Rv_parameter_y_num_compensated(camera_count)=Rv_parameter_y_num(camera_count); 
    end
    mean_parameter_y_num(camera_count)=0.5*Lv_parameter_y_num_compensated(camera_count)+0.5*Rv_parameter_y_num_compensated(camera_count);
    
    mean_parameter_b_num(camera_count)=0.5*Lv_parameter_b_num(camera_count)+0.5*Rv_parameter_b_num(camera_count); 
    
    % Convert into String
    mean_parameter_v_str{camera_count} = strcat('v', num2str(mean_parameter_v_num(camera_count)));
    mean_parameter_r_str{camera_count} = strcat('r', num2str(mean_parameter_r_num(camera_count)));
    mean_parameter_p_str{camera_count} = strcat('p', num2str(mean_parameter_p_num(camera_count)));
    mean_parameter_y_str{camera_count} = strcat('y', num2str(mean_parameter_y_num(camera_count)));
    mean_parameter_b_str{camera_count} = strcat('b', num2str(mean_parameter_b_num(camera_count)));
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% Generate New Pto Files %%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
new_pto_filename_1='20180812_StarCam_000001_VL_sift_tracked_average.pto';
new_pto_filename_2='20180812_StarCam_000001_VR_sift_tracked_average.pto';
% create bew pto files
fid3=fopen(new_pto_filename_1,'w+');
fid4=fopen(new_pto_filename_2,'w+');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% Writing into new Pto Files %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Replace all camera pose parameters in Left View Pto Files
%% Left View Camera Pose Reading
count=1;
whole_pto_length=size(MyTextFile1,1);
MyTextFile3=MyTextFile1;
%for ii=1:whole_pto_length
for ii=1:6
    current_line=MyTextFile1{ii};
    fprintf(fid3,'%s \n',  current_line);
end
% line 6 to line 22
% for ii=8:2:22
camera_count=1;
for ii=7:22
    if mod(ii,2)==1
        current_line=MyTextFile1{ii};
        fprintf(fid3,'%s \n',  current_line);
    else
    Lv_current_line=MyTextFile1{ii};
    Lv_sub_line= strsplit(Lv_current_line);
    Lv_sub_line_length=size(Lv_sub_line,2);
    % 
    % Replace parameter fov
    target_sub_str=Lv_sub_line{5};
    replaced_sub_str= mean_parameter_v_str{camera_count};
    new_Lv_current_line = strrep(Lv_current_line,target_sub_str,replaced_sub_str); 
    % Replace parameter roll
    target_sub_str=Lv_sub_line{14};
    replaced_sub_str= mean_parameter_r_str{camera_count};
    new_Lv_current_line = strrep(new_Lv_current_line,target_sub_str,replaced_sub_str); 
    % Replace parameter pitch
    target_sub_str=Lv_sub_line{15};
    replaced_sub_str= mean_parameter_p_str{camera_count};
    new_Lv_current_line = strrep(new_Lv_current_line,target_sub_str,replaced_sub_str); 
    % Replace parameter yaw
    target_sub_str=Lv_sub_line{16};
    replaced_sub_str= mean_parameter_y_str{camera_count};
    new_Lv_current_line = strrep(new_Lv_current_line,target_sub_str,replaced_sub_str); 
    % Replace parameter barrel
    target_sub_str=Lv_sub_line{24};
    replaced_sub_str= mean_parameter_b_str{camera_count};
    new_Lv_current_line = strrep(new_Lv_current_line,target_sub_str,replaced_sub_str); 
    fprintf(fid3,'%s \n',  new_Lv_current_line);
    camera_count=camera_count+1;
    end
end

% for ii=7:2:21
%     current_line=MyTextFile1{ii};
%     fprintf(fid3,'%s \n',  current_line);
% end

for ii=23:whole_pto_length
    current_line=MyTextFile1{ii};
    fprintf(fid3,'%s \n',  current_line);
end

%% Right View Writing
count=1;
whole_pto_length=size(MyTextFile2,1);
MyTextFile4=MyTextFile2;
%for ii=1:whole_pto_length
for ii=1:6
    current_line=MyTextFile2{ii};
    fprintf(fid4,'%s \n',  current_line);
end
% line 6 to line 22
% for ii=8:2:22
camera_count=1;
for ii=7:22
    if mod(ii,2)==1
        current_line=MyTextFile2{ii};
        fprintf(fid4,'%s \n',  current_line);
    else
    Rv_current_line=MyTextFile2{ii};
    Rv_sub_line= strsplit(Rv_current_line);
    Rv_sub_line_length=size(Rv_sub_line,2);
    % 
    % Replace parameter fov
    target_sub_str=Rv_sub_line{5};
    replaced_sub_str= mean_parameter_v_str{camera_count};
    new_Rv_current_line = strrep(Rv_current_line,target_sub_str,replaced_sub_str); 
    % Replace parameter roll
    target_sub_str=Rv_sub_line{14};
    replaced_sub_str= mean_parameter_r_str{camera_count};
    new_Rv_current_line = strrep(new_Rv_current_line,target_sub_str,replaced_sub_str); 
    % Replace parameter pitch
    target_sub_str=Rv_sub_line{15};
    replaced_sub_str= mean_parameter_p_str{camera_count};
    new_Rv_current_line = strrep(new_Rv_current_line,target_sub_str,replaced_sub_str); 
    % Replace parameter yaw
    target_sub_str=Rv_sub_line{16};
    replaced_sub_str= mean_parameter_y_str{camera_count};
    new_Rv_current_line = strrep(new_Rv_current_line,target_sub_str,replaced_sub_str); 
    % Replace parameter barrel
    target_sub_str=Rv_sub_line{24};
    replaced_sub_str= mean_parameter_b_str{camera_count};
    new_Rv_current_line = strrep(new_Rv_current_line,target_sub_str,replaced_sub_str); 
    fprintf(fid4,'%s \n',  new_Rv_current_line);
    camera_count=camera_count+1;
    end
end

% for ii=7:2:21
%     current_line=MyTextFile1{ii};
%     fprintf(fid3,'%s \n',  current_line);
% end

for ii=23:whole_pto_length
    current_line=MyTextFile2{ii};
    fprintf(fid4,'%s \n',  current_line);
end

fclose('all');
%%
% count=1;
% for ii=8:2:22
%     Lv_current_line=MyTextFile1{ii};
%     Lv_sub_line= strsplit(Lv_current_line);
%     Lv_sub_line_length=size(Lv_sub_line,2);
%     % read camera parameters
%     % Parameter fov 
%     if Lv_sub_line{5}(2)=='-'
%         Lv_parameter_v_num(count)=str2double( Lv_sub_line{5}(3:end) );
%         Lv_parameter_v_num(count)=-Lv_parameter_v_num(count);
%     else
%         Lv_parameter_v_num(count)=str2double( Lv_sub_line{5}(2:end) );    
%     end
%     % Parameter roll
%     if Lv_sub_line{14}(2)=='-'
%         Lv_parameter_r_num(count)=str2double( Lv_sub_line{14}(3:end) );
%         Lv_parameter_r_num(count)=-Lv_parameter_r_num(count);
%     else
%         Lv_parameter_r_num(count)=str2double( Lv_sub_line{14}(2:end) );    
%     end
%     % Parameter pitch
%     if Lv_sub_line{15}(2)=='-'
%         Lv_parameter_p_num(count)=str2double( Lv_sub_line{15}(3:end) );
%         Lv_parameter_p_num(count)=-Lv_parameter_p_num(count);
%     else
%         Lv_parameter_p_num(count)=str2double( Lv_sub_line{15}(2:end) );    
%     end
%     % Parameter yaw
%     if Lv_sub_line{16}(2)=='-'
%         Lv_parameter_y_num(count)=str2double( Lv_sub_line{16}(3:end) );
%         Lv_parameter_y_num(count)=-Lv_parameter_y_num(count);
%     else
%         Lv_parameter_y_num(count)=str2double( Lv_sub_line{16}(2:end) );    
%     end
%     % Parameter barrel distortion
%     if Lv_sub_line{24}(2)=='-'
%         Lv_parameter_b_num(count)=str2double( Lv_sub_line{24}(3:end) );
%         Lv_parameter_b_num(count)=-Lv_parameter_b_num(count);
%     else
%         Lv_parameter_b_num(count)=str2double( Lv_sub_line{24}(2:end) );    
%     end
%     
%     count=count+1;
% end

%% Replace all camera pose parameters in Right View Pto Files


%%
% cp_matched_filename3=strcat('All_4_cp_common_matching_score.txt');
% frame_idx=1;
% cp_matched_filename3=strcat('20180812_StarCam_',num2str(frame_idx,'%06i'),'_All_4_cp_common_matching_score.txt');
% fileID3=fopen(cp_matched_filename3,'w+');
%% Writing into new Pto Files
% Replace all camera pose parameters in Left View Pto Files

% Replace all camera pose parameters in Right View Pto Files
% fclose('all');