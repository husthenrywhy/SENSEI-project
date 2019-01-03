
function [Common_cp_all_4,Common_cp_valid_score_all_4_mean]=renewed_commonly_identified_feature_construction(para1,para2,para3,para4,para5,para6,para7)
% Input: 
% <1> distRatio
% <2> camera_index1
% <3> camera_index2
% <4> norm_L_features_cam_Rs_sift_des
% <5> norm_L_features_cam_Ls_sift_des
% <6> norm_L_features_cam_Rs_sift_des
% <7> norm_L_features_cam_Ls_sift_des

    norm_L_features_cam_Rs_sift_des{para2}=para4;
    norm_L_features_cam_Ls_sift_des{para3}=para5;
    norm_R_features_cam_Rs_sift_des{para2}=para6;
    norm_R_features_cam_Ls_sift_des{para3}=para7;
    ii=para2;
% Output:
% <1> Common_cp_all_4 indices for des1 des2 des3 and des4
% <2> Matching scores of each squad

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                       Matching                                        %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
distRatio=para1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Matching based on L_features_cam_Rs_sift_des %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%for ii=1:camera_number
    %if ii~=8
        %cp_size1=size(norm_L_features_cam_Rs_sift_des{ii},2);
        %cp_size2=size(norm_L_features_cam_Rs_sift_des{ii+1},2);   
        
            % matrix of des1
            des1=norm_L_features_cam_Rs_sift_des{para2}';
            % matrix of des2
            des2t=norm_L_features_cam_Ls_sift_des{para3};
            % matrix of des3
            des3t=norm_R_features_cam_Rs_sift_des{para2};
            % matrix of des4
            des4t=norm_R_features_cam_Ls_sift_des{para3}; 
            
            for i = 1 : size(des1,1)
                dotprods_1_2 = (des1(i,:) * des2t);        % Computes vector of dot products
                dotprods_1_3 = (des1(i,:) * des3t);        % Computes vector of dot products
                dotprods_1_4 = (des1(i,:) * des4t);        % Computes vector of dot products
                
                score_1_2=acos(dotprods_1_2);% Take inverse cosine
                score_1_3=acos(dotprods_1_3);% Take inverse cosine
                score_1_4=acos(dotprods_1_4);% Take inverse cosine
                
                % Add term to score
                
                [vals_1_2,indx_1_2] = sort(score_1_2);  % Sort results
                [vals_1_3,indx_1_3] = sort(score_1_3);  % Sort results
                [vals_1_4,indx_1_4] = sort(score_1_4);  % Sort results

                % Check if nearest neighbor has angle less than distRatio times 2nd.
                if (vals_1_2(1) < distRatio * vals_1_2(2))
                match_1_2(i) = indx_1_2(1);
                else
                match_1_2(i) = 0;
                end
                % Check if nearest neighbor has angle less than distRatio times 2nd.
                if (vals_1_3(1) < distRatio * vals_1_3(2))
                match_1_3(i) = indx_1_3(1);
                else
                match_1_3(i) = 0;
                end
                % Check if nearest neighbor has angle less than distRatio times 2nd.
                if (vals_1_4(1) < distRatio * vals_1_4(2))
                match_1_4(i) = indx_1_4(1);
                else
                match_1_4(i) = 0;
                end
                % Adding in 2018-01-11
                % Record matching score 
                score_match_based_1(i,1)=vals_1_2(1);
                score_match_based_1(i,2)=vals_1_3(1);
                score_match_based_1(i,3)=vals_1_4(1);

            end
            Match_table_1=[match_1_2;match_1_3;match_1_4];
            
            % Find all three rows have non-zero value
            Match_table_size=size(Match_table_1,2);
            count=1;
            for jj=1:Match_table_size
                if (Match_table_1(1,jj)~=0) && (Match_table_1(2,jj)~=0)&&(Match_table_1(3,jj)~=0)
                   Match_table_valid_1(1,count)=jj; 
                   Match_table_valid_1(2,count)=Match_table_1(1,jj); 
                   Match_table_valid_1(3,count)=Match_table_1(2,jj); 
                   Match_table_valid_1(4,count)=Match_table_1(3,jj); 
                   % Adding in 2018-01-11
                   % Record matchign score between 4 des, small number
                   % means relibale matching
                   Match_table_valid_1_score(1,count)= score_match_based_1(jj,1)+score_match_based_1(jj,2)+score_match_based_1(jj,3);
                   count=count+1;
                end
                
            end
 clear des1 des2t des3t des4t;          
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Matching based on L_features_cam_Ls_sift_des %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%camera_number=8;
%for ii=1:camera_number
%ii=1;
    %if ii~=8
        %cp_size1=size(norm_L_features_cam_Rs_sift_des{ii},2);
        %cp_size2=size(norm_L_features_cam_Rs_sift_des{ii+1},2);   
        
            % matrix of des1
            des2=norm_L_features_cam_Ls_sift_des{para3}';
            % matrix of des2
            des1t=norm_L_features_cam_Rs_sift_des{para2};
            % matrix of des3
            des3t=norm_R_features_cam_Rs_sift_des{para2};
            % matrix of des4
            des4t=norm_R_features_cam_Ls_sift_des{para3}; 
            
            for i = 1 : size(des2,1)
                dotprods_2_1 = (des2(i,:) * des1t);        % Computes vector of dot products
                dotprods_2_3 = (des2(i,:) * des3t);        % Computes vector of dot products
                dotprods_2_4 = (des2(i,:) * des4t);        % Computes vector of dot products
                
                score_2_1=acos(dotprods_2_1);% Take inverse cosine
                score_2_3=acos(dotprods_2_3);% Take inverse cosine
                score_2_4=acos(dotprods_2_4);% Take inverse cosine
                
                % Add term to score
                
                [vals_2_1,indx_2_1] = sort(score_2_1);  % Sort results
                [vals_2_3,indx_2_3] = sort(score_2_3);  % Sort results
                [vals_2_4,indx_2_4] = sort(score_2_4);  % Sort results

                % Check if nearest neighbor has angle less than distRatio times 2nd.
                if (vals_2_1(1) < distRatio * vals_2_1(2))
                match_2_1(i) = indx_2_1(1);
                else
                match_2_1(i) = 0;
                end
                % Check if nearest neighbor has angle less than distRatio times 2nd.
                if (vals_2_3(1) < distRatio * vals_2_3(2))
                match_2_3(i) = indx_2_3(1);
                else
                match_2_3(i) = 0;
                end
                % Check if nearest neighbor has angle less than distRatio times 2nd.
                if (vals_2_4(1) < distRatio * vals_2_4(2))
                match_2_4(i) = indx_2_4(1);
                else
                match_2_4(i) = 0;
                end
                % Adding in 2018-01-11
                % Record matching score 
                score_match_based_2(i,1)=vals_2_1(1);
                score_match_based_2(i,2)=vals_2_3(1);
                score_match_based_2(i,3)=vals_2_4(1);

            end
            Match_table_2=[match_2_1;match_2_3;match_2_4];
            
            % Find all three rows have non-zero value
            Match_table_size=size(Match_table_2,2);
            count=1;
            for jj=1:Match_table_size
                if (Match_table_2(1,jj)~=0) && (Match_table_2(2,jj)~=0)&&(Match_table_2(3,jj)~=0)
                   Match_table_valid_2(1,count)=Match_table_2(1,jj);
                   Match_table_valid_2(2,count)=jj; 
                   Match_table_valid_2(3,count)=Match_table_2(2,jj); 
                   Match_table_valid_2(4,count)=Match_table_2(3,jj);
                   % Adding in 2018-01-11
                   % Record matchign score between 4 des, small number
                   % means relibale matching
                   Match_table_valid_2_score(1,count)= score_match_based_2(jj,1)+score_match_based_2(jj,2)+score_match_based_2(jj,3);
                   count=count+1;
                end
                
            end
            
