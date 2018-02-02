#include <Servo.h>
Servo servo1;
void setup() {
servo1.attach(D4);
}

void loop() {
  servo1.write(30);
delay(2000);

servo1.write(70);    // Tell servo to go to 90 degrees

  delay(280);         // Pause to get it time to move

  servo1.write(30);   // Tell servo to go to 180 degrees

  delay(280);   

  
  servo1.write(70);    // Tell servo to go to 90 degrees

  delay(280);         // Pause to get it time to move

  servo1.write(30);   // Tell servo to go to 180 degrees

  delay(280);   

  
  servo1.write(70);    // Tell servo to go to 90 degrees

  delay(280);         // Pause to get it time to move

  servo1.write(40);   // Tell servo to go to 180 degrees

  delay(210);   


    servo1.write(70);    // Tell servo to go to 90 degrees

  delay(210);         // Pause to get it time to move

  servo1.write(50);   // Tell servo to go to 180 degrees

  delay(140);   
   servo1.write(70);
   delay(140);   
    servo1.write(30);   // Tell servo to go to 180 degrees

  delay(280);   


  
  servo1.write(70);    // Tell servo to go to 90 degrees

  delay(280);         // Pause to get it time to move
    servo1.write(40);    // Tell servo to go to 90 degrees

  delay(210);         // Pause to get it time to move



   servo1.write(70);    // Tell servo to go to 90 degrees

  delay(210);         // Pause to get it time to move

  servo1.write(50);   // Tell servo to go to 180 degrees

  delay(140);   
   servo1.write(70);
   delay(140);   
    servo1.write(30);   // Tell servo to go to 180 degrees
    delay(280);         // Pause to get it time to move

      servo1.write(70);    // Tell servo to go to 90 degrees

  delay(280);         // Pause to get it time to move

  servo1.write(50);   // Tell servo to go to 180 degrees

  delay(140);   
   servo1.write(70);
   delay(140);   
    servo1.write(45);   // Tell servo to go to 180 degrees
    delay(280);         // Pause to get it time to move
    delay(500);

for(int i=0; i<4;i++)
{
    servo1.write(70);    // Tell servo to go to 90 degrees
  delay(203);         // Pause to get it time to move
  servo1.write(50);   // Tell servo to go to 180 degrees
  delay(140);   
   servo1.write(70);
   delay(140);   
   servo1.write(50);   // Tell servo to go to 180 degrees
  delay(140);   
   servo1.write(70);
   delay(140);   
    servo1.write(45);   // Tell servo to go to 180 degrees
    delay(203);         // Pause to get it time to move
}


  servo1.write(70);    // Tell servo to go to 90 degrees

  delay(203);         // Pause to get it time to move
    servo1.write(30);    // Tell servo to go to 90 degrees

  delay(280);         // Pause to get it time to move



  for(int i=0; i<2;i++)
{

   servo1.write(70);    // Tell servo to go to 90 degrees

  delay(280);         // Pause to get it time to move

  servo1.write(50);   // Tell servo to go to 180 degrees

  delay(140);   
   servo1.write(70);
   delay(140);   
    servo1.write(30);   // Tell servo to go to 180 degrees
    delay(280);         // Pause to get it time to move

}

    delay(1000);


    

}
