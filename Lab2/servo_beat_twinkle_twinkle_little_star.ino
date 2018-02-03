#include <Servo.h>
Servo servo1;
int k=0; // K is better between -10 and 10, any number that is outside this boundary might not work so well.


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
