import processing.serial.*;
PrintWriter output;
Serial myPort;   

void setup() {
  size(500, 400);
  println(Serial.list());
  output = createWriter("temp.csv"); 
  myPort = new Serial(this, Serial.list()[0], 9600);
}
void draw () {              
}
void keyPressed() {
  output.flush(); 
  output.close();
  println("finish Bye");
  exit(); 
}

void serialEvent(Serial myPort) {
 String input = myPort.readStringUntil(10);
 if (input != null) {
   print("Received: ");
   println(input);
   output.print(input);
   }
}