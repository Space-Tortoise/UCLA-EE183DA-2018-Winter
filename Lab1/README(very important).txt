This code has been created and tested on "MATLAB R2017b".
In order to run this code successfully, users must install proper MATLAB tool boxes.
Below is the link of the MATLAB tool box I used when I was writing this code.
It won't be compiled without this tool box.

http://petercorke.com/wordpress/toolboxes/robotics-toolbox

I used 10.2 mltbx format version.

------------------------------------------------------------------------------------------------------------------------

If the code has been successfully compiled on your machine, here are some suggested steps for you to follow.
You are supposed to see 4 angles that have been initialized as 0,0,90,0 with a button below them named "Forward Kinematic", 
click that button to get started.
Now you should see a simulation graph of a human leg with 4 joints on the right.

From here, you can basically do 3 things.

1: Plug in angles for Angle1-Angle4 and click "Forward Kinematic" button to simulate the forward kinematic movement.
Remember that if you plug in some unreasonable angles for a human leg, it won't simulate.

2: Plug in X and Y coordinates and click "Inverse Kinematic" button to simulat the inverse kinematic movement.
If your coordinates are not reachble, the code will ended up with printing out "No solution!" or an error.

3: Adjust each joint angle manually by clicking buttons in the "Manual Angle Adjustment" section.

Enjoy!
