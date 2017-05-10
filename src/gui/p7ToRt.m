function [ poseRt ] = p7ToRt( pose7 )
%P7TORT Summary of this function goes here
%   Detailed explanation goes here
    quat = pose7(1, 4:7);
    rotm = quat2rotm(quat);
    
    poseRt= zeros(4, 4);
    
    poseRt(1:3, 1:3) = rotm;
    
    %XYZ
    poseRt(1, 4) = pose7(1, 1);
    poseRt(2, 4) = pose7(1, 2);
    poseRt(3, 4) = pose7(1, 3);
    poseRt(4, 4) = 1;

end

