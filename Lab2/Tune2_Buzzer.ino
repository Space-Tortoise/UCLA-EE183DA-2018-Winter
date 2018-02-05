int k=0; // K is the only parameter that you need to change to get the different tempos for both the servo and the buzzer.
         // K is better between -30 and 10, any number that is outside this boundary might not work so well.
         // The positive numbers will make it faster and the negative numbers will make it slower.


int p=7*k; //I've figured out that it takes about 7ms for the servo to rotate 1 degree.

const int buzzerPin = D0; 

int duration_L=280; //long duration for the buzzer note
int duration_s=140; //short duration for the buzzer note


void setup() {
pinMode(buzzerPin, OUTPUT);
}

void loop() {

   delay(2000); // Wait for 2 seconds and start playing.

         
  
   delay(280-p); //By the end of this delay, the servo will reach 70 degree and hit the "drum" .
   tone(buzzerPin, frequency('c'), duration_L-p);  //At the same moment, the buzzer will play a note, this is how they get synchronized.   
   delay(280-p);   //The servo will reach the starting position by the end of this delay.

  
   delay(280-p); //The servo hits the "drum".
   tone(buzzerPin, frequency('c'), duration_L-p); // The buzzer plays the note.      
   delay(280-p);   //The servo will reach the starting position by the end of this delay.

  
    
   delay(280-p); 
   tone(buzzerPin, frequency('c'), duration_L-p);           
   delay(210-p);   

  
   delay(210-p);   
   tone(buzzerPin, frequency('d'), duration_s-p);        
   delay(140-p);   
         
       
   delay(140-p);   
   tone(buzzerPin, frequency('e'), duration_s-p);  
   delay(280-p);   


 
   delay(280-p); 
   tone(buzzerPin, frequency('e'), duration_s-p);            
   delay(210-p);        


 
   delay(210-p);  
   tone(buzzerPin, frequency('d'), duration_s-p);        
   delay(140-p);   
    
         
 
   delay(140-p); 
   tone(buzzerPin, frequency('e'), duration_s-p);    
   delay(280-p);         

          
   delay(280-p); 
   tone(buzzerPin, frequency('f'), duration_s-p);         
   delay(140-p);   
    
         
   delay(140-p);   
   tone(buzzerPin, frequency('g'), duration_s-p);  
   delay(800-p);        



          
   delay(203-p); 
   tone(buzzerPin, frequency('C'), duration_s-p);           
   delay(140-p);  
               
 
   delay(140-p); 
   tone(buzzerPin, frequency('C'), duration_s-p);    
   delay(140-p);   
                 
 
   delay(140-p);
   tone(buzzerPin, frequency('C'), duration_s-p);     
   delay(203-p);         



         
   delay(203-p); 
   tone(buzzerPin, frequency('g'), duration_s-p);          
   delay(140-p);   
         
   delay(140-p); 
   tone(buzzerPin, frequency('g'), duration_s-p);     
   delay(140-p);   
         
   delay(140-p);
   tone(buzzerPin, frequency('g'), duration_s-p);     
   delay(203-p);         



   delay(203-p); 
   tone(buzzerPin, frequency('e'), duration_s-p);           
   delay(140-p);   
         
   delay(140-p); 
   tone(buzzerPin, frequency('e'), duration_s-p);     
   delay(140-p);   
         
   delay(140-p);
   tone(buzzerPin, frequency('e'), duration_s-p);     
   delay(203-p);       


         
           
   delay(203-p); 
   tone(buzzerPin, frequency('c'), duration_s-p);          
   delay(140-p);   
         
   delay(140-p); 
   tone(buzzerPin, frequency('c'), duration_s-p);    
   delay(140-p);   
         
   delay(140-p);
   tone(buzzerPin, frequency('c'), duration_s-p);     
   delay(203-p);       


    
         
   delay(203-p);  
   tone(buzzerPin, frequency('g'), duration_s-p);          
   delay(280-p);         

  
   delay(280-p);        
   tone(buzzerPin, frequency('f'), duration_s-p);   
   delay(140-p);   
         
         
   delay(140-p); 
   tone(buzzerPin, frequency('e'), duration_s-p);      
   delay(280-p);         

 
   delay(280-p);        
   tone(buzzerPin, frequency('d'), duration_s-p);   

         
   delay(140-p);   
   delay(140-p); 
   tone(buzzerPin, frequency('c'), duration_s-p);     
         
  
    delay(1000);

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
