#include <Servo.h>
Servo servo1;
int k=0; // K is better between -30 and 10, any number that is outside this boundary might not work so well.
         // The positive numbers will make it faster and the negative numbers will make it slower.


int p=7*k;
void setup() {
servo1.attach(D4);
}

void loop() {
  servo1.write(30+k);
delay(2000);

servo1.write(70);    

  delay(280-p);         

  servo1.write(30+k);   

  delay(280-p);   

  
  servo1.write(70);    

  delay(280-p);         

  servo1.write(30+k);   

  delay(280-p);   

  
  servo1.write(70);    

  delay(280-p);         

  servo1.write(40+k);   

  delay(210-p);   


    servo1.write(70);    

  delay(210-p);        

  servo1.write(50+k);   

  delay(140-p);   
   servo1.write(70);
   delay(140-p);   
    servo1.write(30+k);   

  delay(280-p);   


  
  servo1.write(70);    

  delay(280-p);         
    servo1.write(40+k);    

  delay(210-p);        



   servo1.write(70);    

  delay(210-p);        

  servo1.write(50+k);   

  delay(140-p);   
   servo1.write(70);
   delay(140-p);   
    servo1.write(30+k);   
    delay(280-p);         

      servo1.write(70);    

  delay(280-p);        

  servo1.write(50+k);   

  delay(140-p);   
   servo1.write(70);
   delay(140-p);   
    servo1.write(45+k);   
    delay(280-p);        
    delay(500-p);

for(int i=0; i<4;i++)
{
    servo1.write(70);    
  delay(203-p);         
  servo1.write(50+k);   
  delay(140-p);   
   servo1.write(70);
   delay(140-p);   
   servo1.write(50+k);   
  delay(140-p);   
   servo1.write(70);
   delay(140-p);   
    servo1.write(45+k);   
    delay(203-p);         
}


  servo1.write(70);    

  delay(203-p);         
    servo1.write(30+k);    

  delay(280-p);         



  for(int i=0; i<2;i++)
{

   servo1.write(70);    

  delay(280-p);        

  servo1.write(50+k);   

  delay(140-p);   
   servo1.write(70);
   delay(140-p);   
    servo1.write(30+k);   
    delay(280-p);         

}

    delay(1000-p);


    

}
