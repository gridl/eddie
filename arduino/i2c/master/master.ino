#include <Wire.h>

#define SLAVE_ADDRESS 0x60


int x = 0;


void setup() {
  Wire.begin();
  randomSeed(analogRead(3));
  Serial.begin(9600);
}


void loop() {
  x = random(0,255);
  Serial.println("Tx: " + String(x));

  Wire.beginTransmission(SLAVE_ADDRESS);
  Wire.write(x);
  Wire.endTransmission();

  delay(1000);
}
