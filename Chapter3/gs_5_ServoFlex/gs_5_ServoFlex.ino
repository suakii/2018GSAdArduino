#include <Servo.h> 

Servo servo1;
const int flexPin = A0;
void setup() 
{ 
   
  Serial.begin(9600);

  servo1.attach(9); 
} 


void loop() 
{ 
  int flexPosition; 
  int servoPosition;
  // Read the position of the flex sensor (0 to 1023):
  flexPosition = analogRead(flexPin);

  servoPosition = map(flexPosition, 600, 900, 0, 180);
  servoPosition = constrain(servoPosition, 0, 180);
  servo1.write(servoPosition);
  Serial.print("sensor: ");
  Serial.print(flexPosition);
  Serial.print("  servo: ");
  Serial.println(servoPosition);
  
  
  delay(20);  // wait 20ms between servo updates
} 


