#include <PinChangeInterrupt.h>


const byte interruptPin = A8;


void setup() {
  Serial.begin(9600);

  pinMode(interruptPin, INPUT_PULLUP);

  attachPCINT(digitalPinToPCINT(interruptPin), interrupt_check, HIGH);
}


void loop() {
  delay(1000);
  digitalWrite(interruptPin, HIGH);
  delay(1000);
  digitalWrite(interruptPin, LOW);
  Serial.print("i");
}


void interrupt_check() {
  Serial.print("interrupt");
}
