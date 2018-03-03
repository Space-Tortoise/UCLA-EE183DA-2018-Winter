clear all; close all; clc;
%% Initialization
% Constants in mm
global Cv;
global Cr;
global box_length;
global box_width;
global left_obstacle_length;
global left_obstacle_width;
global right_obstacle_length;
global right_obstacle_width;
global car_length;
global car_width;
global car_semidiagonal;
global safety_distance; %the distance we want the car to keep from the walls and obstacles



Cv = 120;
Cr = 70 * pi/180;
box_length=430;
box_width=330;
left_obstacle_length=140;
left_obstacle_width=80;
right_obstacle_length=130;
right_obstacle_width=80;
car_length=115;
car_width=85;
car_semidiagonal=sqrt(car_length^2+(car_width/2)^2);
safety_distance=5; 



% initialization
index=1;
x_ini = [140; 50; 0];
c_ini=x_ini-center2sensor(x_ini(3));

[situation,check_point]=initial_situation(c_ini(1),c_ini(2));
[start,middle,destination,inputs] = milestones;

if parking_solution_exists==0
    fprintf('Sorry, I cannot park in this situation!!!\n');   
else
    if situation==0
        
        angle1=slope_angle(c_ini(1),c_ini(2),check_point(1),check_point(2));       
        turning_angle1=angle1-c_ini(3);
        distance1=distance_between(c_ini(1),c_ini(2),check_point(1),check_point(2));              
        angle2=slope_angle(start(1),start(2),check_point(1),check_point(2));
        turning_angle2=angle2-angle1;
        distance2=distance_between(check_point(1),check_point(2),start(1),start(2));      
        turning_angle3=-angle2;
        
        pre_parking_s0_input_1=double(turning_angle1/Cr);
        pre_parking_s0_input_2=double(distance1/Cv);
        pre_parking_s0_input_3=double(turning_angle2/Cr);
        pre_parking_s0_input_4=double(-distance2/Cv);
        pre_parking_s0_input_5=double(turning_angle3/Cr);
    
        u_s0{1}=[-pre_parking_s0_input_1;pre_parking_s0_input_1]; 
        u_s0{2}=[pre_parking_s0_input_2,pre_parking_s0_input_2];
        u_s0{3}=[-pre_parking_s0_input_3;pre_parking_s0_input_3];
        u_s0{4}=[pre_parking_s0_input_4,pre_parking_s0_input_4];
        u_s0{5}=[-pre_parking_s0_input_5;pre_parking_s0_input_5];
        
        [x1, y1] = state_evo_to_sensor(x_ini, u_s0{1});
        [x2, y2] = state_evo_to_sensor(x1, u_s0{2});
        [x3, y3] = state_evo_to_sensor(x2, u_s0{3});
        [x4, y4] = state_evo_to_sensor(x3, u_s0{4});
        [x5, y5] = state_evo_to_sensor(x4, u_s0{5});
        
%{
hold on
plot_car(x_ini);
plot_car(x1);
plot_car(x2);
plot_car(x3);
plot_car(x4);
plot_car(x5);
%} 
    
      
        figure(index);
        plot_car(x_ini);
        index=1+index;
        figure(index);
        plot_car(x1);
        index=1+index;
        figure(index);
        plot_car(x2);
        index=1+index;
        figure(index);
        plot_car(x3);
        index=1+index;
        figure(index);
        plot_car(x4);
        index=1+index;
        figure(index);
        plot_car(x5);
        index=1+index;
        
    else
        distance=distance_between(c_ini(1),c_ini(2),start(1),start(2));
        angle=slope_angle(start(1),start(2),c_ini(1),c_ini(2))-c_ini(3);
        
        pre_parking_s1_input_1=double(angle/Cr);
        pre_parking_s1_input_2=double(-distance/Cv);
        pre_parking_s1_input_3=double(-angle/Cr);
    
        u_s1{1}=[-pre_parking_s1_input_1;pre_parking_s1_input_1]; 
        u_s1{2}=[pre_parking_s1_input_2,pre_parking_s1_input_2];
        u_s1{3}=[-pre_parking_s1_input_3;pre_parking_s1_input_3];
 

        [x1, y1] = state_evo_to_sensor(x_ini, u_s1{1});
        [x2, y2] = state_evo_to_sensor(x1, u_s1{2});
        [x3, y3] = state_evo_to_sensor(x2, u_s1{3});
        