clear des1t des2 des3t des4t;   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%distRatio=0.6;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Matching based on R_features_cam_Rs_sift_des %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%camera_number=8;
%for ii=1:camera_number
%ii=1;
    %if ii~=8
        %cp_size1=size(norm_R_features_cam_Rs_sift_des{ii},2);
        %cp_size2=size(norm_R_features_cam_Rs_sift_des{ii+1},2);   
        
            % matrix of des1
            des3=norm_R_features_cam_Rs_sift_des{para2}';
            % matrix of des2
            des1t=norm_L_features_cam_Rs_sift_des{para2};
            % matrix of des3
            des2t=norm_L_features_cam_Ls_sift_des{para3};
            % matrix of des4
            des4t=norm_R_features_cam_Ls_sift_des{para3}; 
            
            for i = 1 : size(des3,1)
                dotprods_3_1 = (des3(i,:) * des1t);        % Computes vector of dot products
                dotprods_3_2 = (des3(i,:) * des2t);        % Computes vector of dot products
                dotprods_3_4 = (des3(i,:) * des4t);        % Computes vector of dot products
                
                score_3_1=acos(dotprods_3_1);% Take inverse cosine
                score_3_2=acos(dotprods_3_2);% Take inverse cosine
                score_3_4=acos(dotprods_3_4);% Take inverse cosine
                
                % Add term to score
                
                [vals_3_1,indx_3_1] = sort(score_3_1);  % Sort results
                [vals_3_2,indx_3_2] = sort(score_3_2);  % Sort results
                [vals_3_4,indx_3_4] = sort(score_3_4);  % Sort results

                % Check if nearest neighbor has angle less than distRatio times 2nd.
                if (vals_3_1(1) < distRatio * vals_3_1(2))
                match_3_1(i) = indx_3_1(1);
                else
                match_3_1(i) = 0;
                end
                % Check if nearest neighbor has angle less than distRatio times 2nd.
                if (vals_3_2(1) < distRatio * vals_3_2(2))
                match_3_2(i) = indx_3_2(1);
                else
                match_3_2(i) = 0;
                end
                % Check if nearest neighbor has angle less than distRatio times 2nd.
                if (vals_3_4(1) < distRatio * vals_3_4(2))
                match_3_4(i) = indx_3_4(1);
                else
                match_3_4(i) = 0;
                end
                % Adding in 2018-01-11
                % Record matching score 
                score_match_based_3(i,1)=vals_3_1(1);
                score_match_based_3(i,2)=vals_3_2(1);
                score_match_based_3(i,3)=vals_3_4(1);

            end
            Match_table_3=[match_3_1;match_3_2;match_3_4];
            
            % Find all three rows have non-zero value
            Match_table_size=size(Match_table_3,2);
            count=1;
            for jj=1:Match_table_size
                if (Match_table_3(1,jj)~=0) && (Match_table_3(2,jj)~=0)&&(Match_table_3(3,jj)~=0)
                   Match_table_valid_3(1,count)=Match_table_3(1,jj);
                   Match_table_valid_3(2,count)=Match_table_3(2,jj); 
                   Match_table_valid_3(3,count)=jj; 
                   Match_table_valid_3(4,count)=Match_table_3(3,jj);
                   % Adding in 2018-01-11
                   % Record matchign score between 4 des, small number
                   % means relibale matching
                   Match_table_valid_3_score(1,count)= score_match_based_3(jj,1)+score_match_based_3(jj,2)+score_match_based_3(jj,3);
                   count=count+1;
                end
                
            end
            
