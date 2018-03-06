clear all; close all; clc;

%Get the milestones according to the current dimension settings
Milestones=Get_Milestones;


%//////////////////////// Action Required!!! //////////////////////////////
Estimated_State=[160; 100; 0];%Replace this with the real initial reading
%//////////////////////////////////////////////////////////////////////////





%//////////////////////// The Pre-Parking Process /////////////////////////      


%Feed this function with the current estimated state you get
[u_turn,u_move]=Get_Control_Inputs(Estimated_State,1,Milestones);

%Send the inputs u_turn and u_move in that order to the car and wait until the motions
%are finished. The car is supposed to turn first and then move to the next
%milestone point.When the car stops after turning and moving, calculate the next estimated
%state.



%//////////////////////// Action Required!!! //////////////////////////////
Estimated_State=[260; 200; 0.39];%Replace this with the real one
%If there are no errors at all, P=0 and Q=0, like in the simulation world,
%For the current dimension settings, it will give
%Estimated_State=[307.8990; 177.2416; 0.2923];




[u_turn,u_move]=Get_Control_Inputs(Estimated_State,2,Milestones);

%Send the inputs u_turn and u_move in that order to the car and wait until the motions
%are finished. The car is supposed to turn first and then move to the next
%milestone point.When the car stops after turning and moving, calculate the next estimated
%state.




%//////////////////////// The Post-Parking Process /////////////////////////      


%//////////////////////// Action Required!!! //////////////////////////////
Estimated_State=[410; 150; 0.1]; %Replace this with the real one
%If there are no errors at all, P=0 and Q=0, like in the simulation world,
%For the current dimension settings, it will give
%Estimated_State=[415.0000; 142.2953; 0];




[u_turn,u_move]=Get_Control_Inputs(Estimated_State,3,Milestones);

%Send the inputs u_turn and u_move in that order to the car and wait until the motions
%are finished. The car is supposed to turn first and then move to the next
%milestone point.When the car stops after turning and moving, calculate the next estimated
%state.


%//////////////////////// Action Required!!! //////////////////////////////
Estimated_State=[228; 175; -0.67];%Replace this with the real one
%If there are no errors at all, P=0 and Q=0, like in the simulation world,
%For the current dimension settings, it will give
%Estimated_State=[229.4732; 182.0130; -0.6067];



[u_turn,u_move]=Get_Control_Inputs(Estimated_State,4,Milestones);

%Send the inputs u_turn and u_move in that order to the car and wait until the motions
%are finished. The car is supposed to turn first and then move to the next
%milestone point.When the car stops after turning and moving, calculate the next estimated
%state.

%//////////////////////////////////////////////////////////////////////////
%//////////////////////    Parking Completed!     /////////////////////////
%//////////////////////////////////////////////////////////////////////////





%Though the parking is done at this point, we still need the estimated
%state of the final position for the plotting purpose.


%//////////////////////// Action Required!!! //////////////////////////////
Estimated_State=[265; 230; -0.1]; %Replace this with the real one
%If there are no errors at all, P=0 and Q=0, like in the simulation world,
%For the current dimension settings, it will give
%Estimated_State=[272.5000; 240.0000; 0];

%This final line will just plot the last graph, its return values are 0, so don't worry about it
[u_turn,u_move]=Get_Control_Inputs(Estimated_State,5,Milestones);