%{
hold on
plot_car(x_ini);
plot_car(x1);
plot_car(x2);
plot_car(x3);
%} 
        
        
        
        figure(index);
        plot_car(x_ini);
        index=1+index;
        figure(index);
        plot_car(x1);
        index=1+index;
        figure(index);
        plot_car(x2);
        index=1+index;
        figure(index);
        plot_car(x3);
        index=1+index;


    end
    
    
    
    
    center_start = [start(1); start(2); 0];
    x_start=center_start+center2sensor(center_start(3));
  

 
    

    input_index_1=double(inputs(1));
    input_index_2=double(inputs(2));
    input_index_3=-double(inputs(1));
    input_index_4=double(inputs(3));
u{1}=[-input_index_1;input_index_1]; 
u{2}=[input_index_2,input_index_2];
u{3}=[-input_index_3;input_index_3];
u{4}=[input_index_4;input_index_4];

[x1, y1] = state_evo_to_sensor(x_start, u{1});
[x2, y2] = state_evo_to_sensor(x1, u{2});
[x3, y3] = state_evo_to_sensor(x2, u{3});
[x4, y4] = state_evo_to_sensor(x3, u{4});

%{
hold on
plot_car(x1);
plot_car(x2);
plot_car(x3);
plot_car(x4);
%}


        figure(index);
        plot_car(x1);
        index=1+index;
        figure(index);
        plot_car(x2);
        index=1+index;
        figure(index);
        plot_car(x3);
        index=1+index;
        figure(index);
        plot_car(x4);

end












function [x_next, y] = state_evo_to_sensor(x_before, u)
%   State Evolution, may want to add noise for simulation purposes

global box_length;
global box_width;
    b = bfunction(x_before, u);
    x_next = x_before + b;
   % y = hfunction(x_next, Lx, Ly) + [10;10;10*pi/180].*wgn(3,1,1);
   y=11;
end

function plot_car(x)
%UNTITLED10 Summary of this function goes here
%   Detailed explanation goes here
global box_length;
global box_width;
global left_obstacle_length;
global left_obstacle_width;
global right_obstacle_length;
global right_obstacle_width;
obs1_x=[0;left_obstacle_length;left_obstacle_length;0;0];
obs1_y=[box_width;box_width;box_width-left_obstacle_width;box_width-left_obstacle_width;box_width];
obs2_x=[box_length-right_obstacle_length;box_length;box_length;box_length-right_obstacle_length;box_length-right_obstacle_length];
obs2_y=[box_width;box_width;box_width-right_obstacle_width;box_width-right_obstacle_width;box_width];
    [cor1, cor2, cor3, cor4] = corners(x);
    x=[cor1(1);cor2(1);cor3(1);cor4(1);cor1(1)];
    y=[cor1(2);cor2(2);cor3(2);cor4(2);cor1(2)];
    plot(x,y);
    axis([0 430 0 330]);
    hold on;
    plot(cor1(1),cor1(2),'o');
    plot(obs1_x,obs1_y,'black','LineWidth',2);
    plot(obs2_x,obs2_y,'black','LineWidth',2);
end


function [cor1,cor2,cor3,cor4] = corners(x)
% Given current state, find the x,y coordinates of the 
% four corners of the car.
% Start with the sensors corner, rotate anticlockwise 1, 2, 3 ,4
    % Constant
global car_length;
global car_width;

    % Unpack
    rx = x(1);
    ry = x(2);
    theta = x(3);
    s = sin(theta);
    c = cos(theta);
    cor1 = [rx, ry];
    cor2 = cor1 + [-car_width*s, car_width*c];
    cor3 = cor1 + [-car_length*c - car_width*s, -car_length*s+car_width*c];
    cor4 = cor1 + [-car_length*c, -car_length*s];
end

