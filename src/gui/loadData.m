function [ point ] = loadData( fileName, blank)
%LOAD Summary of this function goes here
%   Detailed explanation goes here
%     figure; hold on; axis equal;
    raw = importdata(fileName);
    
%     [height, width]=size(raw);
    
    count = 1;
    for i = 1 : blank : 1000000
        point{count} = raw(i, :);  
        count = count + 1;
    end
    
%     length(point)
%     
%     for i = 1 : 1 : length(point)
%        pm = plot3(point{i}(1, 1), point{i}(1, 2), point{i}(1, 3), 'r.', 'markersize', 3); 
%     end
    
end
