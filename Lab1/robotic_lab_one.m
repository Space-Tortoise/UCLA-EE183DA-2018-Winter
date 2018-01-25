function varargout = robotic_lab_one(varargin)
% ROBOTIC_LAB_ONE MATLAB code for robotic_lab_one.fig
%      ROBOTIC_LAB_ONE, by itself, creates a new ROBOTIC_LAB_ONE or raises the existing
%      singleton*.
%
%      H = ROBOTIC_LAB_ONE returns the handle to a new ROBOTIC_LAB_ONE or the handle to
%      the existing singleton*.
%
%      ROBOTIC_LAB_ONE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ROBOTIC_LAB_ONE.M with the given input arguments.
%
%      ROBOTIC_LAB_ONE('Property','Value',...) creates a new ROBOTIC_LAB_ONE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before robotic_lab_one_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to robotic_lab_one_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help robotic_lab_one

% Last Modified by GUIDE v2.5 23-Jan-2018 14:49:24

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @robotic_lab_one_OpeningFcn, ...
                   'gui_OutputFcn',  @robotic_lab_one_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before robotic_lab_one is made visible.
function robotic_lab_one_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to robotic_lab_one (see VARARGIN)
global count;
count=0;
% Choose default command line output for robotic_lab_one
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);



% UIWAIT makes robotic_lab_one wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = robotic_lab_one_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% Get default command line output from handles structure
varargout{1} = handles.output;


















%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   The Core Functions Start Here   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%





function output = angle_limit( an1,an2,an3,an4 )
if an1>=-pi/6&&an1<=3*pi/4&&an2>=-5*pi/6&&an2<=0&&an3>=pi/4&&an3<=11*pi/18&&an4>=-pi/12&&an4<=pi/3
    output=1;
else
    output=0;
end


function T_05 = forward_kinematic( an1,an2,an3,an4 )
T_01=[cos(an1) -sin(an1) 0 0;sin(an1) cos(an1) 0 0;0 0 1 0;0 0 0 1];
T_12=[cos(an2) -sin(an2) 0 20;sin(an2) cos(an2) 0 0;0 0 1 0;0 0 0 1];
T_23=[cos(an3) -sin(an3) 0 18;sin(an3) cos(an3) 0 0;0 0 1 0;0 0 0 1];
T_34=[cos(an4) -sin(an4) 0 9;sin(an4) cos(an4) 0 0;0 0 1 0;0 0 0 1];
T_45=[1 0 0 5;0 1 0 0;0 0 1 0;0 0 0 1];
T_05=T_01*T_12*T_23*T_34*T_45;


function Angles = inverse_kinematic(X,Y)


stop=0;

for a1=0:1:82
    if stop==1
    break;
    end
                tem_a1(1)=(52+a1)*pi/180;
                tem_a1(2)=(52-a1)*pi/180;
    for a2=0:1:75
           if stop==1
           break;
           end
                tem_a2(1)=(-75+a2)*pi/180;
                tem_a2(2)=(-75-a2)*pi/180;
        for a3=0:1:32
               if stop==1
               break;
               end
                tem_a3(1)=(78+a3)*pi/180;
                tem_a3(2)=(78-a3)*pi/180;
            for a4=0:1:37
                   if stop==1
                   break;
                   end
                tem_a4(1)=(23+a4)*pi/180;
                tem_a4(2)=(23-a4)*pi/180;
                for i=1:1:2
                   if stop==1
                   break;
                   end
                    for j=1:1:2
                   if stop==1
                   break;
                   end
                        for k=1:1:2
                   if stop==1
                   break;
                   end
                            for l=1:1:2
                   if stop==1
                   break;
                   end
                   
    sum2=tem_a1(i)+tem_a2(j);
    sum3=tem_a1(i)+tem_a2(j)+tem_a3(k);
    sum4=tem_a1(i)+tem_a2(j)+tem_a3(k)+tem_a4(l);
    test_X=floor(5*cos(sum4)+9*cos(sum3)+18*cos(sum2)+20*cos(tem_a1(i)));
    test_Y=floor(5*sin(sum4)+9*sin(sum3)+18*sin(sum2)+20*sin(tem_a1(i)));
                                
    if test_X==X&&test_Y==Y                        
    Angles(1)=tem_a1(i);
    Angles(2)=tem_a2(j);
    Angles(3)=tem_a3(k);
    Angles(4)=tem_a4(l);
                                    
    
    Angles(5)=1;
                                    stop=1;
                                    
   end
                                
                            end
                        end
                    end
                end
                
            end
        end
    end