clear des1t des2t des3 des4t;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% distRatio=0.6;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Matching based on R_features_cam_Ls_sift_des %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%camera_number=8;
%for ii=1:camera_number
%ii=1;
    %if ii~=8
        % cp_size1=size(norm_R_features_cam_Ls_sift_des{ii},2);
        % cp_size2=size(norm_R_features_cam_Ls_sift_des{ii+1},2);   
        
            % matrix of des1
            des4=norm_R_features_cam_Ls_sift_des{para3}';
            % matrix of des2
            des1t=norm_L_features_cam_Rs_sift_des{para2};
            % matrix of des3
            des2t=norm_L_features_cam_Ls_sift_des{para3};
            % matrix of des4
            des3t=norm_R_features_cam_Rs_sift_des{para2}; 
            
            for i = 1 : size(des4,1)
                dotprods_4_1 = (des4(i,:) * des1t);        % Computes vector of dot products
                dotprods_4_2 = (des4(i,:) * des2t);        % Computes vector of dot products
                dotprods_4_3 = (des4(i,:) * des3t);        % Computes vector of dot products
                
                score_4_1=acos(dotprods_4_1);% Take inverse cosine
                score_4_2=acos(dotprods_4_2);% Take inverse cosine
                score_4_3=acos(dotprods_4_3);% Take inverse cosine
                
                % Add term to score
                
                [vals_4_1,indx_4_1] = sort(score_4_1);  % Sort results
                [vals_4_2,indx_4_2] = sort(score_4_2);  % Sort results
                [vals_4_3,indx_4_3] = sort(score_4_3);  % Sort results

                % Check if nearest neighbor has angle less than distRatio times 2nd.
                if (vals_4_1(1) < distRatio * vals_4_1(2))
                match_4_1(i) = indx_4_1(1);
                else
                match_4_1(i) = 0;
                end
                % Check if nearest neighbor has angle less than distRatio times 2nd.
                if (vals_4_2(1) < distRatio * vals_4_2(2))
                match_4_2(i) = indx_4_2(1);
                else
                match_4_2(i) = 0;
                end
                % Check if nearest neighbor has angle less than distRatio times 2nd.
                if (vals_4_3(1) < distRatio * vals_4_3(2))
                match_4_3(i) = indx_4_3(1);
                else
                match_4_3(i) = 0;
                end
                % Adding in 2018-01-11
                % Record matching score 
                score_match_based_4(i,1)=vals_4_1(1);
                score_match_based_4(i,2)=vals_4_2(1);
                score_match_based_4(i,3)=vals_4_3(1);

            end
            Match_table_4=[match_4_1;match_4_2;match_4_3];
            
            % Find all three rows have non-zero value
            Match_table_size=size(Match_table_4,2);
            count=1;
            for jj=1:Match_table_size
                if (Match_table_4(1,jj)~=0) && (Match_table_4(2,jj)~=0)&&(Match_table_4(3,jj)~=0)
                   Match_table_valid_4(1,count)=Match_table_4(1,jj);
                   Match_table_valid_4(2,count)=Match_table_4(2,jj); 
                   Match_table_valid_4(3,count)=Match_table_4(3,jj); 
                   Match_table_valid_4(4,count)=jj; 
                   % Adding in 2018-01-11
                   % Record matchign score between 4 des, small number
                   % means relibale matching
                   Match_table_valid_4_score(1,count)= score_match_based_4(jj,1)+score_match_based_4(jj,2)+score_match_based_4(jj,3);
                   count=count+1;
                end
                
            end
            
