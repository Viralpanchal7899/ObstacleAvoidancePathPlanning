close all
clear all
clc

% Making Rectangular arena first of 10*10
arena = polyshape([0 10 10 0],[0 0 10 10]);
plot(arena,'Facecolor','white');

% Making Obstacles within the arena
obstacles = [1.5 2 3.5 2 3.5 4 1.5 4;
             3 6.5 5 6.5 5 8.5 3 8.5;
             6 3 8 3 8 5 6 5];
         
num_obstacles = size(obstacles,1);
for i_obs = 1:num_obstacles
    obs_x = [obstacles(i_obs,1) obstacles(i_obs,3) obstacles(i_obs,5) obstacles(i_obs,7)];
    obs_y = [obstacles(i_obs,2) obstacles(i_obs,4) obstacles(i_obs,6) obstacles(i_obs,8)];
    patch(obs_x,obs_y,'black');
end
hold on

% Declare the starting point and goal point
x_s = 2;
y_s = 6;
x_g = 9;
y_g = 3;
hold on 
plot(x_s,y_s,'*');
plot(x_g,y_g,'d');

% Calling Planner

path = planner(x_s,y_s,x_g,y_g,obstacles);
path(size(path,1),1) = x_g;
path(size(path,1),2) = y_g;

for i = 1:size(path,1)
    hold on
    plot(path(i,1),path(i,2),'ro','MarkerSize',5);
    if i>1
        hold on 
        plot([path(i,1) path(i-1,1)],[path(i,2) path(i-1,2)],'k','LineWidth',2);
    end
    pause(.1)
end

