[point, pm] = loadData('/home/yh/wholeMap.txt', 300);
[poseRt, pp] = loadOdom(icpodom1, 60);

% Rt to 7
for i = 1 : 1 : length(poseRt)
   pose7{i} = RtTo7(poseRt{i}); 
end

fprintf('select turn-left points, press Enter to end \n');

% select turn-left-points, value : 1
[X, Y] = ginput();
for i = 1 : 1 : length(pose7)
    for j = 1 : 1 : length(X)
        if (abs(X(j) - pose7{i}(1,1))) < 2 && abs(Y(j) - pose7{i}(1,2)) < 2            
            pose7{i}(1,8) = 1;           
            pl = plot3(poseRt{i}(1,4), poseRt{i}(2,4), poseRt{i}(3,4),'r*', 'markersize', 8);
        end
    end    
end

fprintf('select turn-right points, press Enter to end \n');

% select turn-right-points, value : 2
[X, Y] = ginput();
for i = 1 : 1 : length(pose7)
  for j = 1 : 1 : length(X)
      if (abs(X(j) - pose7{i}(1,1))) < 2 && abs(Y(j) - pose7{i}(1,2)) < 2            
        pose7{i}(1,8) = 2;
        pr = plot3(poseRt{i}(1,4), poseRt{i}(2,4), poseRt{i}(3,4),'b*', 'markersize', 8);
      end
  end   
end

fprintf('select fork-points, press Enter to end \n');

% select fork-points, value : 1
[X, Y] = ginput();
for i = 1 : 1 : length(pose7)
  for j = 1 : 1 : length(X)
      if (abs(X(j) - pose7{i}(1,1))) < 2 && abs(Y(j) - pose7{i}(1,2)) < 2            
        pose7{i}(1,9) = 1;
        pf = plot3(poseRt{i}(1,4), poseRt{i}(2,4), poseRt{i}(3,4),'mo', 'markersize', 8);
      end
  end   
end

legend([pm, pp, pl, pr, pf], 'map-points', 'path-points', 'turn-left-points', 'turn-right-points', 'fork-points', 'FontSize', 12);




