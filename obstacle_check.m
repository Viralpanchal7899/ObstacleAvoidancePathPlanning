function [obs_x,obs_y] = obstacle_check(path_x,path_y,obstacles)

% A - 2 units to right of path point 
% B - 2 units on top of path point
% C - 2 units to left of path point
% D - 2 units below the path point

A(1,1) = path_x + 1;
A(1,2) = path_y;
if range(A(1,1),A(1,2),obstacles) == 0
    obs_x(1,1) = 0;
else
    obs_x(1,1) = 1;
end

B(1,1) = path_x;
B(1,2) = path_y + 1;
if range(B(1,1),B(1,2),obstacles) == 0
    obs_y(1,1) = 0;
else
    obs_y(1,1) = 1;
end

C(1,1) = path_x - 1;
C(1,2) = path_y;
if range(C(1,1),C(1,2),obstacles) == 0
    obs_x(1,2) = 0;
else
    obs_x(1,2) = 1;
end

D(1,1) = path_x;
D(1,2) = path_y - 1;
if range (D(1,1),D(1,2),obstacles) == 0
    obs_y(1,2) = 0;
else
    obs_y(1,2) = 1;
end

end

    