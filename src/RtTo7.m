function [ pose7 ] = RtTo7( poseRt )
%RTTO7 Summary of this function goes here
%   Detailed explanation goes here

    rotm = poseRt(1:3, 1:3);
    quat = rotm2quat(rotm);
    
    pose7 = zeros(1, 7);
    
    pose7(1, 1) = poseRt(1, 4);
    pose7(1, 2) = poseRt(2, 4);
    pose7(1, 3) = poseRt(3, 4);
    pose7(1, 4 : 7) = quat;
    
    % pose(8) -> turn
    pose7(1, 8) = 0; 
    
end

