#include <ESP8266WiFi.h>
#include <Servo.h>
Servo servo1;
int r=0;
const int trigPin=D1;
const int echoPin=D2;
long duration;
int distance;
WiFiServer server(80); //Initialize the server on Port 80
const short int LED_PIN = 16;//GPIO16
void setup() {
  pinMode(trigPin,OUTPUT);
  pinMode(echoPin,INPUT);
   servo1.attach(2);

   
WiFi.mode(WIFI_AP); //Our ESP8266-12E is an AccessPoint
WiFi.softAP("Four Horsemen", "1357924680"); // Provide the (SSID, password); .
server.begin(); // Start the HTTP Server
//Looking under the hood
Serial.begin(115200);
IPAddress HTTPS_ServerIP= WiFi.softAPIP(); // Obtain the IP of the Server
Serial.print("Server IP is: "); // Print the IP to the monitor window
Serial.println(HTTPS_ServerIP);
pinMode(LED_PIN, OUTPUT); //GPIO16 is an OUTPUT pin;
digitalWrite(LED_PIN, LOW); //Initial state is OFF

}

void loop() {

  if (r==1)
  {
servo1.write(90);    // Tell servo to go to 90 degrees

  delay(100);         // Pause to get it time to move

  servo1.write(110);   // Tell servo to go to 180 degrees

  delay(100);   
  
servo1.write(90);    // Tell servo to go to 90 degrees

  delay(200);         // Pause to get it time to move

  servo1.write(110);   // Tell servo to go to 180 degrees

  delay(200);         // Pause to get it time to move

 
  }
   if (r==2)
  {
servo1.write(90);    // Tell servo to go to 90 degrees

  delay(100);         // Pause to get it time to move

  servo1.write(110);   // Tell servo to go to 180 degrees

  delay(100);   
  
servo1.write(90);    // Tell servo to go to 90 degrees

  delay(200);         // Pause to get it time to move

  servo1.write(110);   // Tell servo to go to 180 degrees

  delay(200);         // Pause to get it time to move

  servo1.write(90);    // Tell servo to go to 90 degrees

  delay(100);         // Pause to get it time to move

  servo1.write(110);   // Tell servo to go to 180 degrees

  delay(100);   
  
  }

     if (r==3)
  {
servo1.write(90);    // Tell servo to go to 90 degrees

  delay(100);         // Pause to get it time to move

  servo1.write(110);   // Tell servo to go to 180 degrees

  delay(100);   
  
servo1.write(90);    // Tell servo to go to 90 degrees

  delay(200);         // Pause to get it time to move

  servo1.write(110);   // Tell servo to go to 180 degrees

  delay(500);         // Pause to get it time to move

  
  }

     if (r==4)
  {
servo1.write(90);    // Tell servo to go to 90 degrees

  delay(100);         // Pause to get it time to move

  servo1.write(110);   // Tell servo to go to 180 degrees

  delay(100);  
  
  servo1.write(90);
  
  delay(100);  
    servo1.write(110);   // Tell servo to go to 180 degrees


  
  delay(200);  

  
  }
if(r==5)
{
digitalWrite(trigPin, LOW);
delayMicroseconds(2);
// Sets the trigPin on HIGH state for 10 micro seconds
digitalWrite(trigPin, HIGH);
delayMicroseconds(10);
digitalWrite(trigPin, LOW);
// Reads the echoPin, returns the sound wave travel time in microseconds
duration = pulseIn(echoPin, HIGH);
// Calculating the distance
distance= duration*0.034/2;
// Prints the distance on the Serial Monitor
Serial.print("Distance: ");
Serial.println(distance);
if (distance<5)
{servo1.write(90);    // Tell servo to go to 90 degrees

  delay(50);         // Pause to get it time to move

  servo1.write(110);   // Tell servo to go to 180 degrees

  delay(50);  }
if (distance>=5&&distance<10)
{
  servo1.write(90);    // Tell servo to go to 90 degrees

  delay(100);         // Pause to get it time to move

  servo1.write(110);   // Tell servo to go to 180 degrees

  delay(100);  
  }
if (distance>=10&&distance<15)
{
  servo1.write(90);    // Tell servo to go to 90 degrees

  delay(150);         // Pause to get it time to move

  servo1.write(110);   // Tell servo to go to 180 degrees

  delay(150);  
  }
if (distance>=15&&distance<20)
{servo1.write(90);    // Tell servo to go to 90 degrees

  delay(200);         // Pause to get it time to move

  servo1.write(110);   // Tell servo to go to 180 degrees

  delay(200);  
  }
if (distance>=20&&distance<25)
{
  servo1.write(90);    // Tell servo to go to 90 degrees

  delay(250);         // Pause to get it time to move

  servo1.write(110);   // Tell servo to go to 180 degrees

  delay(250);  
  }
if (distance>=25&&distance<30)
{
  servo1.write(90);    // Tell servo to go to 90 degrees

  delay(300);         // Pause to get it time to move

  servo1.write(110);   // Tell servo to go to 180 degrees

  delay(300);  
  }

}
WiFiClient client = server.available();
if (!client) {
return;
}
//Looking under the hood
Serial.println("Somebody has connected :)");
//Read what the browser has sent into a String class
//and print the request to the monitor
String request = client.readStringUntil('\r');
//Looking under the hood
Serial.println(request);
// Handle the Request
if(request.indexOf("/AI_DJ1")!=-1)
 r=1;
if(request.indexOf("/AI_DJ2")!=-1)
r=2; 
if(request.indexOf("/AI_DJ3")!=-1)
r=3; 
if(request.indexOf("/AI_DJ4")!=-1)
r=4; 
if(request.indexOf("/IMDJ")!=-1)
r=5; 

// Prepare the HTML document to respond and add buttons:

String s = "HTTP/1.1 200 OK\r\n";
s += "Content-Type: text/html\r\n\r\n";
s += "<!DOCTYPE HTML>\r\n<html>\r\n";
s += "<br><input type=\"button\" name=\"b1\" value=\"AI_DJ1\"";
s += " onclick=\"location.href='/AI_DJ1'\">";
s += "<br><br><br>";
s += "<br><input type=\"button\" name=\"b1\" value=\"AI_DJ2\"";
s += " onclick=\"location.href='/AI_DJ2'\">";
s += "<br><br><br>";
s += "<br><input type=\"button\" name=\"b1\" value=\"AI_DJ3\"";
s += " onclick=\"location.href='/AI_DJ3'\">";
s += "<br><br><br>";
s += "<br><input type=\"button\" name=\"b1\" value=\"AI_DJ4\"";
s += " onclick=\"location.href='/AI_DJ4'\">";
s += "<br><br><br>";
s += "<br><input type=\"button\" name=\"b1\" value=\"IMDJ\"";
s += " onclick=\"location.href='/IMDJ'\">";
s += "</html>\n";


//Serve the HTML document to the browser.

client.flush(); //clear previous info in the stream 
client.print(s); // Send the response to the client 
delay(1); 
Serial.println("Client disonnected"); //Looking under the hood

}
