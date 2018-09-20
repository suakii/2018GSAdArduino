import meter.*;
import processing.serial.*;

Serial port;
String[] list;

Meter m, m2;

void setup() {
  size(950, 400);
  background(0);
  
  port = new Serial(this, "COM6", 9600);

  fill(120, 50, 0);
  m = new Meter(this, 25, 100);
  // Adjust font color of meter value  
  m.setTitleFontSize(20);
  m.setTitleFontName("Arial bold");
  m.setTitle("Voltage (C)");
  m.setDisplayDigitalMeterValue(true);
  
  // Meter Scale
  String[] scaleLabelsT = {"0", "1", "2", "3", "4", "5", "6", "7", "8"};
  m.setScaleLabels(scaleLabelsT);
  m.setScaleFontSize(18);
  m.setScaleFontName("Times New Roman bold");
  m.setScaleFontColor(color(200, 30, 70));
  
  m.setArcColor(color(141, 113, 178));
  m.setArcThickness(10);
  m.setMaxScaleValue(80);
  
  m.setNeedleThickness(3);
  
  m.setMinInputSignal(0);
  m.setMaxInputSignal(10);

  // A second meter for reference
  int mx = m.getMeterX();
  int my = m.getMeterY();
  int mw = m.getMeterWidth();
  
  m2 = new Meter(this, mx + mw + 20, my);
  m2.setTitleFontSize(20);
  m2.setTitleFontName("Arial bold");
  m2.setTitle("Temperature (c)");
  m2.setDisplayDigitalMeterValue(true);
  
  String[] scaleLabelsH = {"0", "10", "20", "30", "40", "50", "60", "70", "80", "90", "100"};
  m2.setScaleLabels(scaleLabelsH);
  m2.setScaleFontSize(18);
  m2.setScaleFontName("Times New Roman bold");
  m2.setScaleFontColor(color(200, 30, 70));
  
  m2.setArcColor(color(141, 113, 178));
  m2.setArcThickness(10);
  m2.setMaxScaleValue(100);
  
  m2.setNeedleThickness(3);
  
  m2.setMinInputSignal(0);
  m2.setMaxInputSignal(100);
  
}

public void draw() {
  
  textSize(30);
  fill(0, 255, 0);
  text("Voltage and Temperature", 270, 50);
  
  if (port.available() > 0) {
    String val = port.readStringUntil(10);
    list = split(val, ',');
    if (list == null)
      return;
    float vol = float(list[0]);
    float tem = float(list[1]);
    
    println("Voltage: " + vol + " v  " + "Temperature: " + tem + " c");
    
    m.updateMeter(int(vol)+1);
    m2.updateMeter(int(tem));
  }
}