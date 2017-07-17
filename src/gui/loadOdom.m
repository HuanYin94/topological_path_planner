function [ pose ] = loadOdom( odom, blank)
%LOADODOM Summary of this function goes here
%   Detailed explanation goes here
    
%     hold on; axis equal;

    count = 1;
    for i = 1 : 5*(blank + 1) : length(odom)
        pose{count} = odom(i+1 : i+4, :);
        pose{count}
        count = count + 1;
    end
    
%     for i = 1:1:length(pose)
%         p = pose{i};
%         pp = plot3(p(1,4),p(2,4),p(3,4),'k.', 'markersize', 8);
%     end

end

