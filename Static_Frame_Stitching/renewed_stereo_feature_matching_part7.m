% new_stereo_feature_matching_part8.m
% clear;clc;
function renewed_stereo_feature_matching_part7(frame_input)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Reading cp file and writing tracked pto file
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Left view part
% write cp data from *cp_L_common.txt into *.common_cp.pto files
%for jj=1:100
%jj=1;
%frame_input=18;
jj=frame_input;

old_pto_filename_L_base='20181029_StarCam_';
old_pto_filename_L_p1=strcat(old_pto_filename_L_base,num2str(jj,'%06i'));
old_pto_filename_L=strcat(old_pto_filename_L_p1,'_VL.pto');

new_pto_filename_L_base='20181029_StarCam_';
new_pto_filename_L_p1=strcat(new_pto_filename_L_base,num2str(jj,'%06i'));
new_pto_filename_L=strcat(new_pto_filename_L_p1,'_VL_sift_tracked.pto');
%new_pto_filename_L='20170607_Forest_000000_L_common_cp.pto';

common_cp_filename_L_base='20181029_StarCam_';
common_cp_filename_L_p1=strcat(common_cp_filename_L_base,num2str(jj,'%06i'));
common_cp_filename_L=strcat(common_cp_filename_L_p1,'_VL_cp_common.txt');

%common_cp_filename_L='20170419_forest_set1_000000_cp_L_common.txt';

fid1 = fopen(old_pto_filename_L,'r');

fid2 = fopen(new_pto_filename_L,'w+');

fid3 = fopen(common_cp_filename_L,'r');

MyTextFile1 = textscan(fid1,'%s','delimiter','\n');
MyTextFile1 = [MyTextFile1{:}];

%MyTextFile2 = textscan(fid2,'%s','delimiter','\n');
%MyTextFile2 = [MyTextFile2{:}];

MyTextFile3 = textscan(fid3,'%s','delimiter','\n');
MyTextFile3 = [MyTextFile3{:}];

count=1;
whole_pto_length=size(MyTextFile1,1);
for ii=1:whole_pto_length
    current_line=MyTextFile1{ii};
    target_line='# control points';
    if strcmp(current_line,target_line)
        pre_cp_length=ii;
    end    

end

% wrtie cp from line of pre_cp_length + 1
% pre_cp_part
for ii=1:pre_cp_length
     current_line=MyTextFile1{ii};
     fprintf(fid2,'%s \n',  current_line);   

end
% cp_part
common_cp_length=size(MyTextFile3,1);
for ii=1:common_cp_length
     current_line=MyTextFile3{ii};
     fprintf(fid2,'%s \n',  current_line);   

end
% post_cp_part
for ii=pre_cp_length+1:whole_pto_length
     current_line=MyTextFile1{ii};
     fprintf(fid2,'%s \n',  current_line);   

end
fclose(fid1);
fclose(fid2);
fclose(fid3);

%% Right view part
% write cp data from *cp_L_common.txt into *.common_cp.pto files

% old_pto_filename_R='20170607_Forest_000000_R.pto';
% new_pto_filename_R='20170607_Forest_000000_R_common_cp.pto';
% common_cp_filename_R='20170419_forest_set1_000000_cp_R_common.txt';
old_pto_filename_R_base='20181029_StarCam_';
old_pto_filename_R_p1=strcat(old_pto_filename_R_base,num2str(jj,'%06i'));
old_pto_filename_R=strcat(old_pto_filename_R_p1,'_VR.pto');

new_pto_filename_R_base='20181029_StarCam_';
new_pto_filename_R_p1=strcat(new_pto_filename_R_base,num2str(jj,'%06i'));
new_pto_filename_R=strcat(new_pto_filename_R_p1,'_VR_sift_tracked.pto');

common_cp_filename_R_base='20181029_StarCam_';
common_cp_filename_R_p1=strcat(common_cp_filename_R_base,num2str(jj,'%06i'));
common_cp_filename_R=strcat(common_cp_filename_R_p1,'_VR_cp_common.txt');

fid4 = fopen(old_pto_filename_R,'r');

fid5 = fopen(new_pto_filename_R,'w+');

fid6 = fopen(common_cp_filename_R,'r');

MyTextFile4 = textscan(fid4,'%s','delimiter','\n');
MyTextFile4 = [MyTextFile4{:}];

%MyTextFile2 = textscan(fid2,'%s','delimiter','\n');
%MyTextFile2 = [MyTextFile2{:}];

MyTextFile6 = textscan(fid6,'%s','delimiter','\n');
MyTextFile6 = [MyTextFile6{:}];

count=1;
whole_pto_length=size(MyTextFile4,1);
for ii=1:whole_pto_length
    current_line=MyTextFile4{ii};
    target_line='# control points';
    if strcmp(current_line,target_line)
        pre_cp_length=ii;
    end    

end

% wrtie cp from line of pre_cp_length + 1
% pre_cp_part
for ii=1:pre_cp_length
     current_line=MyTextFile4{ii};
     fprintf(fid5,'%s \n',  current_line);   

end
% cp_part
common_cp_length=size(MyTextFile6,1);
for ii=1:common_cp_length
     current_line=MyTextFile6{ii};
     fprintf(fid5,'%s \n',  current_line);   

end
% post_cp_part
for ii=pre_cp_length+1:whole_pto_length
     current_line=MyTextFile4{ii};
     fprintf(fid5,'%s \n',  current_line);   

end
fclose(fid4);
fclose(fid5);
fclose(fid6);
%end
end