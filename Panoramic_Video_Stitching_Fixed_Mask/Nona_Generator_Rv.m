% clear;clc;

%nona_cmd='nona';
%for frame_idx=13:100
function Nona_Generator(Date_str,frame_input)   
%frame_idx=18;
frame_idx=frame_input;
TIF_name=strcat('Output_',num2str(frame_idx,'%06i'),'_VL_');
Pto_name=strcat(Date_str,'_StarCam_',num2str(frame_idx,'%06i'),'_VL_modified_2.pto');

Nona_cmd=strcat('nona -o ',{' '},TIF_name,{' '},Pto_name);

[status1,cmdout1] = system(Nona_cmd{1});
end