function [ b ] = bfunction(x, u)
% Constant
global Cv;
global Cr;
global car_length;
global car_width;
global car_semidiagonal;
   
    offset = atan((car_width/2)/car_length);
    theta = x(3);
    tau_L = u(1);
    tau_R = u(2);
    p_str = (tau_L * tau_R) > 0;
    c = cos(theta);
    s = sin(theta);
    a1 = theta - offset;
    a2 = theta + Cr*tau_R - offset;
    a = p_str*Cv*c*tau_R-(1-p_str)*car_semidiagonal*(cos(a1)-cos(a2));
    d = p_str*Cv*s*tau_R+(1-p_str)*car_semidiagonal*(sin(a2)-sin(a1));
    c = (1-p_str)*Cr*tau_R;
    b = [a;d;c];
    
end

function bool=parking_solution_exists %See if the parking space is big enough for parking
global box_length;
global left_obstacle_length;
global right_obstacle_length;
global car_length;
global safety_distance;

if(box_length-left_obstacle_length-right_obstacle_length-safety_distance*2<=car_length*1.3) 
    bool=0;
else
    bool=1;
end
end

function [start,middle,destination,inputs] = milestones 
%This function determines the coordinates of three important locations 
%for the post parking plan and collects the inputs to get to thoses locations    
global Cv;
global Cr;
global box_length;
global box_width;
global left_obstacle_length;
global right_obstacle_length;
global right_obstacle_width;
global car_length;
global car_width;
global safety_distance;



half_car_width=car_width/2;
half_empty_length=(box_length-left_obstacle_length-right_obstacle_length-car_length)/2;

destination_x=left_obstacle_length+half_empty_length;
destination_y=box_width-safety_distance-half_car_width;


syms x;
d=box_length-right_obstacle_length-safety_distance;
e=box_width-right_obstacle_width-safety_distance;
c=destination_y;
f=left_obstacle_length+safety_distance;
R=half_car_width;
eqn = ((x-f)/R)*sqrt((x-d)^2+(c-e)^2-R^2)-R*sqrt(1-((x-f)/R)^2) == c-e;
solx = vpa(solve(eqn, x));

middle_x=solx(1);
middle_y=destination_y;

angle1=acos((middle_x-f)/R);
angle2=pi/2-angle1;


start_x=box_length-right_obstacle_length;
start_y=middle_y-tan(angle2)*(start_x-middle_x);


input1 = -vpa(round(vpa(angle2/Cr)*100)/100);
input2=vpa(-distance_between(middle_x,middle_y,start_x,start_y)/Cv);
input3=vpa((destination_x-middle_x)/Cv);

start = [start_x, start_y];
middle = [middle_x, middle_y];
destination = [destination_x, destination_y];
inputs=[input1,input2,input3];

end

function state_difference=center2sensor(current_angle)
global car_length;
global car_width;
s=sin(current_angle);
c=cos(current_angle);
state_difference=[c -s;s c;0 0]*[car_length;-car_width/2];
end

function d=distance_between(x1,y1,x2,y2)
d=sqrt((x1-x2)^2+(y1-y2)^2);
end

function a=slope_angle(x_start,y_start,x_end,y_end)
x=x_end-x_start;
y=y_end-y_start;
a=atan2(y,x);
end

function [situation,check_point]=initial_situation(x_ini,y_ini)

global box_length;
global box_width;
global left_obstacle_length;
global left_obstacle_width;
global right_obstacle_length;
global right_obstacle_width;
global car_semidiagonal;
global safety_distance;

boundary_y_up=box_width-max(left_obstacle_width,right_obstacle_width)-car_semidiagonal-safety_distance;
boundary_y_down=car_semidiagonal+safety_distance;
boundary_x_left=car_semidiagonal+safety_distance;
boundary_x_right=box_length-car_semidiagonal-safety_distance;
parking_space_middleline_x=left_obstacle_length+(box_length-left_obstacle_length-right_obstacle_length)/2;

check_point=[parking_space_middleline_x;max(boundary_y_up,boundary_y_down)];

if x_ini>boundary_x_left&&x_ini<boundary_x_right&&y_ini<boundary_y_up&&y_ini>boundary_y_down
    situation=1;
else
    situation=0;
end


end
