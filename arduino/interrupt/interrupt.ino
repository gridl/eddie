const byte ledPin = 13;
const byte interruptPin = 2;

volatile byte state = LOW;


void setup() {
  Serial.begin(9600);

  pinMode(ledPin, OUTPUT);
  pinMode(interruptPin, INPUT_PULLUP);

  attachInterrupt(digitalPinToInterrupt(interruptPin), blink, CHANGE);
}


void loop() {
  digitalWrite(ledPin, state);
  Serial.println(digitalRead(interruptPin));
  Serial.println(analogRead(interruptPin));
  delay(1000);
}

void blink() {
  state = !state;
}
