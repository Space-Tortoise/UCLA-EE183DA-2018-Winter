#include <Servo.h>
Servo servo1;

int k=0; // K is better between -30 and 10, any number that is outside this boundary might not work so well.
         // The positive numbers will make it faster and the negative numbers will make it slower.


int p=7*k; //I've figured out that it takes about 7ms for the servo to rotate 1 degree.

const int buzzerPin = D0; 

int duration_L=280; //long duration for the buzzer note
int duration_s=140; //short duration for the buzzer note


void setup() {
servo1.attach(D4);
pinMode(buzzerPin, OUTPUT);
}

void loop() {
  servo1.write(30+k);
delay(2000);

         
servo1.write(70);    
  delay(280-p); //by the end of this delay, the servo will reach 70 degree and hit the "drum" .
   tone(buzzerPin, frequency('c'), duration_L-p);  //At the same moment, the buzzer will play a note, 
                                                   //this is how they get synchronized.   

  servo1.write(30+k);   

  delay(280-p);   

  
  servo1.write(70);    
  delay(280-p); 
  tone(buzzerPin, frequency('c'), duration_L-p);          

  servo1.write(30+k);   

  delay(280-p);   

  
  servo1.write(70);    

  delay(280-p); 
  tone(buzzerPin, frequency('c'), duration_L-p);          

  servo1.write(40+k);   

  delay(210-p);   


    servo1.write(70);    

  delay(210-p);   
  tone(buzzerPin, frequency('d'), duration_s-p);       

  servo1.write(50+k);   

  delay(140-p);   
   servo1.write(70);
   delay(140-p);   
tone(buzzerPin, frequency('e'), duration_s-p);  
   
    servo1.write(30+k);   

  delay(280-p);   


  
  servo1.write(70);    

  delay(280-p); 
  tone(buzzerPin, frequency('e'), duration_s-p);          
    servo1.write(40+k);    

  delay(210-p);        



   servo1.write(70);    

  delay(210-p);  
  tone(buzzerPin, frequency('d'), duration_s-p);        

  servo1.write(50+k);   

  delay(140-p);   
   servo1.write(70);
   delay(140-p); 
   tone(buzzerPin, frequency('e'), duration_s-p);    
    servo1.write(30+k);   
    delay(280-p);         

      servo1.write(70);    

  delay(280-p); 
  tone(buzzerPin, frequency('f'), duration_s-p);         

  servo1.write(50+k);   

  delay(140-p);   
   servo1.write(70);
   delay(140-p);   
   tone(buzzerPin, frequency('g'), duration_s-p);  
    servo1.write(45+k);   
    delay(280-p);        
    delay(500-p);




    servo1.write(70);    
  delay(203-p); 
  tone(buzzerPin, frequency('C'), duration_s-p);          
  servo1.write(50+k);   
  delay(140-p);   
   servo1.write(70);
   delay(140-p); 
   tone(buzzerPin, frequency('C'), duration_s-p);    
   servo1.write(50+k);   
  delay(140-p);   
   servo1.write(70);
   delay(140-p);
   tone(buzzerPin, frequency('C'), duration_s-p);     
    servo1.write(45+k);   
    delay(203-p);         



    servo1.write(70);    
  delay(203-p); 
  tone(buzzerPin, frequency('g'), duration_s-p);          
  servo1.write(50+k);   
  delay(140-p);   
   servo1.write(70);
   delay(140-p); 
   tone(buzzerPin, frequency('g'), duration_s-p);    
   servo1.write(50+k);   
  delay(140-p);   
   servo1.write(70);
   delay(140-p);
   tone(buzzerPin, frequency('g'), duration_s-p);     
    servo1.write(45+k);   
    delay(203-p);         



    servo1.write(70);    
  delay(203-p); 
  tone(buzzerPin, frequency('e'), duration_s-p);          
  servo1.write(50+k);   
  delay(140-p);   
   servo1.write(70);
   delay(140-p); 
   tone(buzzerPin, frequency('e'), duration_s-p);    
   servo1.write(50+k);   
  delay(140-p);   
   servo1.write(70);
   delay(140-p);
   tone(buzzerPin, frequency('e'), duration_s-p);     
    servo1.write(45+k);   
    delay(203-p);       


     servo1.write(70);    
  delay(203-p); 
  tone(buzzerPin, frequency('c'), duration_s-p);          
  servo1.write(50+k);   
  delay(140-p);   
   servo1.write(70);
   delay(140-p); 
   tone(buzzerPin, frequency('c'), duration_s-p);    
   servo1.write(50+k);   
  delay(140-p);   
   servo1.write(70);
   delay(140-p);
   tone(buzzerPin, frequency('c'), duration_s-p);     
    servo1.write(45+k);   
    delay(203-p);       


    
  servo1.write(70);    

  delay(203-p);  
  tone(buzzerPin, frequency('g'), duration_s-p);         
    servo1.write(30+k);    

  delay(280-p);         





   servo1.write(70);    

  delay(280-p);        
tone(buzzerPin, frequency('f'), duration_s-p);   
  servo1.write(50+k);   

  delay(140-p);   
   servo1.write(70);
   delay(140-p); 
   tone(buzzerPin, frequency('e'), duration_s-p);     
    servo1.write(30+k);   
    delay(280-p);         

   servo1.write(70);    

  delay(280-p);        
tone(buzzerPin, frequency('d'), duration_s-p);   
  servo1.write(50+k);   

  delay(140-p);   
   servo1.write(70);
   delay(140-p); 
   tone(buzzerPin, frequency('c'), duration_s-p);     
    servo1.write(30+k);   
    delay(280-p);         

    
    delay(1000-p);


    

}



int frequency(char note) 
{
  // This function takes a note character (a-g), and returns the
  // corresponding frequency in Hz for the tone() function.
  
  int i;
  const int numNotes = 8;  // number of notes we're storing
  
  // The following arrays hold the note characters and their
  // corresponding frequencies. The last "C" note is uppercase
  // to separate it from the first lowercase "c". If you want to
  // add more notes, you'll need to use unique characters.

  // For the "char" (character) type, we put single characters
  // in single quotes.

  char names[] = { 'c', 'd', 'e', 'f', 'g', 'a', 'b', 'C' };
  int frequencies[] = {262, 294, 330, 349, 392, 440, 494, 523};
  
  // Now we'll search through the letters in the array, and if
  // we find it, we'll return the frequency for that note.
  
  for (i = 0; i < numNotes; i++)  // Step through the notes
  {
    if (names[i] == note)         // Is this the one?
    {
      return(frequencies[i]);     // Yes! Return the frequency
    }
  }
  return(0);  // We looked through everything and didn't find it,
              // but we still need to return a value, so return 0.
}

