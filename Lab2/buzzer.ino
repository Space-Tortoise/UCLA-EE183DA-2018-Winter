// GLOBAL VARIABLES
int speakerPin = 15 ; //Buzzer Input
int length = 15; // the number of notes// was 15 before
int incomingByte;      // a variable to read incoming serial data into
bool R = false;
char Speed = 'N'; // no signal recieved yet by default
char Song = 'T';
// ==========================
// Row your bowl
// ==========================
const int buzzerPin = 15; 
int duration_L=280; //long duration for the buzzer note
int duration_s=140; //short duration for the buzzer note
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
void playRow_buzzer(int k) {
  // K is the only parameter that you need to change to get the different tempos for both the servo and the buzzer.
         // K is better between -30 and 10, any number that is outside this boundary might not work so well.
         // The positive numbers will make it faster and the negative numbers will make it slower.
int p=7*k; //I've figured out that it takes about 7ms for the servo to rotate 1 degree.
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
// ==========================
// Twinkle Twinkle
// ==========================
// char notes[] = "ccggaag ffeeddc ggffeed ggffeed ccggaag ffeeddc "; // a space represents a rest
char notes[] = "ccggaag ffeeddc"; // a space represents a rest
int beats[] = { 1, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 1, 1, 4};
// DEFINE FUNCTIONS FOR TWINKLE LITTEL STAR
void playTone(int tone, int duration) {
  for (long i = 0; i < duration * 1000L; i += tone * 2) {
    digitalWrite(speakerPin, HIGH);
    delayMicroseconds(tone);
    digitalWrite(speakerPin, LOW);
    delayMicroseconds(tone);
  }
}
void playNote(char note, int duration) {
  char names[] = { 'c', 'd', 'e', 'f', 'g', 'a', 'b', 'C' };
  int tones[] = { 1915, 1700, 1519, 1432, 1275, 1136, 1014, 956 };
  
  // play the tone corresponding to the note name
  for (int i = 0; i < 8; i++) {
    if (names[i] == note) {
      playTone(tones[i], duration);
    }
  }
}
void playTwinkle_buzzer(int tempo){
    for (int i = 0; i < length; i++) {
    if (notes[i] == ' ') {
      delay(beats[i] * tempo); // rest
    } else {
      playNote(notes[i], beats[i] * tempo);
    }
    // pause between notes
    delay(tempo / 1); 
  }
}
void setup() {
  pinMode(speakerPin, OUTPUT);
  Serial.begin(115200);
  
}
void loop() {
 // see if there's incoming serial data:
  if (Serial.available() > 0) { // This is to check if Ready to play or not
    // read the oldest byte in the serial buffer:
    incomingByte = Serial.read();
    char signal = char(incomingByte);
    Serial.println(signal);
    if (signal == 'R') {
      R = true; // Ready signal received, set R to be true
    }
    }
  if (R) { // The following code runs only when R is true
     // Just know ready to play is not enough, we still need to know in what speed we are playing
      Serial.println("Waiting for Song Signal...");
        if (Serial.available() > 0) {
        incomingByte = Serial.read();
        char signal = char(incomingByte);
        Serial.println(signal);
        if (signal == 'T') { // play it slow
          Song = 'T';
        } else if (signal == 'W') { // play it high
          Song = 'W';
        }
        }
     if (Song == 'N') {
      // Do nothing because Song signal not received yet
     } else {
      Serial.println("Waiting for Speed Signal...");
     if (Serial.available() > 0) {
        incomingByte = Serial.read();
        char signal = char(incomingByte);
        Serial.println(signal);
        if (signal == 'L') { // play it slow
          Speed = 'L';
        } else if (signal == 'H') { // play it high
          Speed = 'H';
        }
        }
      if (Speed == 'N') {
        // Do nothing because Speed signal not received yet;
      } else if (Speed == 'L') {
        if (Song == 'T') {
          playTwinkle_buzzer(300);
        } else if (Song == 'W') {
          playRow_buzzer(-10);
        }
          // Reset
          R = false;
          Song = 'N';
          Speed = 'N';
          Serial.flush();
        } else if (Speed == 'H') {
           if (Song == 'T') {
             playTwinkle_buzzer(110);
             } else if (Song == 'W') {
              playRow_buzzer(10);
              }
          // Reset
          R = false;
          Song = 'N';
          Speed = 'N';
          Serial.flush();
        }
      }  
      } else {
        Serial.println("Waiting for Ready Signal...");
      }
  } 
