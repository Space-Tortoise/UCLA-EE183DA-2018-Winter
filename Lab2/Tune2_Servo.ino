#include <Servo.h>
Servo servo1;

int k=0; // K is the only parameter that you need to change to get the different tempos for both the servo and the buzzer.
         // K is better between -30 and 10, any number that is outside this boundary might not work so well.
         // The positive numbers will make it faster and the negative numbers will make it slower.


int p=7*k; //I've figured out that it takes about 7ms for the servo to rotate 1 degree.



void setup() {
servo1.attach(D4);
}

void loop() {
   servo1.write(30+k); //let the servo go to the starting position.
   delay(2000); // Wait for 2 seconds and start playing.

         
   servo1.write(70); //The "drum" is fixed at 70 degree in this case.   
   delay(280-p); //By the end of this delay, the servo will reach 70 degree and hit the "drum" .  
   servo1.write(30+k);  //Start getting back to the starting position immediately after hitting the "drum" 
   delay(280-p);   //Reach the starting position by the end of this delay.

  
   servo1.write(70);  //Start moving toward 70 degree.  
   delay(280-p); //The servo hits the "drum".   
   servo1.write(30+k);  //Start getting back to the starting position immediately after hitting the "drum" 
   delay(280-p);   //Reach the starting position by the end of this delay.

  
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
   delay(800-p);        



         
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


    
         
   servo1.write(70);    
   delay(203-p);        
   servo1.write(30+k);    
   delay(280-p);         


   servo1.write(70);    
   delay(280-p);         
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
   servo1.write(30+k);   
         
  
    delay(1000);

}
