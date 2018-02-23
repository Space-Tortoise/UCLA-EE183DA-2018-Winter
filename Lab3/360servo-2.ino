#include <Servo.h>

Servo servo_left;
Servo servo_right;
int stop_position=90; //For the 360 degree servo, 0 goes full speed clockwise; 90 stop spinning ;180 goes full speed counterclockwise.
int friction=5; // If the surface is smooth, make this value greater.


//Control Both Wheels
void moving_forward(int velocity,int duration)
{
  servo_left.write(stop_position+velocity);
  servo_right.write(stop_position-velocity-4);
  delay(duration);
  }
  
void moving_backward(int velocity,int duration)
{
  servo_left.write(stop_position-velocity);
  servo_right.write(stop_position+velocity);
  delay(duration);
  }

 void stop_the_car_forward(int duration)
{
  servo_left.write(stop_position);
  delay(30);
  servo_right.write(stop_position);
  delay(duration);
  }
   void stop_the_car(int duration)
{
  servo_left.write(stop_position);
  servo_right.write(stop_position);
  delay(duration);
  }
//void turn_left(int degree)

//Control a Single Wheel
void moving_forward_right_wheel(int velocity)
{
  servo_right.write(stop_position-velocity);
  
  }
void moving_forward_left_wheel(int velocity)
{
  servo_left.write(stop_position+velocity);
  
  }
void moving_backward_right_wheel(int velocity)
{
  servo_right.write(stop_position+velocity);
 
  }
 void moving_backward_left_wheel(int velocity)
{
  servo_left.write(stop_position-velocity);
  
  }
  void stop_right_wheel()
{
  servo_right.write(stop_position);

  }
   void stop_left_wheel()
{
  servo_left.write(stop_position);
  
  }


void setup() {
servo_left.attach(D0);
servo_right.attach(D1);
}


void loop() {

moving_forward(20,2000);
stop_the_car_forward(1000);

moving_forward_right_wheel(40);
moving_backward_left_wheel(40);
delay(friction*90);
stop_the_car(1000);
  


}