clear des1t des2t des3 des4t; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Matching between Match_table_valid_1 and Match_table_valid_2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[Common_cp_1_2,ia_1_2,ib_1_2]= intersect(Match_table_valid_1', Match_table_valid_2','rows');
Common_cp_valid_1_score=Match_table_valid_1_score(ia_1_2);
Common_cp_valid_2_score=Match_table_valid_2_score(ib_1_2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Matching between Match_table_valid_3 and Match_table_valid_4
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[Common_cp_3_4,ia_3_4,ib_3_4]= intersect(Match_table_valid_3', Match_table_valid_4','rows');
Common_cp_valid_3_score=Match_table_valid_3_score(ia_3_4);
Common_cp_valid_4_score=Match_table_valid_4_score(ib_3_4);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Matching between Common_cp_1_2 and Common_cp_3_4
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[Common_cp_all_4,ia_all_4,ib_all_4]= intersect(Common_cp_1_2, Common_cp_3_4,'rows');
Common_cp_valid_score_all_4(:,1)=Common_cp_valid_1_score(ia_all_4)';
Common_cp_valid_score_all_4(:,2)=Common_cp_valid_2_score(ia_all_4)';
Common_cp_valid_score_all_4(:,3)=Common_cp_valid_3_score(ib_all_4)';
Common_cp_valid_score_all_4(:,4)=Common_cp_valid_4_score(ib_all_4)';
Common_cp_valid_score_all_4_mean=mean(Common_cp_valid_score_all_4,2);    
end