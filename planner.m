function path = planner(x_s,y_s,x_g,y_g,obstacles)

path_index = 1;
path(path_index,1) = x_s;
path(path_index,2) = y_s;

% while path(size(path,1),1) <= 9 && path(size(path,1),2) ~= y_g
while path(size(path,1),1) <= 9 
    
    %Slope
    m = ((y_g - path(size(path,1),2))/(x_g - path(size(path,1),1)));
    theta = atand(m);

    [obs_x,obs_y] = obstacle_check(path(path_index,1),path(path_index,2),obstacles);
    if obs_x(1,1) == 0
%         path_index = path_index + 1;
        path_x = path(path_index,1) + cosd(theta);
        path_y = path(path_index,2) + sind(theta);
        if range(path_x,path_y,obstacles) == 0
            path_index = path_index + 1;
            path(path_index,1) = path_x;
            path(path_index,2) = path_y;
        else
            path_index = path_index + 1;
            path(path_index,1) = path(path_index-1,1) + 2;
            path(path_index,2) = path(path_index,2);
        end
    elseif obs_x(1,1) == 1
        if obs_y(1,1) == 0
            path_index = path-index + 1;
            path(path_index,1) = path(path_index-1,1);
            path(path_index,2) = path(path_index-1,2) + 2;
        elseif obs_y(1,2) == 0
            path_index = path_index + 1;
            path(path_index,1) = path(path_index-1,1) - 2;
            path(path_index,2) = path(path_index-1,2);
        elseif obs_y(1,1) == 1 && obs_y(1,2) == 1
            path_index = path_index + 1;
            path(path_index,1) = path(path_index-1,1) - 2;
            path(path_index,2) = path(path_index,2);
        end
    elseif obs_y(1,1) == 1 && obs_x(1,1) == 0
        path_index = path_index + 1;
        path(path_index,1) = path(path_index-1,1) + 2;
        path(path_inedx,2) = path(path_index-1,2);
    elseif obs_y(1,2) == 1 && obs_x(1,1) == 0
        path_index = path_index + 1;
        path(path_index,1) = path(path_index-1,1) + 2;
        path(path_index,2) = path(path_index-1,2);
    end
end


