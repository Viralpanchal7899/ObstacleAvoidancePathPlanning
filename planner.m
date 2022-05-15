function path = planner(x_s,y_s,x_g,y_g,obstacles)

%Slope
m = ((y_g - y_s)/(x_g - x_s));

path_index = 1;
path(path_index,1) = x_s;
path(path_index,2) = y_s;

while path(size(path,1),1) ~= x_g && path(size(path,1),2) ~= y_g
    [obs_x obs_y] = obstacle_check(path(path_index,1))
    path_index = path_index + 1;
    

