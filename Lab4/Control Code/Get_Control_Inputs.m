function [u_turn,u_move]=Get_Control_Inputs(Estimated_State,Estimation_Index,Milestones)

global Cv; %Translational coefficient of the robot
global Cr; %Rotational coefficient of the robot
global Expected_Angle;

estimated_state_center=Estimated_State-center2sensor(Estimated_State(3));

if Estimation_Index==1
    
    x_difference=Milestones(Estimation_Index*2-1)-estimated_state_center(1);
y_difference=Milestones(Estimation_Index*2)-estimated_state_center(2);
angle=atan2(y_difference,x_difference);
helper_sign=1;

moving_input_sign=sign([cos(angle);sin(angle)]'*[x_difference;y_difference]);
turning_angle=(angle-Estimated_State(3))/Cr;

moving_distance=helper_sign*moving_input_sign*(sqrt((x_difference)^2+(y_difference)^2))/Cv;
u_turn=[-turning_angle;turning_angle];
u_move=[moving_distance;moving_distance];




    Expected_Angle=slope_angle(estimated_state_center(1),estimated_state_center(2),Milestones(Estimation_Index*2-1),Milestones(Estimation_Index*2));
    
elseif Estimation_Index==2
    
    x_difference=Milestones(Estimation_Index*2-1)-estimated_state_center(1);
y_difference=Milestones(Estimation_Index*2)-estimated_state_center(2);
angle=atan2(y_difference,x_difference);
helper_sign=1;

moving_input_sign=sign([cos(angle);sin(angle)]'*[x_difference;y_difference]);
turning_angle=(angle-Estimated_State(3))/Cr;

moving_distance=helper_sign*moving_input_sign*(sqrt((x_difference)^2+(y_difference)^2))/Cv;
u_turn=[-turning_angle;turning_angle];
u_move=[moving_distance;moving_distance];

    Expected_Center_State=[Milestones(Estimation_Index*2-3);Milestones(Estimation_Index*2-2);Expected_Angle];
    Expected_State=Expected_Center_State+center2sensor(Expected_Center_State(3));
    figure(Estimation_Index-1)
    graph1=comparison_plot(Expected_State);
    hold on;
    graph2=comparison_plot(Estimated_State) ; 
    hold off;
    legend([graph1 graph2],{'Expected State','Estimated State'},'Location','southwest');
    
    Expected_Angle=slope_angle(estimated_state_center(1),estimated_state_center(2),Milestones(Estimation_Index*2-1),Milestones(Estimation_Index*2));

    
elseif Estimation_Index==3
    
  x_difference=Milestones(Estimation_Index*2-1)-estimated_state_center(1);
y_difference=Milestones(Estimation_Index*2)-estimated_state_center(2);
angle=atan2(y_difference,x_difference);


moving_input_sign=sign([cos(angle);sin(angle)]'*[x_difference;y_difference]);


  turning_angle=((angle-Estimated_State(3))-pi)/Cr; 
  helper_sign=-1;


moving_distance=helper_sign*moving_input_sign*(sqrt((x_difference)^2+(y_difference)^2))/Cv;
u_turn=[-turning_angle;turning_angle];
u_move=[moving_distance;moving_distance];  

    Expected_Center_State=[Milestones(Estimation_Index*2-3);Milestones(Estimation_Index*2-2);Expected_Angle];
    Expected_State=Expected_Center_State+center2sensor(Expected_Center_State(3));
    figure(Estimation_Index-1)
    graph1=comparison_plot(Expected_State);
    hold on;
    graph2=comparison_plot(Estimated_State) ; 
    hold off;
    legend([graph1 graph2],{'Expected State','Estimated State'},'Location','southwest');
    
   Expected_Angle=slope_angle(Milestones(Estimation_Index*2-1),Milestones(Estimation_Index*2),estimated_state_center(1),estimated_state_center(2)); 
    
elseif Estimation_Index==4
x_difference=Milestones(Estimation_Index*2-1)-estimated_state_center(1);
y_difference=Milestones(Estimation_Index*2)-estimated_state_center(2);
angle=atan2(y_difference,x_difference);


moving_input_sign=sign([cos(angle);sin(angle)]'*[x_difference;y_difference]);



  turning_angle=-Estimated_State(3)/Cr; 
  helper_sign=-1;

moving_distance=helper_sign*moving_input_sign*(abs(estimated_state_center(1)-Milestones(Estimation_Index*2-1)))/Cv;
u_turn=[-turning_angle;turning_angle];
u_move=[moving_distance;moving_distance];

    Expected_Center_State=[Milestones(Estimation_Index*2-3);Milestones(Estimation_Index*2-2);Expected_Angle];
    Expected_State=Expected_Center_State+center2sensor(Expected_Center_State(3));
    figure(Estimation_Index-1)
    graph1=comparison_plot(Expected_State);
    hold on;
    graph2=comparison_plot(Estimated_State) ; 
    hold off;
    legend([graph1 graph2],{'Expected State','Estimated State'},'Location','southwest');
    Expected_Angle=0;

else
    u_turn=[0;0];
    u_move=[0;0];
    
    Expected_Center_State=[Milestones(Estimation_Index*2-3);Milestones(Estimation_Index*2-2);Expected_Angle];
    Expected_State=Expected_Center_State+center2sensor(Expected_Center_State(3));
    figure(Estimation_Index-1)
    graph1=comparison_plot(Expected_State);
    hold on;
    graph2=comparison_plot(Estimated_State) ; 
    hold off;
    legend([graph1 graph2],{'Expected State','Estimated State'},'Location','southwest');
    
    Expected_Angle=0;
end




