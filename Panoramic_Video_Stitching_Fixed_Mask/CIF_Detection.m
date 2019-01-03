% renewed_stereo_matching_sift_running.m
% clear;clc;close all;
function CIF_Detection(frame_input)
% frame_input;
% P1: Detect CIF
renewed_stereo_feature_matching_part1(frame_input);
% P2:
renewed_stereo_feature_matching_part2(frame_input);
renewed_commonly_identified_feature_construction_running(frame_input);
renewed_stereo_feature_matching_part4(frame_input);
renewed_stereo_feature_matching_part5(frame_input);
renewed_stereo_feature_matching_part6(frame_input);
renewed_stereo_feature_matching_part7(frame_input);
end
               