function isrange = range(path_x,path_y,obstacles)

for i = 1:size(obstacles,1)
    if obstacles(i,1) <= path_x && path_x <=obstacles(i,3) && obstacles(i,2) <= path_y && path_y <= obstacles(i,6)
        isrange = 1;
        break;
    else 
        isrange = 0;
    end
end
