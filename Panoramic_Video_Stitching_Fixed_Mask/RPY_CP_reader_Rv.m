% function RPY_reader.m
% 02-07-2018
% Haoyu Wang

% Input:
% <1> old pto file name for current frame number
% <2> new pto file name for RPY information
% Output:
% <1> data with all camera position parametess in old pto file name
% <2> new pto file name with updated camera position


function [updated_pto_filename]=RPY_CP_reader_Rv(Num_pto_filename,RPY_pto_filename,frame_RPY_idx,frame_Num_idx)
%clear;clc;
%old_frame_num=1;
%new_frame_num=2;
%Num_pto_filename = '20180130_StarCam_000001_VR_modified2.pto';
%RPY_pto_filename = '20180130_StarCam_000002_VR_sift_tracked.pto';

updated_pto_filename = strrep(Num_pto_filename, 'VR.pto', 'VR_inherited.pto');
% updated_pto_filename = strrep(updated_pto_filename, , );
% old_frame_num=1;

fid1 = fopen(Num_pto_filename,'r');

fid2 = fopen(RPY_pto_filename,'r');

fid3 = fopen(updated_pto_filename,'w+');

MyTextFile1 = textscan(fid1,'%s','delimiter','\n');
MyTextFile1 = [MyTextFile1{:}];

MyTextFile2 = textscan(fid2,'%s','delimiter','\n');
MyTextFile2 = [MyTextFile2{:}];

count=1;
whole_pto_length=size(MyTextFile1,1);
whole_pto_length_new=size(MyTextFile2,1);

for ii=1:whole_pto_length
    current_line=MyTextFile1{ii};
    target_line='#hugin_ptoversion 2';
    if strcmp(current_line,target_line)
        pre_RPY_length=ii;
    end    
end

for ii=pre_RPY_length+1:whole_pto_length
    current_line=MyTextFile1{ii};
    target_line='#hugin_optimizeReferenceImage 0';
    if strcmp(current_line,target_line)
        post_CP_length=ii;
    end       

end
%% Actually line needs to be operated is line 06(pre_RPY_length) to line 24(post_RPY_length-1)
% Output part1 (1 to 5)
% Pre_RPY_info from RPY_pto_filename
for ii=1:pre_RPY_length-1
     current_line=MyTextFile1{ii};
     fprintf(fid3,'%s \n',  current_line);   

end
% Output part2 (6 to 22)
% RPY_info from Num_pto_filename and slightly rewritten
for ii=pre_RPY_length:post_CP_length-1
     current_line=MyTextFile2{ii};
     % updated_current_line = strrep(current_line, num2str(old_frame_num,'%06i'), num2str(new_frame_num,'%06i') );
     updated_current_line = strrep(current_line, num2str(frame_RPY_idx,'%06i'), num2str(frame_Num_idx,'%06i') );
     fprintf(fid3,'%s \n',  updated_current_line);   

end
% Output part3 (23 to end)
% Post_RPY_info from RPY_pto_filename
for ii=post_CP_length:whole_pto_length
     current_line=MyTextFile1{ii};
     fprintf(fid3,'%s \n',  current_line);   

end

fclose('all');
end