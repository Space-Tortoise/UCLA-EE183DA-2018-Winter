This code has been created and tested on "MATLAB R2017b".
In order to run this code successfully, users must have proper MATLAB tool boxes.
Below is the link of the MATLAB tool box I used.
Without this tool box, you won't see the simulation graphics or the code won't be even compiled.


http://petercorke.com/wordpress/toolboxes/robotics-toolbox


I used 10.2 version of the tool box.
In my code, the tool box has been used for plotting job only, I used my own developed FK function and IK function.

----------------------------------------------------------------------------------------------------------------------------------------

If the code has been successfully compiled on your machine, here are some suggested steps for you to follow.
You are supposed to see 4 angles that have been initialized as 0,0,90,0 with a button below them named "Forward Kinematic", 
click that button to get started.
Now you should see a simulation graph of a human leg with 4 joints on the screen.

From here, you can basically do 3 things.

1: Plug in four values for Angle1-Angle4 and click "Forward Kinematic" button to simulate the forward kinematic movement.
Remember that it's designed to have similar joint angle ranges with a real human leg, so if you plug in some unreasonable angles for a human leg, it won't simulate.


2: Plug in X and Y coordinates and click "Inverse Kinematic" button to simulat the inverse kinematic movement. If it's reachable, it will update the angle values and move the end effector from current position to the desired position.
Keep checking the command window of the MATLAB after clicking the inverse kinematic button on the UI. If there is a solution, it will display “Success!” on the command window (not on the UI window), otherwise it will display “No solution!”.
If nothing’s been displayed on the command window, that means the program is still running.
It might take some time if the coordinate is “bad”, but it won’t take too long.


3: Adjust each joint angle manually by clicking buttons in the "Manual Angle Adjustment" section. Each "F" button will rotate the corresponding joint counter-clockwise by about 5.7 degree, each "B" button will rotate it clockwise by about 5.7 degree. Again, the range wont exceed the angle limitation, so if you don't see any change when you click one of these button, that would probably mean that the angle is about to exceed the boundary.


If you have any other troubles on running the code, feel free to contact with me.
Enjoy!
