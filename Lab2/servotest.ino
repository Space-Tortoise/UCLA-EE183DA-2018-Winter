#include <Servo.h>
Servo servo1;
int k=0;
int p=7*k;

void setup() {
servo1.attach(D4);
}

void loop() {
for(int i=0;i<7;i++)
{
servo1.write(70);    // Tell servo to go to 90 degrees

  delay(280-p);         // Pause to get it time to move

  servo1.write(30+k);   // Tell servo to go to 180 degrees

  delay(350-p);   
}
delay(500-p);
}
