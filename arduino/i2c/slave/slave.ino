#include <Wire.h>


#define SLAVE_ADDRESS 0x60
byte x = 0x00;

void setup() {
  Wire.begin(9);
  Wire.onReceive(receiveEvent);
  Serial.begin(9600);
}


void loop() {
  delay(100);
}


void receiveEvent(int bytes) {
  if(Wire.available() != 0) {
    for(int i = 0; i< bytes; i++)      {
        x = Wire.read();
        Serial.print("Received: ");
        Serial.print(x, HEX);
        Serial.print("\n");
      }
  }
}
