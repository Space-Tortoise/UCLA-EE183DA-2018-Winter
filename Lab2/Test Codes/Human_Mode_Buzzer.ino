const int trigPin=D1;
const int echoPin=D2;
long duration;
int distance;

const int buzzerPin = D0; 
int buzzer_duration=200;

void setup() 
{
  pinMode(trigPin,OUTPUT);
  pinMode(echoPin,INPUT);
  pinMode(buzzerPin, OUTPUT);
  
  Serial.begin(115200);
}

void loop() 
{
digitalWrite(trigPin, LOW);
delayMicroseconds(2);
digitalWrite(trigPin, HIGH);
delayMicroseconds(10); // Sets the trigPin on HIGH state for 10 micro seconds
digitalWrite(trigPin, LOW);
duration = pulseIn(echoPin, HIGH); // Reads the echoPin, returns the sound wave travel time in microseconds
distance= duration*0.034/2;// Calculating the distance
Serial.print("Distance: ");// Prints the distance on the Serial Monitor
Serial.println(distance);


if(distance<=8)
tone(buzzerPin, frequency('c'), buzzer_duration);     

if(distance>8&&distance<=16)
tone(buzzerPin, frequency('d'), buzzer_duration);   

if(distance>16&&distance<=24)
tone(buzzerPin, frequency('e'), buzzer_duration);   

if(distance>24&&distance<=32)
tone(buzzerPin, frequency('f'), buzzer_duration);   

if(distance>32&&distance<=40)
tone(buzzerPin, frequency('g'), buzzer_duration);   

if(distance>40&&distance<=48)
tone(buzzerPin, frequency('a'), buzzer_duration);   

if(distance>48&&distance<=56)
tone(buzzerPin, frequency('b'), buzzer_duration);   

if(distance>56&&distance<=64)
tone(buzzerPin, frequency('C'), buzzer_duration);

delay(150);
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
