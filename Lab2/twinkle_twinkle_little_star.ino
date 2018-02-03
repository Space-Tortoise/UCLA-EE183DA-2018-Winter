#include <Servo.h>
Servo servo1;
int k=0; // K is better between -30 and 30, any number that is outside this boundary might not work so well.
         // The positive numbers will make it faster and the negative numbers will make it slower.


int p=7*k;

void setup() {
servo1.attach(D4);
}

void loop() {
for(int i=0;i<7;i++)
{
servo1.write(70);   

  delay(280-p);         

  servo1.write(30+k);  

  delay(350-p);   
}
delay(500-p);
}
