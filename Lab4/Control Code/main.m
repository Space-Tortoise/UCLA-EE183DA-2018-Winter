clear all; close all; clc;
global Close_Enough;
global figure_index;
figure_index=0;
%Get the milestones according to the current dimension settings
Milestones=Get_Milestones;
N=length(Milestones)/2+1;



for i=1:1:N
Close_Enough=0;

%Estimated_State=[];%Replace this with the real initial reading.

while Close_Enough==0
[u_turn,u_move,u_extra_turn]=Get_Control_Inputs(Estimated_State,i,Milestones);

%Send u_turn,u_move,u_extra_turn to the car.
%Wait util the motion is done.

figure_index=figure_index+1;
if Close_Enough==0   

%Estimated_State=[];%Replace this with the real estimation reading.

end
end 
end



