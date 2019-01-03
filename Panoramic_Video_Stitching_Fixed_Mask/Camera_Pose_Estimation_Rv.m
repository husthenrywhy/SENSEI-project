
function Camera_Pose_Estimation_Rv(Date_str,frame_input,opt_mode)
frame_idx=frame_input;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%% Pre-Set Parameters View %%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    Input_pto_filename0=strcat(Date_str,'_StarCam_',num2str(frame_idx,'%06i'),'_VR_sift_tracked.pto');
    Output_pto_filename0=strcat(Date_str,'_StarCam_',num2str(frame_idx,'%06i'),'_VR_preset_v.pto');

    Opt_cmd_0=strcat('pto_var --output=',Output_pto_filename0,{' '} ,'--set=v=60',{' '},Input_pto_filename0);
    [status_0,cmdout_0] = system(Opt_cmd_0{1});
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%% Set Optimziation Variables %%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Position
    Input_pto_filename1=Output_pto_filename0;
    Output_pto_filename1=strcat('20181029_StarCam_',num2str(frame_idx,'%06i'),'_VR_position.pto');

    %--set-from-file
    %Opt_cmd_1=strcat('pto_var --output=',Output_pto_filename1,{' '} ,'--set-from-file,Rb0,Rc0,Rd0,Re0,Vb0,Vc0,Vd0,r,p,y,Ra,Rb,Rc,Rd,Re,Vb,Vc,Vd,Eev',{' '},Input_pto_filename1);
    Opt_cmd_1=strcat('pto_var --output=',Output_pto_filename1,{' '} ,'--opt=Ra0,Rb0,Rc0,Rd0,Re0,Vb0,Vc0,Vd0,r,p,y,Ra,Rb,Rc,Rd,Re,Vb,Vc,Vd,Eev',{' '},Input_pto_filename1);
    [status1,cmdout1] = system(Opt_cmd_1{1});

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%% Operate Optimization %%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    Input_pto_filename2=Output_pto_filename1;
    Output_pto_filename2=strcat('20181029_StarCam_',num2str(frame_idx,'%06i'),'_VR_position_optimized.pto');


    Opt_cmd_2=strcat('autooptimiser -n -o', {' '}, Output_pto_filename2,{' '},Input_pto_filename2);
    [status2,cmdout2] = system(Opt_cmd_2{1});

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if opt_mode ==2 % Position View Barrel
    Input_pto_filename3=Output_pto_filename2;
    Output_pto_filename3=strcat('20181029_StarCam_',num2str(frame_idx,'%06i'),'_VR_PVB.pto');

    Opt_cmd_3=strcat('pto_var --output=',Output_pto_filename3,{' '} ,'--opt=r,p,y,b,v,Ra,Rb,Rc,Rd,Re,Vb,Vc,Vd,!Eev0',{' '},Input_pto_filename3);
    [status3,cmdout3] = system(Opt_cmd_3{1});

elseif opt_mode==3    
    Input_pto_filename3=Output_pto_filename2;
    Output_pto_filename3=strcat('20181029_StarCam_',num2str(frame_idx,'%06i'),'_VR_E.pto');

    Opt_cmd_3=strcat('pto_var --output=',Output_pto_filename3,{' '} ,'--opt=r,p,y,b,v,Ra,Rb,Rc,Rd,Re,Vb,Vc,Vd,Eev,a,b,c,d,e',{' '},Input_pto_filename3);
    [status3,cmdout3] = system(Opt_cmd_3{1});    
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%% Operate Optimization %%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Input_pto_filename4=Output_pto_filename3;
Output_pto_filename4=strcat('20181029_StarCam_',num2str(frame_idx,'%06i'),'_VR_position_optimized2.pto');

Opt_cmd_4=strcat('autooptimiser -n -o', {' '}, Output_pto_filename4,{' '},Input_pto_filename4);
[status4,cmdout4] = system(Opt_cmd_4{1});
% %% optimization 2
% %  option rpyvb
% 
% Input_pto_filename3=Output_pto_filename2;
% Output_pto_filename3=strcat('20181029_StarCam_',num2str(frame_idx,'%06i'),'_VR_rpyvb_var.pto');
% 
% Opt_cmd_3=strcat('pto_var --output=',Output_pto_filename3,{' '} ,'--opt=v0,r,p,y,Ra0,Rb0,Rc0,Rd0,Re0,b0,Vb0,Vc0,Vd0,Eev',{' '},Input_pto_filename3);
% [status3,cmdout3] = system(Opt_cmd_3{1});
% 
% 
% Input_pto_filename4=Output_pto_filename3;
% Output_pto_filename4=strcat('20181029_StarCam_',num2str(frame_idx,'%06i'),'_VR_rpyvb_optimized.pto');
% 
% Opt_cmd_4=strcat('autooptimiser -n -o', {' '}, Output_pto_filename4,{' '},Input_pto_filename4);
%[status4,cmdout4] = system(Opt_cmd_4{1});
%% Output Panorama
%  pano_modify
%  straighten
Input_pto_filename5=Output_pto_filename4;
Output_pto_filename5=strcat('20181029_StarCam_',num2str(frame_idx,'%06i'),'_VR_modified.pto');

Opt_cmd_5=strcat('pano_modify -s --output=',Output_pto_filename5, {' '}, Input_pto_filename5);
[status5,cmdout5] = system(Opt_cmd_5{1});
%  pano_modify
%  fov canvas crop file-type
Input_pto_filename6=Output_pto_filename5;
Output_pto_filename6=strcat('20181029_StarCam_',num2str(frame_idx,'%06i'),'_VR_modified_2.pto');

% Opt_cmd_6=strcat('pano_modify -c --fov=360x180 --canvas=12000x6000 --crop=0,12000,0,6000 --ldr-file=tif --output=',Output_pto_filename6, {' '}, Input_pto_filename6);
% [status6,cmdout6] = system(Opt_cmd_6{1});

Opt_cmd_6=strcat('pano_modify -c --fov=360x180 --canvas=12000x6000  --ldr-file=tif --output=',Output_pto_filename6, {' '}, Input_pto_filename6);
[status6,cmdout6] = system(Opt_cmd_6{1});

% %% Output Panorama
% %  hugin_executor
% Input_pto_filename7=Output_pto_filename6;
% Output_pto_filename7=strcat('20181029_StarCam_',num2str(frame_idx,'%06i'),'_VR_final.pto');
% Output_panorama_filename=strcat('20181029_StarCam_',num2str(frame_idx,'%06i'),'_VR_tracked.jpg');
% 
% Opt_cmd_7=strcat('hugin_executor --prefix=',Output_panorama_filename,{' '},'--stitching', {' '}, Input_pto_filename7);
% [status7,cmdout7] = system(Opt_cmd_7{1});
% %end

end