point = loadData('/home/yh/wholeMap.txt', 1000);
poseRt = loadOdom(icpodom1, 60);

% Rt to 7
for i = 1 : 1 : length(poseRt)
   pose7{i} = RtTo7(poseRt{i}); 
end

% select turn-left-points, value : 1
[X, Y] = ginput();
for i = 1 : 1 : length(pose7)
    for j = 1 : 1 : length(X)
        if (abs(X(j) - pose7{i}(1,1))) < 2 && abs(Y(j) - pose7{i}(1,2)) < 2            
            pose7{i}(1,8) = 1;           
            plot3(poseRt{i}(1,4), poseRt{i}(2,4), poseRt{i}(3,4),'g*');
        end
    end    
end

% select turn-right-points, value : 2
[X, Y] = ginput();
for i = 1 : 1 : length(pose7)
  for j = 1 : 1 : length(X)
      if (abs(X(j) - pose7{i}(1,1))) < 2 && abs(Y(j) - pose7{i}(1,2)) < 2            
        pose7{i}(1,8) = 2;
        plot3(poseRt{i}(1,4), poseRt{i}(2,4), poseRt{i}(3,4),'b*');
      end
  end   
end

