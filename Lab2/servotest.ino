#include <Servo.h>
Servo servo1;
void setup() {
servo1.attach(D4);
}

void loop() {
for(int i=0;i<7;i++)
{
servo1.write(70);    // Tell servo to go to 90 degrees

  delay(280);         // Pause to get it time to move

  servo1.write(30);   // Tell servo to go to 180 degrees

  delay(350);   
}
delay(500);
}
