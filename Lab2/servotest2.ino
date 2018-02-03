#include <Servo.h>
Servo servo1;
int k=-0;
int p=7*k;
void setup() {
servo1.attach(D4);
}

void loop() {
  servo1.write(30+k);
delay(2000);

servo1.write(70);    // Tell servo to go to 90 degrees

  delay(280-p);         // Pause to get it time to move

  servo1.write(30+k);   // Tell servo to go to 180 degrees

  delay(280-p);   

  
  servo1.write(70);    // Tell servo to go to 90 degrees

  delay(280-p);         // Pause to get it time to move

  servo1.write(30+k);   // Tell servo to go to 180 degrees

  delay(280-p);   

  
  servo1.write(70);    // Tell servo to go to 90 degrees

  delay(280-p);         // Pause to get it time to move

  servo1.write(40+k);   // Tell servo to go to 180 degrees

  delay(210-p);   


    servo1.write(70);    // Tell servo to go to 90 degrees

  delay(210-p);         // Pause to get it time to move

  servo1.write(50+k);   // Tell servo to go to 180 degrees

  delay(140-p);   
   servo1.write(70);
   delay(140-p);   
    servo1.write(30+k);   // Tell servo to go to 180 degrees

  delay(280-p);   


  
  servo1.write(70);    // Tell servo to go to 90 degrees

  delay(280-p);         // Pause to get it time to move
    servo1.write(40+k);    // Tell servo to go to 90 degrees

  delay(210-p);         // Pause to get it time to move



   servo1.write(70);    // Tell servo to go to 90 degrees

  delay(210-p);         // Pause to get it time to move

  servo1.write(50+k);   // Tell servo to go to 180 degrees

  delay(140-p);   
   servo1.write(70);
   delay(140-p);   
    servo1.write(30+k);   // Tell servo to go to 180 degrees
    delay(280-p);         // Pause to get it time to move

      servo1.write(70);    // Tell servo to go to 90 degrees

  delay(280-p);         // Pause to get it time to move

  servo1.write(50+k);   // Tell servo to go to 180 degrees

  delay(140-p);   
   servo1.write(70);
   delay(140-p);   
    servo1.write(45+k);   // Tell servo to go to 180 degrees
    delay(280-p);         // Pause to get it time to move
    delay(500-p);

for(int i=0; i<4;i++)
{
    servo1.write(70);    // Tell servo to go to 90 degrees
  delay(203-p);         // Pause to get it time to move
  servo1.write(50+k);   // Tell servo to go to 180 degrees
  delay(140-p);   
   servo1.write(70);
   delay(140-p);   
   servo1.write(50+k);   // Tell servo to go to 180 degrees
  delay(140-p);   
   servo1.write(70);
   delay(140-p);   
    servo1.write(45+k);   // Tell servo to go to 180 degrees
    delay(203-p);         // Pause to get it time to move
}


  servo1.write(70);    // Tell servo to go to 90 degrees

  delay(203-p);         // Pause to get it time to move
    servo1.write(30+k);    // Tell servo to go to 90 degrees

  delay(280-p);         // Pause to get it time to move



  for(int i=0; i<2;i++)
{

   servo1.write(70);    // Tell servo to go to 90 degrees

  delay(280-p);         // Pause to get it time to move

  servo1.write(50+k);   // Tell servo to go to 180 degrees

  delay(140-p);   
   servo1.write(70);
   delay(140-p);   
    servo1.write(30+k);   // Tell servo to go to 180 degrees
    delay(280-p);         // Pause to get it time to move

}

    delay(1000-p);


    

}
