clear all; close all; clc;

Initial_State=[120;30;0]; %The initial position of the sensor corner

L_x=430; %Dimensions of the box
L_y=330;

EST_State_Wheel_Center=Initial_State-state_difference1(Initial_State(3)); 
%Calculate the state of the middle point of 2 wheels based on the state of the sensor corner.
%This point is easier to track during the process, and we can always
%transpose it back to the state of the corner when it's neccesary.

TURE_State=EST_State_Wheel_Center; %Define the the true state for simulation purpose

%%%%%%%%%%%%%% Inputs 
u{1}=[120;0]; %This is the first input, it means that "go forward by 120mm".
u{2}=[0;pi/6];%This is the second input, it means that "turn to the left by 30 degree".
u{3}=[120;0];
u{4}=[0;-2*pi/3];%This input means that "turn to the right by 120 degree".
u{5}=[-100;0];%This input means that "go backward by 100mm".
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%% Raw Measurements %%%%%%%%%%%%%%%%
%These are the made up measurements for the simulation test, we will need
%to replace them with the real raw measurements from the sensors later.
m{1}=[190;25;0];
m{2}=[223;100;pi/3];
m{3}=[92;162;pi/3];
m{4}=[49;210;pi/3];
m{5}=[140;210;pi/3];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



A=eye(3);
I=A;

P=[25 0 0;
    0 25 0;
    0 0 (pi/18)^2];

R=[25 0 0;
    0 25 0;
    0 0 (pi/18)^2];





for i=1:1:3
    

Theta=EST_State_Wheel_Center(3);

Theta_TR=TURE_State(3);

B=[cos(Theta) 0;
    sin(Theta) 0;
    0 1;];

B_TR=[cos(Theta_TR) 0;
    sin(Theta_TR) 0;
    0 1;];
TURE_State=A*TURE_State+B_TR*u{i}; 


 State_Predicted=A*EST_State_Wheel_Center+B*u{i};   % Predicted state
 K_G=P/(P+R); %Update the Kalman Gain
 
 Target_State=State_Predicted+state_difference1(State_Predicted(3));
 
 X_Predicted=Target_State(1);
 Y_Predicted=Target_State(2);
 Theta_Predicted=Target_State(3);
 
 measure=m{i};
 d_1=measure(1);
 d_2=measure(2);
 %m_angle=measure(3);
 m_angle=Target_State(3); %Choose the angle that you trust
 
 State_Measured=ones(3,1);

 if Theta_Predicted>=0
     if Theta_Predicted<(pi/2)
         Theta_1=Theta_Predicted;
         Theta_2=pi/2-Theta_Predicted;
         angle_1=atan((L_y-Y_Predicted)/(L_x-X_Predicted));
         angle_2=atan((Y_Predicted)/(L_x-X_Predicted));
         if Theta_1>=angle_1
             State_Measured(1)=L_x-d_2*sin(m_angle);
             State_Measured(2)=L_y-d_1*sin(m_angle);
             State_Measured(3)=m_angle;
         else
             if Theta_2>=angle_2
             State_Measured(1)=L_x-d_1*cos(Theta_1);
             State_Measured(2)=d_2*sin(Theta_2);
             State_Measured(3)=m_angle;
             else
             State_Measured(1)=L_x-d_1*cos(m_angle);
             State_Measured(2)=Y_Predicted;
             State_Measured(3)=m_angle;
                 
             end
         end
         
     else
         
         Theta_1=Theta_Predicted-pi/2;
         Theta_2=pi/2-Theta_1;
         angle_1=atan((L_y-Y_Predicted)/(X_Predicted));
         angle_2=atan((L_x-X_Predicted)/(L_y-Y_Predicted));
         
         if Theta_1>=angle_1
             State_Measured(1)=d_1*sin(Theta_1);
             State_Measured(2)=L_y-d_2*cos(Theta_2);
             State_Measured(3)=m_angle;
         else
             if Theta_2>=angle_2
             State_Measured(1)=L_x-d_2*sin(Theta_2);
             State_Measured(2)=L_y-d_1*cos(Theta_1);
             State_Measured(3)=m_angle;
             else
             State_Measured(1)=X_Predicted;
             State_Measured(2)=L_y-d_1*cos(Theta_1);
             State_Measured(3)=m_angle;
                 
             end
         end
         
     end
 else
     if Theta_Predicted>(-pi/2)
         Theta_1=pi/2+Theta_Predicted;
         Theta_2=pi/2-Theta_1;
         angle_1=atan((L_x-X_Predicted)/(Y_Predicted));
         angle_2=atan((X_Predicted)/(Y_Predicted));
         
         if Theta_1>=angle_1
             State_Measured(1)=L_x-d_1*sin(Theta_1);
             State_Measured(2)=d_2*cos(Theta_2);
             State_Measured(3)=m_angle;
         else
             if Theta_2>=angle_2
             State_Measured(1)=d_2*sin(Theta_2);
             State_Measured(2)=d_1*cos(Theta_1);
             State_Measured(3)=m_angle;
             else
             State_Measured(1)=X_Predicted;
             State_Measured(2)=d_1*cos(Theta_1);
             State_Measured(3)=m_angle;
                 
             end
         end
         
     else
         
         Theta_1=pi+Theta_Predicted;
         Theta_2=pi/2-Theta_1;
         angle_1=atan((Y_Predicted)/(X_Predicted));
         angle_2=atan((L_y-Y_Predicted)/(X_Predicted));
         if Theta_1>=angle_1
             State_Measured(1)=d_2*cos(Theta_2);
             State_Measured(2)=d_1*sin(Theta_1);
             State_Measured(3)=m_angle;
         else
             if Theta_2>=angle_2
             State_Measured(1)=d_1*cos(Theta_1);
             State_Measured(2)=L_y-d_2*sin(Theta_2);
             State_Measured(3)=m_angle;
             else
             State_Measured(1)=d_1*cos(Theta_1);
             State_Measured(2)=Y_Predicted;
             State_Measured(3)=m_angle;
                 
             end
         end
         
     end
 end
 
 Target_State=Target_State+K_G*(State_Measured-Target_State);
 EST_State_Wheel_Center= Target_State-state_difference1( Target_State(3));

 %EST_State=State_Predicted+K_G*(State_Measured-State_Predicted); %Update state
 P=(I-K_G)*P; %Update the state variance matrix P
 
 