end
if stop==0
                                    Angles(1)=0;
                                    Angles(2)=0;
                                    Angles(3)=0;
                                    Angles(4)=0;
                                    Angles(5)=0;
end


% --- Executes on button press in Forward_Kinematic.
function Forward_Kinematic_Callback(hObject, eventdata, handles)
% hObject    handle to Forward_Kinematic (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global angle1;
global angle2;
global angle3;
global angle4;
global count;
temp_ang_1=str2double(handles.Angle_1.String)*pi/180;
temp_ang_2=str2double(handles.Angle_2.String)*pi/180;
temp_ang_3=str2double(handles.Angle_3.String)*pi/180;
temp_ang_4=str2double(handles.Angle_4.String)*pi/180;
if angle_limit(temp_ang_1,temp_ang_2,temp_ang_3,temp_ang_4)==1
    if count==0
        count=1;
angle1=temp_ang_1;
angle2=temp_ang_2;
angle3=temp_ang_3;
angle4=temp_ang_4;

Leg_Link_1=20;
Leg_Link_2=18;
Leg_Link_3=9;
Leg_Link_4=5;


L(1)=Link([0 0 Leg_Link_1 0]);
L(2)=Link([0 0 Leg_Link_2 0]);
L(3)=Link([0 0 Leg_Link_3 0]);
L(4)=Link([0 0 Leg_Link_4 0]);

Leg=SerialLink(L);
Leg.name='Robotic Human Leg';
Leg.plot([temp_ang_1 temp_ang_2 temp_ang_3 temp_ang_4]);
T=forward_kinematic(temp_ang_1,temp_ang_2,temp_ang_3,temp_ang_4);
handles.X_coordinate.String=num2str(floor(T(1,4)));
handles.Y_coordinate.String=num2str(floor(T(2,4)));

    else
        q0=[angle1 angle2 angle3 angle4];
            q1=[temp_ang_1 temp_ang_2 temp_ang_3 temp_ang_4];
    angle1=temp_ang_1;
    angle2=temp_ang_2;
    angle3=temp_ang_3;
    angle4=temp_ang_4;
    Leg_Link_1=20;
    Leg_Link_2=18;
    Leg_Link_3=9;
    Leg_Link_4=5;
L(1)=Link([0 0 Leg_Link_1 0]);
L(2)=Link([0 0 Leg_Link_2 0]);
L(3)=Link([0 0 Leg_Link_3 0]);
L(4)=Link([0 0 Leg_Link_4 0]);

Leg=SerialLink(L);
Leg.name='Robotic Human Leg';
time=0:1:19;
q=jtraj(q0,q1,time);
Leg.plot(q);

T=forward_kinematic(temp_ang_1,temp_ang_2,temp_ang_3,temp_ang_4);
handles.X_coordinate.String=num2str(floor(T(1,4)));
handles.Y_coordinate.String=num2str(floor(T(2,4)));
        
    end

    
end



% --- Executes on button press in Inverse_Kinematic.
function Inverse_Kinematic_Callback(hObject, eventdata, handles)
% hObject    handle to Inverse_Kinematic (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global angle1;
global angle2;
global angle3;
global angle4;

X = str2double(handles.X_coordinate.String);
Y = str2double(handles.Y_coordinate.String);

if X>50||X<-50||Y>50||Y<-50
    fprintf('NO solution!\n');
else


Leg_Link_1=20;
Leg_Link_2=18;
Leg_Link_3=9;
Leg_Link_4=5;
L(1)=Link([0 0 Leg_Link_1 0]);
L(2)=Link([0 0 Leg_Link_2 0]);
L(3)=Link([0 0 Leg_Link_3 0]);
L(4)=Link([0 0 Leg_Link_4 0]);

Leg=SerialLink(L);
Leg.name='Robotic Human Leg'; 
q0=[angle1 angle2 angle3 angle4];


  Angles = inverse_kinematic(X,Y);
  if Angles(5)==1
             
temp_ang_1=Angles(1);
temp_ang_2=Angles(2);
temp_ang_3=Angles(3);
temp_ang_4=Angles(4);

    fprintf('Success!\n');
    q1=[temp_ang_1 temp_ang_2 temp_ang_3 temp_ang_4];
    angle1=temp_ang_1;
    angle2=temp_ang_2;
    angle3=temp_ang_3;
    angle4=temp_ang_4;
handles.Angle_1.String = num2str(floor(temp_ang_1/pi*180));
handles.Angle_2.String = num2str(floor(temp_ang_2/pi*180));
handles.Angle_3.String = num2str(floor(temp_ang_3/pi*180));
handles.Angle_4.String = num2str(floor(temp_ang_4/pi*180));

time=0:1:19;
q=jtraj(q0,q1,time);
Leg.plot(q);
                else
                    fprintf('NO solution!\n');
  end
                    
end





% --- Executes on button press in an1_backward.
function an1_backward_Callback(hObject, eventdata, handles)
% hObject    handle to an1_backward (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global angle1;
global angle2;
global angle3;
global angle4;

if angle_limit(angle1-0.1,angle2,angle3,angle4)==1
angle1=angle1-0.1;
temp_ang_1=angle1;
temp_ang_2=angle2;
temp_ang_3=angle3;
temp_ang_4=angle4;
Leg_Link_1=20;
Leg_Link_2=18;
Leg_Link_3=9;
Leg_Link_4=5;
L(1)=Link([0 0 Leg_Link_1 0]);
L(2)=Link([0 0 Leg_Link_2 0]);
L(3)=Link([0 0 Leg_Link_3 0]);
L(4)=Link([0 0 Leg_Link_4 0]);

Leg=SerialLink(L);
Leg.name='Robotic Human Leg';
Leg.plot([temp_ang_1 temp_ang_2 temp_ang_3 temp_ang_4]);
T=forward_kinematic(temp_ang_1,temp_ang_2,temp_ang_3,temp_ang_4);
handles.X_coordinate.String=num2str(floor(T(1,4)));
handles.Y_coordinate.String=num2str(floor(T(2,4)));

handles.Angle_1.String = num2str(floor(temp_ang_1/pi*180));
handles.Angle_2.String = num2str(floor(temp_ang_2/pi*180));
handles.Angle_3.String = num2str(floor(temp_ang_3/pi*180));
handles.Angle_4.String = num2str(floor(temp_ang_4/pi*180));


end




% --- Executes on button press in an1_forward.
function an1_forward_Callback(hObject, eventdata, handles)
% hObject    handle to an1_forward (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global angle1;
global angle2;
global angle3;
global angle4;
if angle_limit(angle1+0.1,angle2,angle3,angle4)==1
angle1=angle1+0.1;
temp_ang_1=angle1;
temp_ang_2=angle2;
temp_ang_3=angle3;
temp_ang_4=angle4;
Leg_Link_1=20;
Leg_Link_2=18;
Leg_Link_3=9;
Leg_Link_4=5;
L(1)=Link([0 0 Leg_Link_1 0]);
L(2)=Link([0 0 Leg_Link_2 0]);
L(3)=Link([0 0 Leg_Link_3 0]);
L(4)=Link([0 0 Leg_Link_4 0]);

Leg=SerialLink(L);
Leg.name='Robotic Human Leg';
Leg.plot([temp_ang_1 temp_ang_2 temp_ang_3 temp_ang_4]);
T=forward_kinematic(temp_ang_1,temp_ang_2,temp_ang_3,temp_ang_4);
handles.X_coordinate.String=num2str(floor(T(1,4)));
handles.Y_coordinate.String=num2str(floor(T(2,4)));

handles.Angle_1.String = num2str(floor(temp_ang_1/pi*180));
handles.Angle_2.String = num2str(floor(temp_ang_2/pi*180));
handles.Angle_3.String = num2str(floor(temp_ang_3/pi*180));
handles.Angle_4.String = num2str(floor(temp_ang_4/pi*180));


end



% --- Executes on button press in an2_forward.
function an2_forward_Callback(hObject, eventdata, handles)
% hObject    handle to an2_forward (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global angle1;
global angle2;
global angle3;
global angle4;
if angle_limit(angle1,angle2+0.1,angle3,angle4)==1
angle2=angle2+0.1;
temp_ang_1=angle1;
temp_ang_2=angle2;
temp_ang_3=angle3;
temp_ang_4=angle4;
Leg_Link_1=20;
Leg_Link_2=18;
Leg_Link_3=9;
Leg_Link_4=5;
L(1)=Link([0 0 Leg_Link_1 0]);
L(2)=Link([0 0 Leg_Link_2 0]);
L(3)=Link([0 0 Leg_Link_3 0]);
L(4)=Link([0 0 Leg_Link_4 0]);

Leg=SerialLink(L);
Leg.name='Robotic Human Leg';
Leg.plot([temp_ang_1 temp_ang_2 temp_ang_3 temp_ang_4]);
T=forward_kinematic(temp_ang_1,temp_ang_2,temp_ang_3,temp_ang_4);
handles.X_coordinate.String=num2str(floor(T(1,4)));
handles.Y_coordinate.String=num2str(floor(T(2,4)));

handles.Angle_1.String = num2str(floor(temp_ang_1/pi*180));
handles.Angle_2.String = num2str(floor(temp_ang_2/pi*180));
handles.Angle_3.String = num2str(floor(temp_ang_3/pi*180));
handles.Angle_4.String = num2str(floor(temp_ang_4/pi*180));


end


% --- Executes on button press in an2_backward.
function an2_backward_Callback(hObject, eventdata, handles)
% hObject    handle to an2_forward (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global angle1;
global angle2;
global angle3;
global angle4;
if angle_limit(angle1,angle2-0.1,angle3,angle4)==1
angle2=angle2-0.1;
temp_ang_1=angle1;
temp_ang_2=angle2;
temp_ang_3=angle3;
temp_ang_4=angle4;
Leg_Link_1=20;
Leg_Link_2=18;
Leg_Link_3=9;
Leg_Link_4=5;
L(1)=Link([0 0 Leg_Link_1 0]);
L(2)=Link([0 0 Leg_Link_2 0]);
L(3)=Link([0 0 Leg_Link_3 0]);
L(4)=Link([0 0 Leg_Link_4 0]);

Leg=SerialLink(L);
Leg.name='Robotic Human Leg';
Leg.plot([temp_ang_1 temp_ang_2 temp_ang_3 temp_ang_4]);
T=forward_kinematic(temp_ang_1,temp_ang_2,temp_ang_3,temp_ang_4);
handles.X_coordinate.String=num2str(floor(T(1,4)));
handles.Y_coordinate.String=num2str(floor(T(2,4)));

handles.Angle_1.String = num2str(floor(temp_ang_1/pi*180));
handles.Angle_2.String = num2str(floor(temp_ang_2/pi*180));
handles.Angle_3.String = num2str(floor(temp_ang_3/pi*180));
handles.Angle_4.String = num2str(floor(temp_ang_4/pi*180));


end


% --- Executes on button press in an3_forward.
function an3_forward_Callback(hObject, eventdata, handles)
% hObject    handle to an3_forward (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global angle1;
global angle2;
global angle3;
global angle4;
if angle_limit(angle1,angle2,angle3+0.1,angle4)==1
angle3=angle3+0.1;
temp_ang_1=angle1;
temp_ang_2=angle2;
temp_ang_3=angle3;
temp_ang_4=angle4;
Leg_Link_1=20;
Leg_Link_2=18;
Leg_Link_3=9;
Leg_Link_4=5;
L(1)=Link([0 0 Leg_Link_1 0]);
L(2)=Link([0 0 Leg_Link_2 0]);
L(3)=Link([0 0 Leg_Link_3 0]);
L(4)=Link([0 0 Leg_Link_4 0]);

Leg=SerialLink(L);
Leg.name='Robotic Human Leg';
Leg.plot([temp_ang_1 temp_ang_2 temp_ang_3 temp_ang_4]);
T=forward_kinematic(temp_ang_1,temp_ang_2,temp_ang_3,temp_ang_4);
handles.X_coordinate.String=num2str(floor(T(1,4)));
handles.Y_coordinate.String=num2str(floor(T(2,4)));

handles.Angle_1.String = num2str(floor(temp_ang_1/pi*180));
handles.Angle_2.String = num2str(floor(temp_ang_2/pi*180));
handles.Angle_3.String = num2str(floor(temp_ang_3/pi*180));
handles.Angle_4.String = num2str(floor(temp_ang_4/pi*180));


end


% --- Executes on button press in an3_backward.
function an3_backward_Callback(hObject, eventdata, handles)
% hObject    handle to an3_forward (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global angle1;
global angle2;
global angle3;
global angle4;
if angle_limit(angle1,angle2,angle3-0.1,angle4)==1
angle3=angle3-0.1;
temp_ang_1=angle1;
temp_ang_2=angle2;
temp_ang_3=angle3;
temp_ang_4=angle4;
Leg_Link_1=20;
Leg_Link_2=18;
Leg_Link_3=9;
Leg_Link_4=5;
L(1)=Link([0 0 Leg_Link_1 0]);
L(2)=Link([0 0 Leg_Link_2 0]);
L(3)=Link([0 0 Leg_Link_3 0]);
L(4)=Link([0 0 Leg_Link_4 0]);

Leg=SerialLink(L);
Leg.name='Robotic Human Leg';
Leg.plot([temp_ang_1 temp_ang_2 temp_ang_3 temp_ang_4]);
T=forward_kinematic(temp_ang_1,temp_ang_2,temp_ang_3,temp_ang_4);
handles.X_coordinate.String=num2str(floor(T(1,4)));
handles.Y_coordinate.String=num2str(floor(T(2,4)));

handles.Angle_1.String = num2str(floor(temp_ang_1/pi*180));
handles.Angle_2.String = num2str(floor(temp_ang_2/pi*180));
handles.Angle_3.String = num2str(floor(temp_ang_3/pi*180));
handles.Angle_4.String = num2str(floor(temp_ang_4/pi*180));


end


% --- Executes on button press in an4_forward.
function an4_forward_Callback(hObject, eventdata, handles)
% hObject    handle to an4_forward (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global angle1;
global angle2;
global angle3;
global angle4;
if angle_limit(angle1,angle2,angle3,angle4+0.1)==1
angle4=angle4+0.1;
temp_ang_1=angle1;
temp_ang_2=angle2;
temp_ang_3=angle3;
temp_ang_4=angle4;
Leg_Link_1=20;
Leg_Link_2=18;
Leg_Link_3=9;
Leg_Link_4=5;
L(1)=Link([0 0 Leg_Link_1 0]);
L(2)=Link([0 0 Leg_Link_2 0]);
L(3)=Link([0 0 Leg_Link_3 0]);
L(4)=Link([0 0 Leg_Link_4 0]);

Leg=SerialLink(L);
Leg.name='Robotic Human Leg';
Leg.plot([temp_ang_1 temp_ang_2 temp_ang_3 temp_ang_4]);
T=forward_kinematic(temp_ang_1,temp_ang_2,temp_ang_3,temp_ang_4);
handles.X_coordinate.String=num2str(floor(T(1,4)));
handles.Y_coordinate.String=num2str(floor(T(2,4)));

handles.Angle_1.String = num2str(floor(temp_ang_1/pi*180));
handles.Angle_2.String = num2str(floor(temp_ang_2/pi*180));
handles.Angle_3.String = num2str(floor(temp_ang_3/pi*180));
handles.Angle_4.String = num2str(floor(temp_ang_4/pi*180));


end


% --- Executes on button press in an4_backward.
function an4_backward_Callback(hObject, eventdata, handles)
% hObject    handle to an4_forward (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global angle1;
global angle2;
global angle3;
global angle4;
if angle_limit(angle1,angle2,angle3,angle4-0.1)==1
angle4=angle4-0.1;
temp_ang_1=angle1;
temp_ang_2=angle2;
temp_ang_3=angle3;
temp_ang_4=angle4;
Leg_Link_1=20;
Leg_Link_2=18;
Leg_Link_3=9;
Leg_Link_4=5;
L(1)=Link([0 0 Leg_Link_1 0]);
L(2)=Link([0 0 Leg_Link_2 0]);
L(3)=Link([0 0 Leg_Link_3 0]);
L(4)=Link([0 0 Leg_Link_4 0]);
Leg=SerialLink(L);
Leg.name='Robotic Human Leg';
Leg.plot([temp_ang_1 temp_ang_2 temp_ang_3 temp_ang_4]);
T=forward_kinematic(temp_ang_1,temp_ang_2,temp_ang_3,temp_ang_4);
handles.X_coordinate.String=num2str(floor(T(1,4)));
handles.Y_coordinate.String=num2str(floor(T(2,4)));

handles.Angle_1.String = num2str(floor(temp_ang_1/pi*180));
handles.Angle_2.String = num2str(floor(temp_ang_2/pi*180));
handles.Angle_3.String = num2str(floor(temp_ang_3/pi*180));
handles.Angle_4.String = num2str(floor(temp_ang_4/pi*180));


end





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   The Core Functions End Here   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

















function Angle_1_Callback(hObject, eventdata, handles)
% hObject    handle to Angle_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Angle_1 as text this
%        str2double(get(hObject,'String')) returns contents of Angle_1 as a double


% --- Executes during object creation, after setting all properties.
function Angle_1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Angle_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows code
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Angle_2_Callback(hObject, eventdata, handles)
% hObject    handle to Angle_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Angle_2 as text is
%        str2double(get(hObject,'String')) returns contents of Angle_2 as a double


% --- Executes during object creation, after setting all properties.
function Angle_2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Angle_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows from
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Angle_3_Callback(hObject, eventdata, handles)
% hObject    handle to Angle_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Angle_3 as text lin
%        str2double(get(hObject,'String')) returns contents of Angle_3 as a double


% --- Executes during object creation, after setting all properties.
function Angle_3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Angle_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows li
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function X_coordinate_Callback(hObject, eventdata, handles)
% hObject    handle to X_coordinate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of X_coordinate as text
%        str2double(get(hObject,'String')) returns contents of X_coordinate as a double


% --- Executes during object creation, after setting all properties.
function X_coordinate_CreateFcn(hObject, eventdata, handles)
% hObject    handle to X_coordinate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Y_coordinate_Callback(hObject, eventdata, handles)
% hObject    handle to Y_coordinate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Y_coordinate as text
%        str2double(get(hObject,'String')) returns contents of Y_coordinate as a double


% --- Executes during object creation, after setting all properties.
function Y_coordinate_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Y_coordinate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Pos_Z_Callback(hObject, eventdata, handles)
% hObject    handle to Pos_Z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Pos_Z as text
%        str2double(get(hObject,'String')) returns contents of Pos_Z as a double


% --- Executes during object creation, after setting all properties.
function Pos_Z_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Pos_Z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Angle_4_Callback(hObject, eventdata, handles)
% hObject    handle to Angle_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Angle_4 as text
%        str2double(get(hObject,'String')) returns contents of Angle_4 as a double


% --- Executes during object creation, after setting all properties.
function Angle_4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Angle_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