end







Target_State1=EST_State_Wheel_Center+state_difference1(EST_State_Wheel_Center(3));
Target_State2=EST_State_Wheel_Center+state_difference2(EST_State_Wheel_Center(3));
Target_State3=EST_State_Wheel_Center+state_difference3(EST_State_Wheel_Center(3));
Target_State4=EST_State_Wheel_Center+state_difference4(EST_State_Wheel_Center(3));

Target_State1_TR=TURE_State+state_difference1(TURE_State(3));
Target_State2_TR=TURE_State+state_difference2(TURE_State(3));
Target_State3_TR=TURE_State+state_difference3(TURE_State(3));
Target_State4_TR=TURE_State+state_difference4(TURE_State(3));


plot_car(Target_State1_TR,Target_State2_TR,Target_State3_TR,Target_State4_TR);
hold on;
plot_car(Target_State1,Target_State2,Target_State3,Target_State4);




function z=state_difference1(current_angle)
s=sin(current_angle);
c=cos(current_angle);
z=[c -s;s c;0 0]*[86;-43];
end

function z=state_difference2(current_angle)
s=sin(current_angle);
c=cos(current_angle);
z=[c -s;s c;0 0]*[86;43];
end

function z=state_difference3(current_angle)
s=sin(current_angle);
c=cos(current_angle);
z=[c -s;s c;0 0]*[0;43];
end

function z=state_difference4(current_angle)
s=sin(current_angle);
c=cos(current_angle);
z=[c -s;s c;0 0]*[0;-43];
end

function plot_car(s1,s2,s3,s4)
x=[s1(1);s2(1);s3(1);s4(1);s1(1)];
y=[s1(2);s2(2);s3(2);s4(2);s1(2)];
plot(x,y);
axis([0 430 0 330]);
hold on;
plot(s1(1),s1(2),'o');
end
